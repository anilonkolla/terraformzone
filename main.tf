resource "aws_vpc" "ipc" {
  cidr_block = var.aws_vpc

  tags = {
    name = local.name
  }

}

resource "aws_subnet" "subnets" {
  count      = length(var.subnet_names)
  vpc_id     = aws_vpc.ipc.id
  cidr_block = format(var.subnet_cidr_format, count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }

}