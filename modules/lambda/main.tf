resource "aws_lambda_function" "lambda_function" {
  role             = "${aws_iam_role.lambda_exec_role.arn}"
  description      = "${var.description}"
  handler          = "${var.handler}"
  runtime          = "${var.runtime}"
  filename         = "${var.filename}"
  function_name    = "${var.function_name}"
  source_code_hash = "${base64sha256(file(var.filename))}"
  environment      = ["${slice( list(var.environment), 0, length(var.environment) == 0 ? 0 : 1 )}"]
  memory_size      = "${var.memory_size}"
  timeout          = "${var.timeout}"
  tags             = "${var.tags}"
  publish          = "${var.publish}"
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_exec_role" {
  name               = "lambdaRole-${var.function_name}"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_assume_role.json}"
}

resource "aws_iam_role_policy_attachment" "lambda_basic_role_attachment" {
  role       = "${aws_iam_role.lambda_exec_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "policy_extra" {
  count       = "${length(var.policy_path)> 1 ? 1 : 0}"
  name        = "Policy-${var.function_name}"
  description = "Lambda policy for function ${var.function_name}"
  policy      = "${file(var.policy_path)}"
}

resource "aws_iam_role_policy_attachment" "lambda_extra_roles" {
  count      = "${length(var.policy_path)> 1 ? 1 : 0}"
  role       = "${aws_iam_role.lambda_exec_role.name}"
  policy_arn = "${aws_iam_policy.policy_extra.arn}"
}

resource "aws_iam_role_policy_attachment" "lambda_extra_policy_role_attachment" {
  count      = "${length(var.policy_list) > 0 ? length(var.policy_list) : 0}"
  role       = "${aws_iam_role.lambda_exec_role.name}"
  policy_arn = "${var.policy_list[count.index]}"
}

