provider "aws" {
  profile = "sandbox"
  #shared_config_files      = ["/Users/manojk/.aws/config"]
  shared_credentials_files = ["/Users/manojk/.aws/credentials"]

}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = "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"
}
resource "github_repository" "example" {
  name        = "tf-managed"
  description = "My awesome codebase"

  visibility = "public"

}

/*
resource "local_file" "myfile" {

  filename = "/Users/manojk/tf-code/udemy-course/${github_repository.example.id}.txt"
  content  = var.content

}


module "ec2" {
  source = "./modules"
}
*/




