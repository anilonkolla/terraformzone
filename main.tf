resource "aws_vpc" "ipc" {
  cidr_block = var.aws_vpc

  tags = {
    name = local.name
  }

}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.ipc.id
  cidr_block = "10.10.6.0/24"


}

resource "aws_subnet" "subnets" {
  count      = length(var.subnet_names)
  vpc_id     = aws_vpc.ipc.id
  cidr_block = cidrsubnet(var.aws_vpc, 8, count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }

}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.ipc.id

  tags = {
    name = "igway"
  }

}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.ipc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id

  }

  tags = {
    name = "awsrt"
  }

  depends_on = [aws_internet_gateway.ig]
}

resource "aws_route_table_association" "rts" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}


resource "aws_instance" "ntier1" {
  ami                         = "ami-0f5ee92e2d63afc18"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "cloud"
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.sg.id]



  tags = {
    name = "ntiervm"
  }
}



