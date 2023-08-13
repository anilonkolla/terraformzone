
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