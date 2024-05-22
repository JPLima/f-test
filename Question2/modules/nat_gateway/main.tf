resource "aws_eip" "this" {
  vpc = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-eip"
  })
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = var.public_subnet_id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-nat-gateway"
  })
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-private-rt"
  })
}

resource "aws_route_table_association" "private" {
  count        = length(var.private_subnet_ids)
  subnet_id    = element(var.private_subnet_ids, count.index)
  route_table_id = aws_route_table.private.id
}
