resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]
  apply_immediately    = true

  # Opcional: IOPS
  iops = var.iops != 0 ? var.iops : null

  tags = var.tags
}

resource "aws_security_group" "this" {
  name_prefix = var.security_group_name_prefix
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.allowed_ips
    content {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  tags = var.tags
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = var.tags
}
