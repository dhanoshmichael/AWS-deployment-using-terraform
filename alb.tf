#External Load Balancer
resource "aws_lb" "P1-ExtLB" {
  name                             = "P1-ExtLB"
  internal                         = false
  load_balancer_type               = "application"
  subnets                          = [aws_subnet.P1-Pub-Subnet[0].id, aws_subnet.P1-Pub-Subnet[1].id]
  security_groups                  = [aws_security_group.P1-ExtLB-SG.id]
  enable_cross_zone_load_balancing = false
  access_logs {
    bucket  = aws_s3_bucket.P1-LB-Logs-Bucket.bucket
    prefix  = "External-LB-Logs"
    enabled = true
  }
  tags = {
    Name    = "P1-Exteral Load Balancer"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Internal Load Balancer
resource "aws_lb" "P1-IntLB" {
  name               = "P1-IntLB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.P1-IntLB-SG.id]
  subnets            = [aws_subnet.P1-IntLB-Priv-Subnet[0].id, aws_subnet.P1-IntLB-Priv-Subnet[1].id]
  access_logs {
    bucket  = aws_s3_bucket.P1-LB-Logs-Bucket.bucket
    prefix  = "InternalLB-Logs"
    enabled = true
  }

  tags = {
    Name    = "P1-Internet LB"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}
