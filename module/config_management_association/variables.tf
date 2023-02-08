variable "ssm_cron_expression" {
  type        = string
  description = "Cron value for schedule"
  default     = "cron(0 1 ? * * *)"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 Bucket Name"
  default     = ""
}
