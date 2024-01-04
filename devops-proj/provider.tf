provider "aws" {

  region                   = "us-east-2" #specify region
  profile                  = "infra-sandbox"
  shared_credentials_files = ["~/.aws/credentials"] #save your creds in .aws/credentials file
}