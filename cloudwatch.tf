# cloudwatch.tf

resource "aws_cloudwatch_log_group" "dummyapi" {
  name = "${var.prefix}-log-group"

  tags = {
    Environment = "staging"
    Application = "${var.prefix}-app"
  }
}

