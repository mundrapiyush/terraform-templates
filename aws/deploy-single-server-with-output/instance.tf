resource "aws_instance" "example" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = var.INSTANCE_TYPE
    
    provisioner "local-exec" {
        command = "echo The private ip is ${aws_instance.example.private_ip}"
    }
}

output "aws_instance_info" {
  value = aws_instance.example.public_ip
}

