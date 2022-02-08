# ecs-cluster.tf

resource "aws_ecs_cluster" "staging" {
  name = "${var.prefix}-cluster"
}
