variable "bucket_name" {
  description = "The name of the S3 bucket."
}

variable "bucket_acl" {
  description = "The access control list (ACL) for the bucket."
  default     = "private"
}

variable "versioning" {
  description = "Whether versioning should be enabled for the bucket."
  type        = bool
  default     = false
}