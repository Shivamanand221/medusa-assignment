resource "aws_ecs_task_definition" "medusa-repo" {
  family                   = "medusa-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name      = "medusa-container",
      image     = "905418306932.dkr.ecr.us-east-1.amazonaws.com/medusa:latest",
      essential = true,
      portMappings = [
        {
          containerPort = 9000,
          hostPort      = 9000
        }
      ]
    }
  ])
}
