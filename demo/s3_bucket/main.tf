provider "aws" {
  region = "us-east-1"
}

module "s3_bucket_example" {
  source = "/home/siva/Documents/s3-module/module"
  
  bucket_name = local.bucket
  public_acl = local.acl
  versioning = local.versioning
}