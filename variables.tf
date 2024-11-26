variable "prefix_vpc" {
  description = "vpc tags"
  type        = string
}

variable "vpc_cidr" {
  description = "vpc cidr for vpc"
  type        = string
}

variable "pub_sub_cidr" {
  description = "List of public subnet cidr"
  type        = list(string)
}

variable "pvt_sub_cidr" {
  description = "List of private subnet cidr"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "prefix_pubrt" {
  description = "Route table tags"
  type        = string
}

variable "prefix_pvtrt" {
  description = "Route table tags"
  type        = string
}

variable "prefix_sg" {
  description = "Security group tags"
  type        = string
}

variable "web_server" {
  description = "Ingress port values"
  type        = list(number)
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "ec2_key_name" {
  description = "The name of the key pair to access the instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type: public/private"
  type        = string
  validation {
    condition     = contains(["public", "private"], var.ec2_instance_type)
    error_message = "Must be either public or private only"
  }
}

variable "ec2_subnet_index" {
  description = "Subnet index number"
  type        = number
}

variable "ec2_name" {
  description = "EC2 instance name"
  type        = string
}
################################################################3
# variable "instance_count" {
#   description = "Number of EC2 instances creation"
#   type        = number
# }