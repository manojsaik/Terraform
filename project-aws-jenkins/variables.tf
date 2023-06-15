variable "vpc-cidr" {
  default = "10.0.0.0/16"
}

variable "region" {
  default = "us-east-2"
}

variable "azs" {
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]

}

variable "instance_type" {
  default = "t2.micro"
}
variable "ami_id" {
  default = "ami-092b51d9008adea15"
}