#Bastion host
resource "aws_instance" "P1-Bastion-Host" {
  count                       = length(var.az)
  ami                         = data.aws_ami.Bastion-Host-Ami-Data.id
  instance_type               = var.bastion-host-instance-type
  key_name                    = aws_key_pair.P1-Key-Pair.key_name
  vpc_security_group_ids      = [aws_security_group.P1-Bastion-Host-SG.id]
  subnet_id                   = aws_subnet.P1-Pub-Subnet[count.index].id
  associate_public_ip_address = true

  tags = {
    Name    = "P1-Bastion Host ${count.index + 1}"
    Purpose = "Implement AWS infrastructure to AWS using Terraform"
    Project = "P1"
  }
}
