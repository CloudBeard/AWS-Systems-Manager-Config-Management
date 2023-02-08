resource "aws_ssm_association" "this" {
  name             = "AWS-ApplyAnsiblePlaybooks"
  association_name = "RHEL8-Ansible-Playbook"

  schedule_expression = var.ssm_cron_expression

  targets {
    key    = "tag:OS"
    values = ["RHEL8"]
  }

  output_location {
    s3_bucket_name = var.s3_bucket_name #verify
  }

  parameters = {
    SourceType = "S3"

    SourceInfo = "{\"path\":\"https://cloudbeard-test-bruh-bro.s3.amazonaws.com/RHEL8-CIS/\"}"

    InstallDependencies = "True"

    PlaybookFile = "site.yml"

    Check = "False"

    Verbose = "-vvv"

    TimeoutSeconds = "1200"

  }
}

resource "aws_s3_bucket" "name" {

}
