###
## Assumption ##
## S3 bucket is already created called "magical-terraform" with version control enabled for state recovery.
## We can store the terraform state in the s3 bucket.
###

terraform {
  required_version        = "> 0.11"

  backend "s3" {
    region                = "us-east-1"
    bucket                = "magical-terraform"
    workspace_key_prefix  = "magical"
    key                   = "magical.tfstate"
    encrypt               = "true"
    kms_key_id            = "arn:aws:kms:us-east-1:721521215441:key/4559b8a8-1bd8-4e13-bce6-4d09179e47e1"
    acl                   = "bucket-owner-full-control"
    role_arn              = "arn:aws:iam::721521215441:role/terraform"
  }
}
