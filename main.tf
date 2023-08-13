resource "aws_vpc" "ipc" {
  cidr_block = var.aws_vpc

  tags = {
    name = local.name
  }

}

