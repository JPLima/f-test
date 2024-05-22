output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}


output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "rds_subnet_id" {
  value = aws_subnet.rds.id
}
