variable "bucket_name" {
  description = "The name of the S3 bucket."
}

variable "public_acl" {
  description = "The access control list (ACL) for the bucket."
  default     = false
  type = bool
}

variable "versioning" {
  description = "Whether versioning should be enabled for the bucket."
  type        = bool
  default     = false
}
