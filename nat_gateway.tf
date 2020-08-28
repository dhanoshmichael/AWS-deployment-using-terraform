#NAT gateway
resource "aws_nat_gateway" "P1-Nat-Gateway" {
  count         = length(var.az)
  allocation_id = aws_eip.P1-Eip-NatGateway[count.index].id
  subnet_id     = aws_subnet.P1-Pub-Subnet[count.index].id

  tags = {
    Name    = "P1-NAT Gateway ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}
