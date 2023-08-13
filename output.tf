output "apache2url" {
  value = "http://${aws_instance.ntier1.public_ip}"
}