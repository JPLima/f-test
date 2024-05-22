output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "eip_id" {
  description = "The ID of the Elastic IP associated with the NAT Gateway"
  value       = aws_eip.this.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}
