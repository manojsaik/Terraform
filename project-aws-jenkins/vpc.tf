//vpc 

resource "aws_vpc" "root-vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = "project-aws"
  }
}

//internet gateway 

resource "aws_internet_gateway" "root-vpc-IGW" {

  vpc_id = aws_vpc.root-vpc.id
  tags = {
    Name = "internet"
  }
}


//private subnet 

resource "aws_subnet" "pivate" {
  vpc_id = aws_vpc.root-vpc.id

  cidr_block = "10.0.1.0/24"

  availability_zone = var.azs[0]
  tags = {
    Name = "private-subnet"
  }
}

//public subnet 

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.root-vpc.id
  availability_zone       = var.azs[1]
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

//eip to be attached to nat-gw

resource "aws_eip" "elastic-ip" {

  domain = "vpc"

}

//display eip public address  

output "EIP" {
  value = aws_eip.elastic-ip.public_ip
}

//nat gateway 

resource "aws_nat_gateway" "nat-gateway" {

  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "NAT-GW"
  }

}

//creating public route table and associated routes 

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.root-vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.root-vpc-IGW.id
  }


  tags = {
    Name = "projectAWS-public-route-table"
  }
}

//creating private route table and associated routes 

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.root-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = "projectAWS-private-route-table"
  }

}

resource "aws_route_table_association" "public-rt" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id

}

resource "aws_route_table_association" "private-rt" {

  subnet_id      = aws_subnet.pivate.id
  route_table_id = aws_route_table.private.id

}
