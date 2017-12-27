##
## Lookup most recent CentOS AMI to use with EC2 instance
##

data "aws_ami" "centos" {
  owners      = ["410186602215"]
  most_recent = true

  filter {
    name      = "name"
    values    = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
    name      = "architecture"
    values    = ["x86_64"]
  }

  filter {
    name      = "root-device-type"
    values    = ["ebs"]
  }
}

##
## A data template file which allows us to reference later when provisioning a new EC2 instance with custom userdata
##

data "template_file" "magical_userdata" {
  template = "${file("templates/magical_userdata.yaml")}"

  # We can pass in SFTP credentials via terraform "TF_VAR_*" at a CI/CD level or directly from user input in the terminal.
  # This is so we don't expose sensitive information via a repository in Github / BitBucket etc...
  vars {
      sftp_username   = "${var.sftp_username}"
      sftp_password   = "${var.sftp_password}"
  }
}
