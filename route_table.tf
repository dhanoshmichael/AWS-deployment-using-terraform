#Public Route Table
resource "aws_route_table" "P1-Pub-RT" {
  vpc_id = aws_vpc.P1-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.P1-IG.id
  }
  tags = {
    Name    = "P1-Public Route Table"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Public Route Table Association
resource "aws_route_table_association" "P1-Pub-RT-Association" {
  count          = length(var.az)
  route_table_id = aws_route_table.P1-Pub-RT.id
  subnet_id      = aws_subnet.P1-Pub-Subnet[count.index].id
}

#Private Route Table
resource "aws_route_table" "P1-Priv-RT" {
  count  = length(var.az)
  vpc_id = aws_vpc.P1-VPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.P1-Nat-Gateway[count.index].id
  }

  tags = {
    Name    = "P1-Private Route Table ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}

#Private Route Table with Web Private Subnet Association
resource "aws_route_table_association" "P1-WEB-Priv-RT-Association" {
  count          = length(var.az)
  route_table_id = aws_route_table.P1-Priv-RT[count.index].id
  subnet_id      = aws_subnet.P1-Web-Priv-Subnet[count.index].id
}

#Private Route Table with InternalLB Private Subnet Association
resource "aws_route_table_association" "P1-InternalLB-Priv-RT-Association" {
  count          = length(var.az)
  route_table_id = aws_route_table.P1-Priv-RT[count.index].id
  subnet_id      = aws_subnet.P1-IntLB-Priv-Subnet[count.index].id
}

#Private Route Table with App Private Subnet Association
resource "aws_route_table_association" "P1-App-Priv-RT-Association" {
  count          = length(var.az)
  route_table_id = aws_route_table.P1-Priv-RT[count.index].id
  subnet_id      = aws_subnet.P1-App-Priv-Subnet[count.index].id
}

#Private Route Table with RDS Private Subnet Association
resource "aws_route_table_association" "P1-RDS-Priv-RT-Association" {
  count          = length(var.az)
  route_table_id = aws_route_table.P1-Priv-RT[count.index].id
  subnet_id      = aws_subnet.P1-DB-Priv-Subnet[count.index].id
}


