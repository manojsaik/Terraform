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