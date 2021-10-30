resource "aws_key_pair" "examplekp" {
    key_name = "examplekp"
    public_key = file("examplekp.pub") 
}
resource "aws_instance" "multi-zone-vpc-instance" {
    ami = lookup(var.AWS_AMIS, var.AWS_REGION)
    subnet_id = aws_subnet.zone-1-public.id
    vpc_security_group_ids = [aws_security_group.multi-zone-vpc-security-group.id]
    key_name = aws_key_pair.examplekp.key_name
    instance_type = "t2.nano"
}

output "instance_public_ip" {
  value = aws_instance.multi-zone-vpc-instance.public_ip
}