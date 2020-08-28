#VPC ID
output "VPC_ID" {
  value       = aws_vpc.P1-VPC.id
  description = "Outputting VPC ID"
}

#Internet Gateway ID
output "Internet_Gatway" {
  value       = aws_internet_gateway.P1-IG.id
  description = "Outputting Internet Gateway ID"
}

#Public Subnet 1 ID
output "Public_Subnet_1" {
  value       = aws_subnet.P1-Pub-Subnet[0].id
  description = "Outputting Public Subnet 1 ID"
}

#Public Subnet 2 ID
output "Public_Subnet_2" {
  value       = aws_subnet.P1-Pub-Subnet[0].id
  description = "Outputting Public Subnet 2 ID"
}

#Web Private Subnet 1 ID
output "Web_Private_Subnet_1" {
  value       = aws_subnet.P1-Web-Priv-Subnet[0].id
  description = "Outputting Web Server Private Subnet 1 ID"
}

#Web Private Subnet 2 ID
output "Web_Private_Subnet_2" {
  value       = aws_subnet.P1-Web-Priv-Subnet[1].id
  description = "Outputting Web Server Private Subnet 2 ID"
}

#InternalLB Private Subnet 1 ID
output "InternalLB_Priavte_Subnet_1" {
  value       = aws_subnet.P1-IntLB-Priv-Subnet[0].id
  description = "Outputting InternalLB Server Private Subnet 1 ID"
}

#InternalLB Private Subnet 2 ID
output "InternalLB_Private_Subnet_2" {
  value       = aws_subnet.P1-IntLB-Priv-Subnet[1].id
  description = "Outputting InternalLB Server Subnet 2 ID"
}

#App Server Private Subnet 1 ID
output "App_Private_Subnet_1" {
  value       = aws_subnet.P1-App-Priv-Subnet[0].id
  description = "Outputting App Server Private Subnet 1 ID"
}

#App Server Private Subnet 2 ID
output "App_Private_Subnet_2" {
  value       = aws_subnet.P1-App-Priv-Subnet[1].id
  description = "Outputting App Server Private Subnet 2 ID"
}

#RDS Private Subnet 1 ID
output "RDS_Private_Subnet_1" {
  value       = aws_subnet.P1-DB-Priv-Subnet[0].id
  description = "Outputting RDS Private Subnet 1 ID"
}

#RDS Private Subnet 2 ID
output "RDS_Private_Subnet_2" {
  value       = aws_subnet.P1-DB-Priv-Subnet[1].id
  description = "Outputting RDS Private Subnet 2 ID"
}

#Public IP of Bastion Host1
output "Bastion_Host_1_Public_IP" {
  value       = aws_instance.P1-Bastion-Host[0].public_ip
  description = "Public IP of Bastion Hos1t"
}

#Public DNS of Bastion Host1
output "Bastion_Host_1_Public_DNS" {
  value       = aws_instance.P1-Bastion-Host[0].public_dns
  description = "Public DNS of Bastion Host1"
}

#Public IP of Bastion Host2
output "Bastion_Host_2_Public_IP" {
  value       = aws_instance.P1-Bastion-Host[1].public_ip
  description = "Public IP of Bastion Host2"
}

#Public DNS of Bastion Host2
output "Bastion_Host_2_Public_DNS" {
  value       = aws_instance.P1-Bastion-Host[1].public_dns
  description = "Public DNS of Bastion Host2"
}

#EIP1 ID
output "NAT_Gateway1_EIP_ID" {
  value       = aws_eip.P1-Eip-NatGateway[0].id
  description = "NAT Gateway1 EIP ID"
}

#EIP1 Public IP Address
output "NAT_Gateway1_EIP_Public_Address" {
  value       = aws_eip.P1-Eip-NatGateway[0].public_ip
  description = "NAT Gateway1 EIP Public IP address"
}
#EIP2 ID
output "NAT_Gateway2_EIP_ID" {
  value       = aws_eip.P1-Eip-NatGateway[1].id
  description = "NAT Gateway2 EIP ID"
}

#EIP2 Public IP Address
output "NAT_Gateway2_EIP_Public_Address" {
  value       = aws_eip.P1-Eip-NatGateway[1].public_ip
  description = "NAT Gateway2 EIP Public IP address"
}

