provider "aws" {
  region = "us-east-1"  # Replace with your desired region

  profile = "sandbox"
  shared_config_files = ["~/.aws/credentials"]
  
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Replace with your desired AMI ID
  instance_type = "t2.micro"      # Replace with your desired instance type

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install nginx -y
              sudo service nginx start
              EOF

  tags = {
    Name = "ExampleInstance"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}