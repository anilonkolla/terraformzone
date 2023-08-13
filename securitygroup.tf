resource "aws_security_group" "sg" {
  name        = "sg"
  description = "this security group"
  vpc_id      = aws_vpc.ipc.id

  tags = {
    name = "security group"
  }
}