provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "VPCTF"
  cidr = "10.0.0.0/21"

  azs             = ["eu-east-1a", "eu-east-1b",]
  public_subnet-1a =  ["10.0.1.0/24"]
  public_subnet-2b =  ["10.0.2.0/24"]

  private_subnet-1a = ["10.0.3.0/24"]
  private_subnet-2b = ["10.0.4.0/24"]


  enable_nat_gateway = true

  tags = {
   name = VPCTF
  }
}

// IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPCTF
}

// route-table-Public
resource "aws_route_table" "router" {
  vpc_id = aws_vpc.VPCTF

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw"
    subnet_id = "public_subnet-1a"
    

  }

  tags = {
    Name = "RT_public"
  }
}

// route-table-private
resource "aws_route_table" "router" {
  vpc_id = aws_vpc.VPCTF

  route {

    subnet_id = "private_subnets"

  }

  tags = {
    Name = "RT_private"
  }
}

// NAT-gw
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.private_subnet_1.id

  depends_on = [ aws_internet_gateway.igw ]
  
}

// por hj é só