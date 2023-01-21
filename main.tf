terraform {

    required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }


  backend "s3" {
    bucket = "thadeu-remote-state"
    key    = "aws-vpc-provider/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      owner      = "thadeu"
      managed-by = "terraform"
      region     = "eu-central-1"
    }
  }
}

provider "aws" {
  alias  = "eua"
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "thadeu"
      managed-by = "terraform"
      region     = "us-east-1"
    }
  }
}