resource "aws_instance" "example_instance" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.nano"
    key_name = aws_key_pair.examplekp.key_name
    subnet_id = aws_subnet.example_vpc_public_subnet_1.id
    vpc_security_group_ids = [aws_security_group.ssh-enabled-security-group.id]
    user_data = data.template_file.init-config.rendered
}

resource "aws_volume_attachment" "example_instance_volume_attachment" {
    volume_id = aws_ebs_volume.example_volume.id
    instance_id = aws_instance.example_instance.id
    device_name = var.VOLUME_NAME
}

resource "aws_key_pair" "examplekp" {
    key_name = "examplekp"
    public_key = file("examplekp.pub")
}

output "public_ip" {
    value = aws_instance.example_instance.public_ip
}

output "private_ip" {
    value = aws_instance.example_instance.private_ip
}