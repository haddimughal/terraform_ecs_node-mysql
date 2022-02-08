[
  {
    "name": "${prefix}-app",
    "image": "${aws_ecr_repository}:${tag}",
    "essential": true,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "${prefix}-service",
        "awslogs-group": "${prefix}-log-group"
      }
    },
    "portMappings": [
      {
        "containerPort": ${port},
        "hostPort": ${port},
        "protocol": "tcp"
      }
    ],
    "cpu": 1,
    "environment": [
      %{ for env_key, env_value in envvars }
      {
        "name": "${env_key}",
        "value": "${env_value}"
      },
      %{ endfor ~}
      {
        "name": "TEST_NAME",
        "value": "/path/path/testvalue"
      }
    ],
    "secrets" : [
      {
        "name" : "DB_HOST",
        "valueFrom" : "arn:aws:ssm:us-west-2:014620044081:parameter/test/cred/DB_HOST"
      },
      {
        "name" : "DB_USER",
        "valueFrom" : "arn:aws:ssm:us-west-2:014620044081:parameter/test/cred/DB_USER"
      },
      {
        "name" : "DB_PASS",
        "valueFrom" : "arn:aws:ssm:us-west-2:014620044081:parameter/test/cred/DB_PASS"
      },
      {
        "name" : "DB_NAME",
        "valueFrom" : "arn:aws:ssm:us-west-2:014620044081:parameter/test/cred/DB_NAME"
      }
    ],
    "ulimits": [
      {
        "name": "nofile",
        "softLimit": 65536,
        "hardLimit": 65536
      }
    ],
    "mountPoints": [],
    "memory": 2048,
    "volumesFrom": []
  }
]
