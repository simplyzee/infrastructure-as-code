##
## IAM role and policy that allows us to assume a role to get temporary AWS credentials to get/put to an S3 bucket.
## This is assigned at the EC2 instance level
##

resource "aws_iam_role" "magical_batch_processor" {
  name                = "magical-batch-processor"
  assume_role_policy  = "${file("templates/assume_role_policy.json")}"
}

resource "aws_iam_instance_profile" "magical_batch_processor" {
  name = "magical-batch-processor"
  role = "${aws_iam_role.magical_batch_processor.name}"
}

resource "aws_iam_policy" "magical_batch_processor" {
  name    = "magical-batch-processor"
  policy  = "${file("templates/magical_batch_processor_role_policy.json")}"
}

resource "aws_iam_policy_attachment" "magical_batch_processor" {
  name        = "magical-batch-processor"
  roles       = ["${aws_iam_role.magical_batch_processor.name}"]
  policy_arn  = "${aws_iam_policy.magical_batch_processor.arn}"
}
