terraform {
  backend "s3" {
     key = "terraform/sam.terraform.tfstate"
    bucket = "elasticbeanstalk-us-east-2-949620661336"
    region = "us-east-2"

  }
}

resource "local_file" "foo" {
  
  filename = "./foo.txt"
  content = "GAHFDIEKNVHGKGH8878)#####())@( singg)"
}