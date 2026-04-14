terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"        # ✅ Allows any 5.x — avoids stale patch pins
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }

  backend "s3" {
    bucket  = "vprofilebucket23"
    key     = "terraform.tfstate"
    region  = "us-east-2"       # ✅ Fixed: was us-east-1, must match AWS_REGION in workflow
    encrypt = true               # ✅ Added: encrypts state file at rest in S3
  }

  required_version = ">= 1.6.3, < 2.0.0"  # ✅ More flexible than ~> 1.6.3
}