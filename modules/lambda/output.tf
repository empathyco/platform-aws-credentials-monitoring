output "function_arn" {
  description = "The ARN of the Lambda function"
  value       = "${element(aws_lambda_function.lambda_function.*.arn, 0)}"
}

output "function_name" {
  description = "The name of the Lambda function"
  value       = "${element(aws_lambda_function.lambda_function.*.function_name, 0)}"
}

output "role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = "${aws_iam_role.lambda_exec_role.arn}"
}

output "role_name" {
  description = "The name of the IAM role created for the Lambda function"
  value       = "${aws_iam_role.lambda_exec_role.name}"
}
