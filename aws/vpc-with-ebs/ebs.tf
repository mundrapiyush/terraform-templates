resource "aws_ebs_volume" "example-ebs-vol" {
    availability_zone = aws_subnet.private-subnet-1.availability_zone
    size = 8
    type = "gp2"
}