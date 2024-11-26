#VPC 
vpc_cidr   = "10.0.0.0/16"
prefix_vpc = "my_vpc"

#Subnet
pub_sub_cidr       = ["10.0.0.0/24", "10.0.1.0/24"]
pvt_sub_cidr       = ["10.0.2.0/24", "10.0.3.0/24"]
availability_zones = ["ap-southeast-2a", "ap-southeast-2b"]

#Route Table
prefix_pubrt = "pub_RT"
prefix_pvtrt = "pvt_RT"

#Security Group
prefix_sg  = "MySG"
web_server = [22, 80, 443]

# EC2 Instances
ami_id            = "ami-037a2314eeca55594"
instance_type     = "t2.micro"
ec2_key_name      = "NewKey"
ec2_instance_type = "public"
ec2_subnet_index  = 1
ec2_name          = "public-instance-1"