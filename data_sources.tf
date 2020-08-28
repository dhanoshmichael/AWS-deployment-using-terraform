#EC2 Bastion Host AMI Data Source
data "aws_ami" "Bastion-Host-Ami-Data" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-04e59c05167ea7bd5"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#WEB Server AMI Data Source
data "aws_ami" "WEB-Server-Ami-Data" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "image-id"
    values = ["ami-04e59c05167ea7bd5"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#APP Server AMI Data Source
data "aws_ami" "APP-Server-Ami-Data" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "image-id"
    values = ["ami-04e59c05167ea7bd5"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
