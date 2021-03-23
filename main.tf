provider "aws" {
  region = "us-east-2"
  access_key = "AKIA4LITTND2GLWJMZOD"
  secret_key = "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"
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

//4. Create Subnet
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.quantum2.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

//5. Associate Subnet with Route Table
//6. Create Security group to allow ports 22, 80, 443
//7. Create a network interface with an IP in the subnet
//8. Assign an Elastic IP to the network interface
//9. Create Ubuntu server and install/enable Apache2
