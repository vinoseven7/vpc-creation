variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = null
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = null
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = null
}

variable "cidr_blocks" {
  type        = string
  description = "Availability Zones"
  default     = ""
}

variable "vpc_name" {
  type        = string
  description = "Availability Zones"
  default     = ""
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "ID of VPC"
  type        = string
  default     = ""
}
