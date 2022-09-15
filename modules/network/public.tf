resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.vpc_ecs.id

  cidr_block                = "10.0.0.0/20"
  map_public_ip_on_launch   = true
  availability_zone     = format("%sa", var.aws_region)

   tags = {
      Name = "public-1a"
     "Owner" = var.owner_name
     "Department" = var.department_name
    }
}



resource "aws_subnet" "public_subnet_1c" {
  vpc_id = aws_vpc.vpc_ecs.id

  cidr_block                = "10.0.16.0/20"
  map_public_ip_on_launch   = true
  availability_zone     = format("%sc", var.aws_region)

    tags = {
      Name = "public-1c"
     "Owner" = var.owner_name
     "Department" = var.department_name
    }
}





resource "aws_route_table_association" "public_1a" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.igw_route_table.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.igw_route_table.id
}