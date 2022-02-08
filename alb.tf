# alb.tf

resource "aws_lb" "staging" {
  name               = "${var.prefix}-alb"
  subnets            = data.aws_subnet_ids.default.ids
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]

  tags = {
    Environment = "staging"
    Application = "${var.prefix}-app"
  }
}

