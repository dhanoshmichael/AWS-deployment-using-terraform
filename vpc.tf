#VPC resource
resource "aws_vpc" "P1-VPC" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_tenancy
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "P1-VPC"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "P1-IG" {
  vpc_id = aws_vpc.P1-VPC.id

  tags = {
    Name    = "P1-Internet Gateway"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#VPC Endpoint for S3 access
resource "aws_vpc_endpoint" "P1-VPC-enpoint-for-S3" {
  vpc_id            = aws_vpc.P1-VPC.id
  service_name      = "com.amazonaws.us-west-2.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.P1-Priv-RT[0].id, aws_route_table.P1-Priv-RT[1].id]
}
