provider "aws" {
  region  = "eu-west-1"
  version = "1.31"

  assume_role {
    role_arn = "arn:aws:iam::<account-id>:role/Terraform"
  }
}

terraform {
  backend "s3" {}
}

module "lambda" {
  source = "../../modules/lambda"
  policy_path = "policies/policy.json"
  policy_list = ["arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"]
  function_name = "OperationMirkwood"
  handler       = "access"
  timeout       = "3"
  filename      = "./code/access.zip"
  runtime       = "go1.x"
   environment {
    variables = {
      HAZARD= "Demogorgon"
      CHANNEL = "#madmax"
      GUARD = "Eleven"
      ICON = ":key:"
      WEB_HOOK_URL = "<SLACK_WEBHOOK_URL>"
    }
  }
  tags {
    environment = "Hawkins National Laboratory"
  }
    
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"
  cloudwatch_event_name = "UpsideDown"
  schedule              = "cron(0/10 * * * ? *)"
  target_id = "UpsideDown"
  target_arn = "${module.lambda.function_arn}"
  function_name = "${module.lambda.function_name}"
 
}


