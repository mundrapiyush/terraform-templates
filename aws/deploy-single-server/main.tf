provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
    ami = "ami-0a23ccb2cdd9286bb"
    instance_type = "t2.micro"
}