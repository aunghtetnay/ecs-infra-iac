[
  {
    "name": "backend",
    "image": "${backend_image}",
    "cpu": ${backend_cpu},
    "memory": ${backend_memory},
    "networkMode": "awsvpc",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/backend",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "containerPort": ${backend_port},
        "hostPort": ${backend_port}
      }
    ]
  }
]