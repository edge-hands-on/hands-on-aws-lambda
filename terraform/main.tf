###
# VARIABLES
###
variable aws_access_key {}
variable aws_secret_key {}
variable aws_region {
    default = "us-east-1"
}

###
# PROVIDERS
###
provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region     = var.aws_region
}

###
# RESOURCES
###
resource "aws_iam_role" "iam_role_hello_world_lambda" {
  name = "iam_role_hello_world_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_role_hello_world_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

resource "aws_lambda_function" "hello_world_lambda" {
  filename      = "../hello_world_lambda.zip"
  function_name = "hello_world_lambda"
  role          = aws_iam_role.iam_role_hello_world_lambda.arn
  handler       = "index.handler"

  source_code_hash = filebase64sha256("../hello_world_lambda.zip")

  runtime = "nodejs12.x"
}
