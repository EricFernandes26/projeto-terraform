//------------------------------------------------------------------------------------------------------------------------------------------

// Criar VPC
resource "aws_vpc" "lab-vpctf" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

    tags = {
    Name = "lab-vpctf"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}


// Criar Subnet's public e private
resource "aws_subnet" "public_subnet_1" {
vpc_id = aws_vpc.lab-vpctf.id
availability_zone = "us-east-2a"
cidr_block = "10.0.1.0/24"

    tags = {
    Name = "public_subnet_1"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}

resource "aws_subnet" "public_subnet_2" {
vpc_id = aws_vpc.lab-vpctf.id
availability_zone = "us-east-2b"
cidr_block = "10.0.2.0/24"

    tags = {
    Name = "public_subnet_2"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}

resource "aws_subnet" "private_subnet_1" {
vpc_id = aws_vpc.lab-vpctf.id
availability_zone = "us-east-2a"
cidr_block = "10.0.3.0/24"

    tags = {
    Name = "private_subnet_1"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}

resource "aws_subnet" "private_subnet_2" {
vpc_id = aws_vpc.lab-vpctf.id
availability_zone = "us-east-2b"
cidr_block = "10.0.4.0/24"

    tags = {
    Name = "private_subnet_2"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}






//Criar IGW
resource "aws_internet_gateway" "igw-tf" {
  vpc_id = aws_vpc.lab-vpctf.id

  tags = {
    Name = "igw-tf"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}


//Criando Rotas
resource "aws_route_table" "rt-public_subnet_1" {
  vpc_id = aws_vpc.lab-vpctf.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.igw-tf.id
  }

    tags = {
    Name = "rt-public_subnet_1"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}

resource "aws_route_table" "rt-public_subnet_2" {
  vpc_id = aws_vpc.lab-vpctf.id

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = aws_internet_gateway.igw-tf.id
  }

    tags = {
    Name = "rt-public_subnet_2"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}



resource "aws_route_table" "rt1-private_subnet_1-tf" {
    vpc_id = aws_vpc.lab-vpctf.id
   route {
    cidr_block = "10.0.3.0/24"
  }

    tags = {
    Name = "rt1-private_subnet_1-tf"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}

resource "aws_route_table" "rt2-private_subnet_2-tf" {
    vpc_id = aws_vpc.lab-vpctf.id
    route {
    cidr_block = "10.0.4.0/24"
  }

   tags = {
    Name = "rt2-private_subnet_2-tf"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}










// Associar Subnet a Route table
resource "aws_route_table_association" "rt-public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.rt-public_subnet_1.id
}

resource "aws_route_table_association" "rt-public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.rt-public_subnet_2.id
}


resource "aws_route_table_association" "rt1-private_subnet_1-tf" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.rt1-private_subnet_1-tf.id
}

resource "aws_route_table_association" "rt2-private_subnet_2-tf" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.rt2-private_subnet_2-tf.id
}
