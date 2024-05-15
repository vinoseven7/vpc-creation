output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "The ID of the VPC"
  value       = aws_subnet.public_subnets[*].ids
}

output "private_subnets" {
  description = "The ID of the VPC"
  value       = ws_subnet.private_subnets[*].ids
}


