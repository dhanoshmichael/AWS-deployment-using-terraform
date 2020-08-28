#Bucket for ALB Access logs
#Account number needs to be added in the S3 Policy text document when implementing
resource "aws_s3_bucket" "P1-LB-Logs-Bucket" {
  bucket = "p1lblogs"
  policy = file(var.s3-lb-log-policy-path)
}

#S3 Bukcet for APP Server
resource "aws_s3_bucket" "P1-APP-Bukcet" {
  bucket = "p1appserverdata"
  acl    = "private"
}
