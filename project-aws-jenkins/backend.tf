terraform {
  backend "s3" {
    
    key = "terraform/terraform.tfstate"
    bucket = "elasticbeanstalk-us-east-2-949620661336"
    region = "us-east-2"
    #dynamodb_table = "value"
  }
  
}