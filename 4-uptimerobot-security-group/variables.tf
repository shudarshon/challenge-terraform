variable "aws_region" {}

variable "security_group_id" {
  description = "the id of the security group that these rules will be added to"
}

variable "enable_tcp" {
  description = "boolean to allow access from cloudflare to HTTP origin"
  default     = true
}

variable "enable_http" {
  description = "boolean to allow access from cloudflare to HTTP origin"
  default     = false
}

variable "enable_https" {
  description = "boolean to allow access from cloudflare to HTTP origin"
  default     = false
}

variable "enable_postgres" {
  description = "boolean to allow access from cloudflare to HTTP origin"
  default     = false
}

variable "enable_solr" {
  description = "boolean to allow access from cloudflare to HTTP origin"
  default     = false
}
