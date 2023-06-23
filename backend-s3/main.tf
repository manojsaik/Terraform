terraform {
  backend "s3" {
     key = "terraform/sam.terraform.tfstate"   #keyname
    bucket = "somebucket" #bucketname
    region = "us-east-2"

  }
}

resource "local_file" "foo" {
  
  filename = "./foo.txt"
  content = "GAHFDIEKNVHGKGH8878)#####())@( singg)"
}