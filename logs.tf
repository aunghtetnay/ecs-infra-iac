# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "myapp_log_group" {
  name              = var.aws_cloudwatch_log_group_name#"/ecs/myapp"
  retention_in_days = 30

  tags = {
    Name = var.aws_cloudwatch_log_group_tag_name
  }
}

resource "aws_cloudwatch_log_stream" "myapp_log_stream" {
  name           = var.aws_cloudwatch_log_stream_name #"my-log-stream"
  log_group_name = aws_cloudwatch_log_group.myapp_log_group.name
}