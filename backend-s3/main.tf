terraform {
  backend "s3" {
     key = "terraform/samp.terraform.tfstate"   #keyname
    bucket = "elasticbeanstalk-us-east-2-949620661336" #bucketname
    #region = "us-east-2"
    #shared_config_files = "~/.aws/credentials"
    #profile = "infra-sandbox"

  }
}

provider "aws" {
  profile = "infra-sandbox"
  shared_config_files = ["~/.aws/credentials"]
  region = "us-east-2"
}


resource "aws_security_group" "poc" {

  vpc_id = "vpc-d53bcfbc"

  name = "terraform-test"

   ingress {
    from_port = 443
    to_port   = 443
    protocol  = "TCP"

    cidr_blocks = [
      "189.39.16.1/32",     #TWBR BH1
      "187.28.183.179/32",  #TWBR BH2
      "12.41.206.0/24"      #Sonic Corp
    ]
  }

}