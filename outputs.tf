# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.VPC_module.vpc_id
}

# Public Subnet IDs
output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.Pub_Sub_module.public_subnet_ids
}

# Private Subnet IDs
output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.Pvt_Sub_module.private_subnet_ids
}

#IGW IDs
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.IGW_module.internet_gateway_id
}

# Public Route Table IDs
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = module.Pub_rt_module.public_route_table_id
}

#Private Route Table IDs
output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = module.Pvt_rt_module.private_route_table_id
}

# Security Group ID
output "security_group_id" {
  description = "The ID of the Security Group"
  value       = module.SG_module.security_group_id
}

# EC2 Instances
output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.EC2_module.ec2_instance_id
}

output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.EC2_module.ec2_instance_public_ip
}

output "ec2_instance_private_ip" {
  description = "The private IP of the EC2 instance"
  value       = module.EC2_module.ec2_instance_private_dns
}