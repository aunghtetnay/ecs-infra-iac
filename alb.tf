# alb.tf

resource "aws_alb" "main" {
  name            =  var.aws_alb_name #"myapp-load-balancer"
  subnets         = aws_subnet.public.*.id
  security_groups = [aws_security_group.lb.id]
}

resource "aws_alb_target_group" "app" {
  name        =  var.aws_target_name #"myapp-target-group"
  port        = var.app_port
  protocol    = var.target_app_portocol #"HTTP"
  vpc_id      = aws_vpc.main.id
  target_type =  var.app_target_type #"ip"

  health_check {
    healthy_threshold   = var.health_healthy_threshold #"3"
    interval            = var.health_interval #"30"
    protocol            = var.health_protocol#"HTTP"
    matcher             = var.health_matcher#"200"
    timeout             = var.health_timeout#"3"
    path                = var.health_check_path
    unhealthy_threshold = var.health_unhealthy_threshold#"2"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.id
  port              = var.app_port2
  protocol          = var.alb_listener_protocol #"HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.app.id
    type             = var.alb_listener_default_type#"forward"
  }
}