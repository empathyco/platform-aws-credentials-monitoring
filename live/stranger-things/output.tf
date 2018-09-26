output "aws_cloudwatch_event_rule_arn" {
  value = "${module.cloudwatch.aws_cloudwatch_event_rule_arn}"
}

output "function_arn" {
  description = "The ARN of the Lambda function"
  value       = "${module.lambda.function_arn}"
}

output "function_name" {
  description = "The name of the Lambda function"
  value       = "${module.lambda.function_name}"
}

output "role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = "${module.lambda.role_arn}"
}

output "role_name" {
  description = "The name of the IAM role created for the Lambda function"
  value       = "${module.lambda.role_name}"
}
