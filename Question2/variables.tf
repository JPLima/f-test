variable "region" {
  description = "A região AWS onde os recursos serão provisionados."
}

variable "name_prefix" {
  description = "Um prefixo a ser usado para nomear recursos."
}

variable "vpc_cidr" {
  description = "O CIDR da VPC."
}

variable "public_subnet_cidr" {
  description = "O CIDR da subnet pública."
}

variable "private_subnet_cidr" {
  description = "O CIDR da subnet privada."
}

variable "rds_subnet_cidr" {
  description = "O CIDR da subnet RDS."
}

variable "availability_zone" {
  description = "A zona de disponibilidade para provisionar os recursos."
}

variable "tags" {
  description = "Tags a serem aplicadas a todos os recursos."
  type        = map(string)
}

variable "bastion_ami" {
  description = "ID da AMI para a instância bastion."
}

variable "bastion_instance_type" {
  description = "Tipo de instância para a instância bastion."
}

variable "bastion_key_name" {
  description = "Nome da chave SSH para acessar a instância bastion."
}

variable "bastion_allowed_ips" {
  description = "Lista de IPs permitidos para acessar a instância bastion."
  type        = list(string)
}

variable "bastion_allowed_ports" {
  description = "Lista de portas permitidas para acessar a instância bastion."
  type        = list(number)
}

variable "bastion_volume_size" {
  description = "Tamanho do volume para a instância bastion."
}

variable "bastion_volume_type" {
  description = "Tipo do volume para a instância bastion."
}

variable "alb_name_prefix" {
  description = "Um prefixo a ser usado para nomear o Application Load Balancer."
}


variable "alb_enable_https" {
  description = "Indica se o HTTPS deve ser habilitado no ALB."
}

variable "alb_ssl_policy" {
  description = "A política SSL para o HTTPS no ALB."
}

variable "alb_certificate_arn" {
  description = "O ARN do certificado SSL para HTTPS no ALB."
}

variable "alb_target_group_port" {
  description = "A porta do target group do ALB."
}

variable "alb_health_check_interval" {
  description = "O intervalo de verificação de saúde para o ALB."
}

variable "alb_health_check_path" {
  description = "O caminho da verificação de saúde para o ALB."
}

variable "alb_health_check_timeout" {
  description = "O tempo limite de verificação de saúde para o ALB."
}

variable "nat_gateway_name_prefix" {
  description = "Um prefixo a ser usado para nomear o NAT Gateway."
}

variable "rds_allocated_storage" {
  description = "O armazenamento alocado para o RDS."
}

variable "rds_storage_type" {
  description = "O tipo de armazenamento para o RDS."
}

variable "rds_engine" {
  description = "O mecanismo de banco de dados para o RDS."
}

variable "rds_instance_class" {
  description = "A classe de instância para o RDS."
}

variable "rds_db_name" {
  description = "O nome do banco de dados para o RDS."
}

variable "rds_username" {
  description = "O nome de usuário para o RDS."
}

variable "rds_password" {
  description = "A senha para o RDS."
}

variable "rds_iops" {
  description = "Os IOPS provisionados para o RDS."
}

variable "asg_name_prefix" {
  description = "Um prefixo a ser usado para nomear o Auto Scaling Group."
}

variable "asg_ami" {
  description = "ID da AMI para as instâncias do Auto Scaling Group."
}

variable "asg_min_size" {
  description = "O tamanho mínimo do Auto Scaling Group."
}

variable "asg_max_size" {
  description = "O tamanho máximo do Auto Scaling Group."
}

variable "asg_desired_capacity" {
  description = "A capacidade desejada do Auto Scaling Group."
}

variable "asg_instance_type" {
  description = "O tipo de instância para as instâncias do Auto Scaling Group."
}

variable "asg_volume_size" {
  description = "O tamanho do volume para as instâncias do Auto Scaling Group."
}

variable "asg_volume_type" {
  description = "O tipo do volume para as instâncias do Auto Scaling Group."
}

variable "asg_key_name" {
  description = "Nome da chave SSH para as instâncias do Auto Scaling Group."
}

variable "asg_scale_out_adjustment" {
  description = "O ajuste para escalar para fora."
}

variable "asg_cooldown" {
  description = "O período de tempo de espera após um ajuste antes que outro possa ser feito."
}

variable "asg_scale_in_adjustment" {
  description = "O ajuste para escalar para dentro."
}
variable "alb_allowed_ips" {
  description = "O ajuste para escalar para dentro."
  default   = ["0.0.0.0/0"]
}
