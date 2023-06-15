terraform {
  backend "s3" {
     key = "terraform/sam.terraform.tfstate"
    bucket = "elasticbeanstalk-us-east-2-949620661336"
    region = "us-east-2"

  }

    required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
  
}

provider "github" {
  token = "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"
}
resource "github_repository" "example" {
  name        = "tf-managed-backendS3"
  description = "My awesome codebase"

  visibility = "public"

}
