resource "aws_instance" "ec2-instance" {

    ami = "ami-01107263728f3bef4"
    instance_type = var.instancetype
}