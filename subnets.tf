#Public Subnet for resources accessible from internet
#Two availability zones. One subnet each in two availability zone
resource "aws_subnet" "P1-Pub-Subnet" {
  count                   = length(var.az)
  vpc_id                  = aws_vpc.P1-VPC.id
  availability_zone       = element(var.az, count.index)
  cidr_block              = element(var.pub_subnet_cidr, count.index)
  map_public_ip_on_launch = "true"

  tags = {
    Name    = "P1-Public Subnet ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Private subnet for Web Server
resource "aws_subnet" "P1-Web-Priv-Subnet" {
  count                   = length(var.az)
  vpc_id                  = aws_vpc.P1-VPC.id
  availability_zone       = element(var.az, count.index)
  cidr_block              = element(var.priv-web-sub-cidr, count.index)
  map_public_ip_on_launch = "false"

  tags = {
    Name    = "P1 Web Private Subnet ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Private subnet for internal load balancer
resource "aws_subnet" "P1-IntLB-Priv-Subnet" {
  count                   = length(var.az)
  vpc_id                  = aws_vpc.P1-VPC.id
  availability_zone       = element(var.az, count.index)
  cidr_block              = element(var.priv-intlb-sub-cidr, count.index)
  map_public_ip_on_launch = "false"

  tags = {
    Name    = "P1-InternalLB Private Subnet ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Private subnet for App Server
resource "aws_subnet" "P1-App-Priv-Subnet" {
  count                   = length(var.az)
  vpc_id                  = aws_vpc.P1-VPC.id
  availability_zone       = element(var.az, count.index)
  cidr_block              = element(var.priv-app-sub-cidr, count.index)
  map_public_ip_on_launch = "false"

  tags = {
    Name    = "P1-App Private Subnet ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Private subnet for RDS
resource "aws_subnet" "P1-DB-Priv-Subnet" {
  count                   = length(var.az)
  vpc_id                  = aws_vpc.P1-VPC.id
  availability_zone       = element(var.az, count.index)
  cidr_block              = element(var.priv-db-sub-cidr, count.index)
  map_public_ip_on_launch = "false"

  tags = {
    name    = "P1-App Private Subnet ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}
