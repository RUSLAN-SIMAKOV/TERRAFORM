provider "aws" {
  region = "us-east-2"
}

//1. Create vpc
resource "aws_vpc" "quantum2" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod"
  }
}

//2. Create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.quantum2.id

  tags = {
    Name = "prod-gateway"
  }
}

//3. Create custom Route Table
resource "aws_route_table" "prod-route-table" {
  vpc_id = aws_vpc.quantum2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "prod-rt"
  }
}
//4. Create Subnet
//5. Associate Subnet with Route Table
//6. Create Security group to allow ports 22, 80, 443
//7. Create a network interface with an IP in the subnet
//8. Assign an Elastic IP to the network interface
//9. Create Ubuntu server and install/enable Apache2
