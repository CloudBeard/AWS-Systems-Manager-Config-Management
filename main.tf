# module "demo_source_code_bucket" {
#   source      = "./module/s3"
#   bucket_name = "cloudbeard-source-code-test-bucket"
# }

module "demo" {
  source         = "./module/config_management_association"
  s3_bucket_name = data.aws_s3_bucket.ssm_association_bucket.bucket

  # depends_on = [
  #   module.demo_source_code_bucket
  # ]
}

module "demo_bucket" {
  source      = "./module/s3"
  bucket_name = "cloudbeard-test-bucket"

  # depends_on = [
  #   module.demo_source_code_bucket
  # ]
}

data "aws_s3_bucket" "ssm_association_bucket" {
  bucket = module.demo_bucket.bucket_name
}

# data "aws_s3_bucket" "source_code_bucket" {
#   bucket = module.demo_source_code_bucket.bucket_name
# }
