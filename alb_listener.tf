#ALB Listener for Externaal LB Server
resource "aws_lb_listener" "P1-ExtLB-listener" {
  load_balancer_arn = aws_lb.P1-ExtLB.arn
  port              = var.sg-ports[1]
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.P1-ExtLB-Target-Group.arn
  }
}

#ALB Listener for Internal LB
resource "aws_lb_listener" "P1-IntLB-listener" {
  load_balancer_arn = aws_lb.P1-IntLB.arn
  port              = var.sg-ports[1]
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.P1-IntLB-Target-Group.arn
  }
}
