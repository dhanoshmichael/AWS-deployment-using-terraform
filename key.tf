#Key Pair for EC2 instance
resource "aws_key_pair" "P1-Key-Pair" {
  key_name   = "P1-terraform-ec2-key"
  public_key = file(var.key-pair-path)
}
