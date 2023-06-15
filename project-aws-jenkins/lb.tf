resource "aws_lb" "server-lb" {

  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [aws_subnet.pivate.id, aws_subnet.public.id]

}

resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.root-vpc.id

  health_check {
    path = "/"
  }
}

resource "aws_lb_target_group_attachment" "my_target_attachment" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_instance.jenkins-server.id
  port             = 8080
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.server-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}
