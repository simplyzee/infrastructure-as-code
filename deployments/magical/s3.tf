###
## Assumption ##
## S3 Bucket to store the 3rd party provider files - file.csv & output.csv
###

resource "aws_s3_bucket" "magical" {
  bucket        = "magical-files"
  acl           = "private"

  # versioning enabled for file state recovery
  versioning {
    enabled = "true"
  }
}
