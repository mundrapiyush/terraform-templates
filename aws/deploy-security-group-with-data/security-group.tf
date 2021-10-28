data "aws_ip_ranges" "apac_ec2" {
    regions = [ "ap-south-1", "ap-west-1" ]
    services = [ "ec2" ]
}

resource "aws_security_group" "example" {
    name = "apac-ec2-ingress"
    
    ingress {
        from_port        = "443"
        to_port          = "443"
        protocol         = "tcp"
        cidr_blocks      = data.aws_ip_ranges.apac_ec2.cidr_blocks
        ipv6_cidr_blocks = data.aws_ip_ranges.apac_ec2.ipv6_cidr_blocks
    }
}