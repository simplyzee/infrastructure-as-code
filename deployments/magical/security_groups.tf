##
## Allow specific IP's to SSH onto the box for development purposes.
## Outbounding port range set to allow repository updates for CentOS as well as dependency installation such as AWSCLI
##

resource "aws_security_group" "magical" {
  name = "magical"
  description = "magical security group - allow SSH access"
  vpc_id = "vpc-aa366dd2" # Assuming VPC exists - vpc-aa366dd2 (10.10.0.0/16)

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["82.129.62.226/32", "90.207.192.133/32"]
  }

  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "magical"
  }
}
