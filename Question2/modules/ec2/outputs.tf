output "bastion_public_ip" {
  description = "O endereço IP público do bastion instance."
  value       = aws_instance.bastion.public_ip
}

output "bastion_security_group_id" {
  description = "O ID do security group associado com a instância bastion."
  value       = aws_security_group.bastion.id
}
