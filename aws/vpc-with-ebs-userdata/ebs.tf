resource "aws_ebs_volume" "example_volume" {
    availability_zone = aws_subnet.example_vpc_public_subnet_1.availability_zone
    size = 10  
}