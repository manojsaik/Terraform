resource "aws_key_pair" "pemkey" {

  key_name   = "tf"
  public_key = file("~/.ssh/id_rsa.pub")
}