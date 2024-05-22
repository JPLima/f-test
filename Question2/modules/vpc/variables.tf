variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "rds_subnet_cidr" {
  description = "CIDR block for the RDS subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to use for subnets"
  type        = string
}

variable "nat_gateway" {
  description = "The availability zone to use for subnets"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to resources"
  type        = map(string)
  default     = {}
}
