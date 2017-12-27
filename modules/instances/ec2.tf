resource "aws_instance" "ec2_instances" {
  count                       = "${var.count}"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_id}"
  monitoring                  = false
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${var.vpc_security_group_ids}"]
  iam_instance_profile        = "${var.iam_instance_profile}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  private_ip                  = "${var.private_ip}"
  tags                        = "${merge(var.tags, map("Name", format("%s.%d", var.name, count.index+1)))}"
  user_data                   = "${var.user_data}"

  lifecycle {
    # set explicitly because we cannot do interpolation in terraform for lifecycle rules currently
    create_before_destroy     = true
  }
}
