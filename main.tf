provider "aws" {
  region = "us-east-1"
}

module "s3_bucket_example" {
  source = "./modules/s3_bucket"

  bucket_name = "312321205156bucket"
}