resource "aws_security_group" "security_group_tf" {
  name        = "security_group_tf"
  description = "security_group_tf para porta 80"
  vpc_id      = aws_vpc.lab-vpctf.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_group_tf"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }
}