###
## Assumption ##
## A VPC is already exists with the CIDR block 10.10.0.0/16, along with an internet gateway, subnet and security group
## Subnet ID - subnet-d7a043d8
###

module "ec2" {
  source                      = "../../modules/instances"
  name                        = "magical-batch-processor"
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-d7a043d8" # Assumption based on VPC 10.10.0.0/16
  vpc_security_group_ids      = ["${aws_security_group.magical.id}"]
  key_name                    = "magical"
  iam_instance_profile        = "${aws_iam_role.magical_batch_processor.name}"
  associate_public_ip_address = true
  user_data                   = "${data.template_file.magical_userdata.rendered}"
}
