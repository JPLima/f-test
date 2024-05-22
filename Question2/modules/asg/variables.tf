variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "sg_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "ami" {
  description = "ID of the AMI"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
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

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

variable "scale_out_adjustment" {
  description = "Scaling adjustment for scaling out"
  type        = number
}

variable "scale_in_adjustment" {
  description = "Scaling adjustment for scaling in"
  type        = number
}

variable "cooldown" {
  description = "Cooldown period for the Auto Scaling Group"
  type        = number
}
