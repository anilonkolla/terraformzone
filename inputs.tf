variable "aws_vpc" {
  type        = string
  default     = "10.10.0.0/16"
  description = "this is aws vpc"
}

variable "subnet_cidr_format" {
  type    = string
  default = "10.10.%g.0/24"
}

variable "subnet_names" {
  type    = list(string)
  default = ["web1", "web2", "app1", "app2", "db1", "db2"]
}