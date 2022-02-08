# ssm.tf

resource "aws_ssm_parameter" "DB_HOST" {
  name  = "/test/cred/DB_HOST"
  type  = "String"
  value = "database-1.cdbt7amarh4y.ap-southeast-1.rds.amazonaws.com"
}

resource "aws_ssm_parameter" "DB_USER" {
  name  = "/test/cred/DB_USER"
  type  = "String"
  value = "admin"
}

resource "aws_ssm_parameter" "DB_PASS" {
  name  = "/test/cred/DB_PASS"
  type  = "String"
  value = var.db_pass
}

resource "aws_ssm_parameter" "DB_NAME" {
  name  = "/test/cred/DB_NAME"
  type  = "String"
  value = "intern"
}

