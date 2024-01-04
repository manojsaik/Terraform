provider "aws" {
  profile = "sandbox"
  shared_config_files = ["~/.aws/credentials"]
  region = "us-east-2"
}

terraform {
  backend "s3" {
     key = "terraform/samp.terraform.tfstate"   #keyname
    bucket = "elasticbeanstalk-us-east-2-949620661336" #bucketname
    region = "us-east-2"
    #profile = "infra-sandbox"

  }
}



resource "aws_security_group" "poc" {

  vpc_id = "vpc-d53bcfbc"

  name = "launch-wizard-3"

   ingress {
    from_port = 22
    to_port   = 22
    protocol  = "TCP"

    cidr_blocks = [
      "0.0.0.0/0"

    ]
  }

  ingress  {

    from_port = 443
    to_port   = 443
    protocol  = "TCP"
    description ="manual"

    cidr_blocks = ["49.37.147.0/32"]
    
  }

    ingress  {
    from_port = 443
    to_port   = 443
    protocol  = "TCP"

    cidr_blocks = [
      "189.39.16.1/32",     #TWBR BH1
      "187.28.183.179/32",  #TWBR BH2
      "12.41.206.0/24",
     # "49.37.147.0/32"      #Sonic Corp
    ]
  }

     egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"

    ]
  }

}