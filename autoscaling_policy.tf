#Autoscaling Policy for web server
resource "aws_autoscaling_policy" "P1-WEB-Server-AutoScaling-Policy" {
  name                   = "WEB Server AutoScaling Policy"
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.P1-WEB-Server-auscaling.id
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 70.0
  }
}

#WEB Autoscaling Group attachment to WEB Server Target Group
resource "aws_autoscaling_attachment" "P1-WEB-ASG-Attachment" {
  autoscaling_group_name = aws_autoscaling_group.P1-WEB-Server-auscaling.id
  alb_target_group_arn   = aws_alb_target_group.P1-ExtLB-Target-Group.arn
}



#Autoscaling Policy for APP Server
resource "aws_autoscaling_policy" "P1-APP-Server-AutoScaling-Policy" {
  name                   = "APP Server AutoScaling Policy"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.P1-APP-Server-auscaling.id
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}

#APP Autoscaling Group attachment to APP Server Target Group
resource "aws_autoscaling_attachment" "P1-APP-ASG-Attachment" {
  autoscaling_group_name = aws_autoscaling_group.P1-APP-Server-auscaling.id
  alb_target_group_arn   = aws_alb_target_group.P1-IntLB-Target-Group.arn
}
