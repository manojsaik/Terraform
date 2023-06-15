resource "aws_security_group" "ssh-from-anywhere" {

  name        = "ssh-from-anywhere"
  description = "Allow ssh inbound traffic"

  vpc_id = aws_vpc.root-vpc.id

  ingress {

    description = "ssh from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh-from-anywhere"
  }

}

resource "aws_security_group" "lb-sg" {

  name        = "http from anywhere"
  description = "Allow http inbound traffic"

  vpc_id = aws_vpc.root-vpc.id

  ingress {

    description = "http from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "http-from-anywhere"
  }

}

resource "aws_security_group" "server-sg" {

  name        = "server-sg"
  description = "server-sg"

  vpc_id = aws_vpc.root-vpc.id

  ingress {

    description     = "ssh from bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.ssh-from-anywhere.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "8080 from lb"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.lb-sg.id]
  }
  tags = {
    Name = "sg-server"
  }

}