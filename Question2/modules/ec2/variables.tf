variable "security_group_name_prefix" {
  description = "Prefix used for naming the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(number)
}

variable "allowed_ips" {
  description = "List of allowed IP ranges"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

variable "ami" {
  description = "ID of the AMI"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "volume_size" {
  description = "Size of the EBS volume"
  type        = number
}

variable "volume_type" {
  description = "Type of the EBS volume"
  type        = string
}
