resource "aws_security_group" "multi-zone-vpc-security-group" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    ingress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "SSH from my machine"
      from_port = 22
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = []
      self = false
      to_port = 22
    } ]
    egress = [{
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      description      = "Reach out to the world"
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}