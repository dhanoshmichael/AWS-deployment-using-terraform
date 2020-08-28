#Autoscaling group for WEB Server
resource "aws_autoscaling_group" "P1-WEB-Server-auscaling" {
  name                      = "WEB-Server-AutoScaling-Group"
  max_size                  = 4
  min_size                  = length(var.az)
  desired_capacity          = length(var.az)
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier       = [aws_subnet.P1-Web-Priv-Subnet[0].id, aws_subnet.P1-Web-Priv-Subnet[1].id]
  launch_template {
    id      = aws_launch_template.P1-WEB-Server-Launch-Template.id
    version = "$Latest"
  }
}

#Autoscaling group from APP server
resource "aws_autoscaling_group" "P1-APP-Server-auscaling" {
  name                      = "APP-Server-AutoScaling-Group"
  max_size                  = 5
  min_size                  = length(var.az)
  desired_capacity          = length(var.az)
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier       = [aws_subnet.P1-App-Priv-Subnet[0].id, aws_subnet.P1-App-Priv-Subnet[1].id]
  launch_template {
    id      = aws_launch_template.P1-APP-Server-Launch-Template.id
    version = "$Latest"
  }
}
