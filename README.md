## Examples

```hcl
module "vpc-creation" {
  source = "git@github.com:rajesh180793/vpc-creation.git?ref=feature/vpc-module"
  cidr_blocks = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  vpc_name = "My-VPC"
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

output "vpc_id" {
  value = module.vpc-creation.vpc_id
}

output "private-subnets" {
  value = module.vpc-creation.private_subnets
}

output "public-subnets" {
  value = module.vpc-creation.public_subnets
}
```
