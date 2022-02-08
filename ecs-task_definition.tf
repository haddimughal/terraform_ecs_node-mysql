# ecs-task_definition.tf

resource "aws_ecs_task_definition" "service" {
  family                   = "${var.prefix}-task-family"
  network_mode             = "awsvpc"
  task_role_arn		   = aws_iam_role.ecs_task_execution_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = 2048
  requires_compatibilities = ["FARGATE"]
  container_definitions    = templatefile("./app.json.tpl", {
            aws_ecr_repository = aws_ecr_repository.repo.repository_url
            tag                = "latest"
            app_port           = 80
            region             = "${var.region}"
            prefix             = "${var.prefix}"
            envvars            = var.envvars
	    secvars	       = var.secvars
            port               = var.port
        })
  tags = {
    Environment = "staging"
    Application = "${var.prefix}-app"
  }
}
