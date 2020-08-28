#EIP for NAT Gateway	
resource "aws_eip" "P1-Eip-NatGateway" {
  count = length(var.az)
  vpc   = true
  tags = {
    Name    = "P1-EIP for NAT Gateway ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}
