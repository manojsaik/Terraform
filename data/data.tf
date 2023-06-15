
provider "aws" {


 shared_credentials_files = ["/Users/manojk/.aws/credentials"]
}

data "aws_subnet" "kong-vpc-private-subnet" {

    tags = {
    Name = "kong-vpc-private-subnet"
  }
}

data "aws_instance" "ec2" {


      filter {
    name   = "tag:Name"
    values = ["pyflask-webapp"]
  }
  
}

output "subnet_id" {
  
  value = data.aws_subnet.kong-vpc-private-subnet.vpc_id
}

output "pyflask-publuc-ip" {
  value = data.aws_instance.ec2.public_ip
}


data "aws_route_table" "example" {
  route_table_id = "rtb-030ce5e764d7a5a64"
}

output "route_table_id" {
  value = data.aws_route_table.example.id
}

output "routes" {
  value = data.aws_route_table.example.routes
}

output "associations" {
  value = data.aws_route_table.example.associations
}

output "seperation" {
  value = "******************$$$$$*********************"
}

data "aws_lb" "lb-data" {
  name = "kong-alb"
}

output "load_balancer_arn" {
  value = data.aws_lb.lb-data.arn
}

output "load_balancer_dns_name" {
  value = data.aws_lb.lb-data.dns_name
}

output "lb_subnets" {
  value = data.aws_lb.lb-data.subnets
}

output "sb-mapping" {
  value = data.aws_lb.lb-data.subnet_mapping
}
/*
resource "aws_instance" "from-data" {
  
    subnet_id = data.aws_subnet.kong-vpc-private-subnet.id
    instance_type = "t2.micro"

    ami = data.aws_instance.ec2.ami
  
}*/