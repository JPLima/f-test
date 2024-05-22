variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "storage_type" {
  description = "The storage type to be associated with the RDS instance"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The username for the master DB user"
  type        = string
}

variable "password" {
  description = "The password for the master DB user"
  type        = string
  sensitive   = true
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 0
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to use for the RDS instance"
  type        = list(string)
}

variable "allowed_ips" {
  description = "List of allowed IPs to access the RDS instance"
  type        = list(string)
}

variable "security_group_name_prefix" {
  description = "Prefix for the security group name"
  type        = string
  default     = "rds-sg-"
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to resources"
  type        = map(string)
  default     = {}
}
