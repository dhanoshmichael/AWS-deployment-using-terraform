#Target Group for External Load Balancer. Target Group is autoscaling with WEB server.
resource "aws_alb_target_group" "P1-ExtLB-Target-Group" {
  name       = "P1-ExtLB-Target-Group"
  port       = var.sg-ports[1]
  protocol   = "HTTP"
  vpc_id     = aws_vpc.P1-VPC.id
  slow_start = 180
  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = var.sg-ports[1]
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200,202"
  }
  tags = {
    Name    = "P1-ExtLB Target Group"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Target Group for Internal Load Balancer. Target Group is autoscaling group with APP Server.
resource "aws_alb_target_group" "P1-IntLB-Target-Group" {
  name       = "P1-IntLB-Target-Group"
  port       = var.sg-ports[1]
  protocol   = "HTTP"
  vpc_id     = aws_vpc.P1-VPC.id
  slow_start = 180
  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = var.sg-ports[1]
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200,202"
  }
  tags = {
    Name    = "P1-IntLB Target Group"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

