provider "aws" {
    version = "~>2.7"
    region = "us-east-2"
}
resource "aws_instance" "ec2-instance" {

    ami = "ami-01107263728f3bef4"
    instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
   type = map(string)

    default = {

        default = "t2.micro"
        dev     = "t2.small"
        prod    = "c4.large"

    }
  
}