variable "ipv4_primary_cidr_block" {
  type        = string
  description = <<-EOT
    The primary IPv4 CIDR block for the VPC.
    Either `ipv4_primary_cidr_block` or `ipv4_primary_cidr_block_association` must be set, but not both.
    EOT
  default     = "11.0.0.0/16"
}

variable "ipv4_primary_cidr_block_association" {
  type = object({
    ipv4_ipam_pool_id   = string
    ipv4_netmask_length = number
  })
  description = <<-EOT
    Configuration of the VPC's primary IPv4 CIDR block via IPAM. Conflicts with `ipv4_primary_cidr_block`.
    One of `ipv4_primary_cidr_block` or `ipv4_primary_cidr_block_association` must be set.
    Additional CIDR blocks can be set via `ipv4_additional_cidr_block_associations`.
    EOT
  default     = null
}

variable "ipv4_additional_cidr_block_associations" {
  type = map(object({
    ipv4_cidr_block     = string
    ipv4_ipam_pool_id   = string
    ipv4_netmask_length = number
  }))
  description = <<-EOT
    IPv4 CIDR blocks to assign to the VPC.
    `ipv4_cidr_block` can be set explicitly, or set to `null` with the CIDR block derived from `ipv4_ipam_pool_id` using `ipv4_netmask_length`.
    Map keys must be known at `plan` time, and are only used to track changes.
    EOT
  default     = {}
}

variable "ipv4_cidr_block_association_timeouts" {
  type = object({
    create = string
    delete = string
  })
  description = "Timeouts (in `go` duration format) for creating and destroying IPv4 CIDR block associations"
  default     = null
}

variable "assign_generated_ipv6_cidr_block" {
  type        = bool
  description = "When `true`, assign AWS generated IPv6 CIDR block to the VPC.  Conflicts with `ipv6_ipam_pool_id`."
  default     = true
}

variable "ipv6_primary_cidr_block_association" {
  type = object({
    ipv6_cidr_block     = string
    ipv6_ipam_pool_id   = string
    ipv6_netmask_length = number
  })
  description = <<-EOT
    Primary IPv6 CIDR block to assign to the VPC. Conflicts with `assign_generated_ipv6_cidr_block`.
    `ipv6_cidr_block` can be set explicitly, or set to `null` with the CIDR block derived from `ipv6_ipam_pool_id` using `ipv6_netmask_length`.
    EOT
  default     = null
}

variable "ipv6_additional_cidr_block_associations" {
  type = map(object({
    ipv6_cidr_block     = string
    ipv6_ipam_pool_id   = string
    ipv6_netmask_length = number
  }))
  description = <<-EOT
    IPv6 CIDR blocks to assign to the VPC (in addition to the autogenerated one).
    `ipv6_cidr_block` can be set explicitly, or set to `null` with the CIDR block derived from `ipv6_ipam_pool_id` using `ipv6_netmask_length`.
    Map keys must be known at `plan` time and are used solely to prevent unnecessary changes.
    EOT
  default     = {}
}

variable "ipv6_cidr_block_association_timeouts" {
  type = object({
    create = string
    delete = string
  })
  description = "Timeouts (in `go` duration format) for creating and destroying IPv6 CIDR block associations"
  default     = null
}

variable "ipv6_cidr_block_network_border_group" {
  type        = string
  description = <<-EOT
    Set this to restrict advertisement of public addresses to a specific Network Border Group such as a LocalZone.
    Requires `assign_generated_ipv6_cidr_block` to be set to `true`.
    EOT
  default     = null
}

variable "instance_tenancy" {
  type        = string
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
  validation {
    condition     = contains(["default", "dedicated", "host"], var.instance_tenancy)
    error_message = "Instance tenancy must be one of \"default\", \"dedicated\", or \"host\"."
  }
}

variable "dns_hostnames_enabled" {
  type        = bool
  description = "Set `true` to enable [DNS hostnames](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-dns.html#vpc-dns-hostnames) in the VPC"
  default     = true
}

variable "dns_support_enabled" {
  type        = bool
  description = "Set `true` to enable DNS resolution in the VPC through the Amazon provided DNS server"
  default     = true
}

variable "default_security_group_deny_all" {
  type        = bool
  default     = true
  description = <<-EOT
    When `true`, manage the default security group and remove all rules, disabling all ingress and egress.
    When `false`, do not manage the default security group, allowing it to be managed by another component.
    EOT
}

variable "default_route_table_no_routes" {
  type        = bool
  default     = false
  description = <<-EOT
    When `true`, manage the default route table and remove all routes, disabling all ingress and egress.
    When `false`, do not mange the default route table, allowing it to be managed by another component.
    Conflicts with Terraform resource `aws_main_route_table_association`.
    EOT
}

variable "default_network_acl_deny_all" {
  type        = bool
  default     = false
  description = <<-EOT
    When `true`, manage the default network acl and remove all rules, disabling all ingress and egress.
    When `false`, do not mange the default networking acl, allowing it to be managed by another component.
    EOT
}

variable "internet_gateway_enabled" {
  type        = bool
  description = "Set `true` to create an Internet Gateway for the VPC"
  default     = true
}

variable "ipv6_egress_only_internet_gateway_enabled" {
  type        = bool
  description = "Set `true` to create an IPv6 Egress-Only Internet Gateway for the VPC"
  default     = false
}
