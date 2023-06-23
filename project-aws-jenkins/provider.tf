
//configure aws credentials through a file or key value pair & region 
provider "aws" {

  region = var.region     #specify region
  profile = "provide a profile name that has in creds file / or remove if it default"
  shared_credentials_files = ["~/.aws/credentials"]  #save your creds in .aws/credentials file
}

