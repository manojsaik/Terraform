resource "aws_instance" "jenkins-server" {
  tags = {
    Name = "server"
  }
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "tf"
  subnet_id     = aws_subnet.pivate.id
  user_data     = file("./user-data.sh")
  root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    delete_on_termination = true
  }

  vpc_security_group_ids = [aws_security_group.server-sg.id]

}

resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  key_name = "tf"
  tags = {
    Name = "bastion"
  }

  vpc_security_group_ids = [aws_security_group.ssh-from-anywhere.id]

}