output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.main[0].id, null)
}
