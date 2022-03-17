terraform {
  backend "s3" {
    key    = "mercator"
    region = "eu-west-1"
  }
}
