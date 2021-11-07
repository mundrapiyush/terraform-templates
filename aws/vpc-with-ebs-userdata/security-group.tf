resource "aws_security_group" "ssh-enabled-security-group" {
    name = "allow_ssh"
    description = "Allow inbound ssh connection"
    vpc_id = aws_vpc.example_vpc.id

    ingress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow SSH from any IP"
      from_port = 22
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = []
      self = false
      to_port = 22
    } ]

    egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow connection to internet"
      from_port = 0
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "-1"
      security_groups = []
      self = false
      to_port = 0
    } ]
}