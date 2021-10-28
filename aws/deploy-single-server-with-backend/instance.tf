resource "aws_instance" "example" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = var.INSTANCE_TYPE
}