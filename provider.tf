provider "aws" {
  alias = "main"
}

provider "aws" {
  alias = "cloudfront"
}

provider "local" {
  version = ">=1.3.0"
}