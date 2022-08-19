// Criar Target group
resource "aws_lb_target_group" "target-group" {
  health_check{
    interval = 10
    path = "/"
    protocol = "HTTP"
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2
  }

  name = "alb-tf"
  port = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.lab-vpctf.id
}


// Criar ALB
resource "aws_lb" "application-lb" {
  name = "alb-tf"
  internal = false
  ip_address_type = "ipv4"
  load_balancer_type = "application"
  security_groups = [aws_security_group.security_group_tf.id]
  subnets = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]


   tags = {
    Name = "application-lb"
    Owner = "eric.pereira"
    Departament = "Darede Academy"
  }

}

// Criar Listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target-group.arn
    type = "forward"
  }
}