resource "aws_instance" "jenkins-server" {
  tags = {
    Name = "jenkins-server"
  }
  ami           = "ami-092b51d9008adea15"
  instance_type = "t2.small"
  key_name      = "tf"
  user_data     = file("./user-data.sh")
  root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    delete_on_termination = true
  }
  vpc_security_group_ids = ["sg-0d6d91f8d6df34330"]

}


#resource "aws_instance" "tomacat-server" {
 # tags = {
  #  Name = "tomcat-server"
  #}
  #ami           = "ami-092b51d9008adea15"
  #instance_type = "t2.micro"
  #key_name      = "tf"
  #user_data     = file("./tomcat.sh")
  #root_block_device {
   # volume_size           = "10"
    #volume_type           = "gp2"
    #delete_on_termination = true
  #}
  #vpc_security_group_ids = ["sg-0d6d91f8d6df34330"]
#}

resource "aws_instance" "docker-host" {
  tags = {
    Name = "docker-host"
  }
  ami           = "ami-092b51d9008adea15"
  instance_type = "t2.micro"
  key_name      = "tf"
  user_data     = file("./docker.sh")
  root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    delete_on_termination = true
  }
  vpc_security_group_ids = ["sg-0d6d91f8d6df34330"]
}

resource "aws_instance" "ansible-server" {
  tags = {
    Name = "ansible-server"
  }
  ami           = "ami-092b51d9008adea15"
  instance_type = "t2.micro"
  key_name      = "tf"
  user_data     = file("./ansible.sh")
  root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    delete_on_termination = true
  }
  vpc_security_group_ids = ["sg-0d6d91f8d6df34330"]
}

output "docker-host" {
  value = aws_instance.docker-host.public_ip
}
output "jenkins" {
  value = aws_instance.jenkins-server.public_ip
}

output "ansible" {
  value = aws_instance.ansible-server.public_ip
}