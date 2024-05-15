provider "aws" {
  # ... other configuration ...
  default_tags {
    tags = {
      Environment = "Development"
      Owner       = "Ops"
    }
  }
}

module "vpc-creation" {
  source = "./"
}
