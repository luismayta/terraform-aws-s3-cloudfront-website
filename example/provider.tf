provider "aws" {
  region  = "us-east-1"
  version = ">=1.2.0"
  alias   = "main"
}

provider "aws" {
  version = ">=1.2.0"
  region  = "us-east-1"
  alias   = "cloudfront"
}