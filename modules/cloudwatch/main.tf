resource "aws_cloudwatch_event_rule" "console" {
  name        = "${var.cloudwatch_event_name}"
  description = "Cloudwatch event for lambda"

  schedule_expression = "${var.schedule}"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = "${aws_cloudwatch_event_rule.console.name}"
  target_id = "${var.target_id}"
  arn       = "${var.target_arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.console.arn}"
}
