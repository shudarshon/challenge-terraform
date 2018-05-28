provider "aws" {
  region  = "${var.aws_region}"
}

data "aws_availability_zones" "available" {}

resource "aws_key_pair" "SSHKeyPair" {
  key_name   = "${var.ssh_key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "DevInstanceAWS" {
  count         = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  ami           = "${var.ami_id}"
  iam_instance_profile   = "${aws_iam_instance_profile.s3_access_profile.id}"
  tags {
    Name = "wp_dev"
  }
  key_name        = "${aws_key_pair.SSHKeyPair.id}"
  subnet_id       = "${aws_subnet.wp_public1_subnet.id}"
  security_groups = [
        "${aws_security_group.wp_dev_sg.id}"
  ]

}

resource "null_resource" "ConfigureAnsibleLabelVariable" {
    provisioner "local-exec" {
      command = "echo [${var.dev_host_label}:vars] > hosts"
    }
    provisioner "local-exec" {
      command = "echo ansible_ssh_user=${var.ssh_user_name} >> hosts"
    }
    provisioner "local-exec" {
      command = "echo ansible_ssh_private_key_file=${var.public_key_path} >> hosts"
    }
    provisioner "local-exec" {
      command = "echo s3code=${aws_s3_bucket.code.bucket} >> hosts"
    }
    provisioner "local-exec" {
      command = "echo domain=${var.domain_name} >> hosts"
    }
    provisioner "local-exec" {
      command = "echo [${var.dev_host_label}] >> hosts"
    }
}

resource "null_resource" "ProvisionRemoteHostsIpToAnsibleHosts" {
  count = "${var.instance_count}"
  connection {
    type = "ssh"
    user = "${var.ssh_user_name}"
    host = "${element(aws_instance.DevInstanceAWS.*.public_ip, count.index)}"
    private_key = "${file("${var.ssh_key_path}")}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install python-setuptools python-pip -y",
      "sudo pip install httplib2"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${element(aws_instance.DevInstanceAWS.*.public_ip, count.index)} >> hosts"
  }
}

resource "null_resource" "ModifyApplyAnsiblePlayBook" {
  provisioner "local-exec" {
    command = "sed -i -e '/hosts:/ s/: .*/: ${var.dev_host_label}/' play.yml"   #change host label in playbook dynamically
  }

  provisioner "local-exec" {
    command = "sleep 10; ansible-playbook -i hosts play.yml"
  }
  depends_on = ["aws_db_instance.RDSWebApp"]
  depends_on = ["null_resource.ProvisionRemoteHostsIpToAnsibleHosts"]
}
