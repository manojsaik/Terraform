variable "content" {
 # default = "This is the default conent of file"
}

variable "instancetype" {
  default = "t2.micro"
}

variable "is_dev" {
  type = bool
}