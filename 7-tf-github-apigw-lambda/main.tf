provider "aws" {
  region = "${var.aws_region}"
}

variable "github_oauth_token" {
  default = ""
}

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_account_id" {
  default = ""
}


#
# AWS Lamda
#

resource "aws_iam_policy" "cp-manager" {
    name = "cp-management"
    path = "/"
    description = "lambda pr policy"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1476919244000",
            "Effect": "Allow",
            "Action": [
                "codepipeline:CreatePipeline",
                "codepipeline:DeletePipeline",
                "codepipeline:GetPipelineState",
                "codepipeline:ListPipelines",
                "codepipeline:GetPipeline",
                "codepipeline:UpdatePipeline",
                "iam:PassRole"
            ],
            "Resource": [
                "*"
            ]
        },
        {
          "Effect": "Allow",
          "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource": "arn:aws:logs:*:*:*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "cp-manager" {
    name = "cp-management"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cp-manager-attach" {
    role = "${aws_iam_role.cp-manager.name}"
    policy_arn = "${aws_iam_policy.cp-manager.arn}"
}


resource "aws_lambda_function" "pr-handler" {
  filename         = "lambda_function.zip"  
  function_name    = "pr-handler"
  role             = "${aws_iam_role.cp-manager.arn}"
  handler          = "lambda.lambda_handler"
  source_code_hash = "${base64sha256(file("lambda_function.zip"))}"
  runtime          = "python3.6"
  memory_size      = 256
  timeout          = 300

}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.pr-handler.arn}"
  principal     = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:${aws_api_gateway_rest_api.gh.id}/*/POST/"
}

#
# AWS API Gateway
#

resource "aws_api_gateway_rest_api" "gh" {
  name        = "github"
  description = "api to handle github webhooks"
}

resource "aws_api_gateway_method" "webhooks" {
  rest_api_id = "${aws_api_gateway_rest_api.gh.id}"
  resource_id   = "${aws_api_gateway_rest_api.gh.root_resource_id}"
  http_method   = "POST"
  authorization = "NONE"
  request_parameters = {
    "method.request.header.X-GitHub-Event" = true
    "method.request.header.X-GitHub-Delivery" = true
  }
}

resource "aws_api_gateway_integration" "webhooks" {
  rest_api_id             = "${aws_api_gateway_rest_api.gh.id}"
  resource_id             = "${aws_api_gateway_rest_api.gh.root_resource_id}"
  http_method             = "${aws_api_gateway_method.webhooks.http_method}"
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${aws_lambda_function.pr-handler.arn}/invocations"
  request_parameters = {
    "integration.request.header.X-GitHub-Event" = "method.request.header.X-GitHub-Event"
  }
  request_templates = {
    "application/json" = <<EOF
{
  "body" : $input.json('$'),
  "header" : {
    "X-GitHub-Event": "$input.params('X-GitHub-Event')",
    "X-GitHub-Delivery": "$input.params('X-GitHub-Delivery')"
  }
}
EOF
  }
}

resource "aws_api_gateway_integration_response" "webhook" {
  rest_api_id = "${aws_api_gateway_rest_api.gh.id}"
  resource_id = "${aws_api_gateway_rest_api.gh.root_resource_id}"
  http_method = "${aws_api_gateway_integration.webhooks.http_method}"
  status_code = "200"

  response_templates {
    "application/json" = "$input.path('$')"
  }

  response_parameters = {
    "method.response.header.Content-Type" = "integration.response.header.Content-Type"
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  selection_pattern = ".*"
}

resource "aws_api_gateway_method_response" "200" {
  rest_api_id = "${aws_api_gateway_rest_api.gh.id}"
  resource_id = "${aws_api_gateway_rest_api.gh.root_resource_id}"
  http_method = "${aws_api_gateway_method.webhooks.http_method}"
  status_code = "200"
  response_parameters = {
    "method.response.header.Content-Type" = true
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}

resource "aws_api_gateway_deployment" "gh" {
  depends_on = ["aws_api_gateway_method.webhooks",
                "aws_api_gateway_integration.webhooks",
                "aws_api_gateway_integration_response.webhook",
                "aws_api_gateway_method_response.200"
  ]
  rest_api_id = "${aws_api_gateway_rest_api.gh.id}"
  stage_name  = "test"
   variables {
    deployed_at = "${timestamp()}"
  }
}