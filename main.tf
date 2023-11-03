terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, 5.19.0"
    }
  }
}

provider "aws" {
  region = var.project_region
}