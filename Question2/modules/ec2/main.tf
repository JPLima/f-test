resource "aws_security_group" "bastion" {
  name_prefix = var.security_group_name_prefix
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_ips
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_instance" "bastion" {
  ami                          = var.ami
  instance_type                = var.instance_type
  subnet_id                    = var.subnet_id
  vpc_security_group_ids       = [aws_security_group.bastion.id]
  key_name                     = var.key_name
  associate_public_ip_address  = true

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = var.tags
}
