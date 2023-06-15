
//configure aws credentials through a file or key value pair & region 
provider "aws" {

  region = var.region

  shared_credentials_files = ["/Users/manojk/.aws/credentials"]
}

