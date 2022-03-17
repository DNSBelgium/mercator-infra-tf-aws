resource "aws_s3_bucket" "bucket" {
  bucket = "mercator-workshop-muppets-${data.aws_caller_identity.current.account_id}"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

#resource "aws_s3_bucket_versioning" "versioning" {
#  bucket = aws_s3_bucket.bucket.id
#  versioning_configuration {
#    status = "Enabled"
#  }
#}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "muppets_bucket" {
  value = aws_s3_bucket.bucket.bucket
}
