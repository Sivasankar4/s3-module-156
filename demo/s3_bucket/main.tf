provider "aws" {
  region = "us-east-1"
}

module "s3_bucket_example" {
  source = "https://github.com/Sivasankar4/s3-module-156/tree/main/module"
  
  bucket_name = local.bucket
  public_acl = local.acl
  versioning = local.versioning
}