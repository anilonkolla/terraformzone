provider "aws" {
    region = "ap-south-1"
  
}


resource "aws_vpc" "ipc" {
    cidr_block = "10.10.0.0/16"
    
    tags = {
      name = "ipc"
    }
  
}