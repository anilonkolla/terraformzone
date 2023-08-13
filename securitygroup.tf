resource "aws_security_group" "sg" {
  name        = "sg"
  description = "this security group"
  vpc_id      = aws_vpc.ipc.id

  tags = {
    name = "security group"
  }
}

resource "aws_security_group_rule" "http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.sg.id
  
}

resource "aws_security_group_rule" "ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.sg.id
  
}

resource "aws_security_group_rule" "app" {
    type = "egress"
    from_port = 0
    to_port = 65535
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.sg.id
  
}

