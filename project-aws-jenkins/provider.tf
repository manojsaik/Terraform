
//configure aws credentials through a file or key value pair & region 
provider "aws" {

  region = var.region     #specify region
  profile = "infra-sandbox"
  shared_credentials_files = ["~/.aws/credentials"]  #save your creds in .aws/credentials file
}

