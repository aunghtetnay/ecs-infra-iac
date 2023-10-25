# variables.tf

variable "access_key" {}
variable "secret_key" {}

variable "aws_alb_name" {
  description = "Specifying the name for aws_alb"
  default = "myapp-load-balancer"
}
variable "aws_target_name" {
  description = "name of target group"
  default = "myapp-target-group"
}
variable "target_app_portocol" {
  description = "name of target protocol"
  default = "HTTP"
}
variable "app_target_type" {
  description = "name of target type"
  default = "ip"
}

variable "alb_listener_protocol" {
  # description = "name of target type"
  default = "HTTP"
}
variable "alb_listener_default_type" {
  # description = "name of target type"
  default = "forward"
}
variable "aws_ecs_cluster_name" {
  default = "myapp-cluster"
}

variable "aws_ecs_task_definition_family" {
  default = "myapp-task"
}
variable "aws_ecs_task_definition_network_mode" {
  default = "awsvpc"  
}
variable "aws_ecs_task_definition_requires_compatibilities" {
  description = "using it at two places one for aws ecs service and other task "
  default = "FARGATE" #"[ FARGATE ]"
}
variable "aws_ecs_service_launch_type" {
  default = "FARGATE"
  
}
variable "load_balancer_container_name" {
  default = "myapp"
}

variable "aws_ecs_service_name" {
  default = "myapp-service"
}
variable "aws_security_group_name" {
  default =  "myapp-load-balancer-security-group"
  description = "controls access to the ALB"
}
variable "aws_security_group_ecs_task_name" {
  default = "myapp-ecs-tasks-security-group"
  description = "allow inbound access from the ALB only"
}
variable "aws_cloudwatch_log_stream_name" {
  default = "my-log-stream"
}
variable "aws_cloudwatch_log_group_name" {
  default = "/ecs/myapp"
}
variable "aws_cloudwatch_log_group_tag_name" {
  default = "cb-log-group"
}



variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "ap-southeast-1"
}



variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "your_ecr_image_url"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}
variable "app_port2" {
  description = "Port exposed for the listener in ALB to redirect traffic to"
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 3
}

variable "health_check_path" {
  default = "/"
}
variable "health_healthy_threshold" {
  default = "3"
}
variable "health_interval" {
  default = "30"
}
variable "health_protocol" {
  default = "HTTP"
}
variable "health_matcher" {
  default = "200"
}
variable "health_timeout" {
  default = "3"
}
variable "health_unhealthy_threshold" {
  default = "2"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}