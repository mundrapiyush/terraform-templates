resource "aws_instance" "example" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.nano"
    subnet_id = aws_subnet.public-subnet-1.id
    vpc_security_group_ids = [aws_security_group.ssh-enabled-security-group.id]
    key_name = aws_key_pair.examplekp.key_name
}

resource "aws_key_pair" "examplekp" {
    key_name = "examplekp"
    public_key = file("examplekp.pub")
}

resource "aws_volume_attachment" "example-ebs-vol-attachment" {
    device_name = "/dev/xvdh"
    volume_id   = aws_ebs_volume.example-ebs-vol.id
    instance_id = aws_instance.example.id
}