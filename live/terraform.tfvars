terragrunt = {
  remote_state {
    backend = "s3"

    config {
      bucket         = <s3-bucket-name>
      acl            = "bucket-owner-full-control"
      key            = "<prefix>${path_relative_to_include()}/terraform.tfstate"
      region         = "eu-west-1"
      encrypt        = true
      dynamodb_table = <dynamodb_table_name>
    }
  }


  terraform {
    extra_arguments "bucket" {
      commands = ["${get_terraform_commands_that_need_vars()}"]
    }
  }
}
