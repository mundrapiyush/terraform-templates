resource "aws_vpc" "example_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example_vpc_public_subnet_1" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"
}

resource "aws_subnet" "example_vpc_public_subnet_2" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1b"
}

resource "aws_subnet" "example_vpc_public_subnet_3" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1c"
}

resource "aws_subnet" "example_vpc_private_subnet_1" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = false
    availability_zone = "ap-south-1a"
}

resource "aws_subnet" "example_vpc_private_subnet_2" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = false
    availability_zone = "ap-south-1b" 
}

resource "aws_subnet" "example_vpc_private_subnet_3" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = false
    availability_zone = "ap-south-1c"
}

resource "aws_internet_gateway" "example_vpc_igw" {
    vpc_id = aws_vpc.example_vpc.id
}

resource "aws_route_table" "rtb_for_public_subnet" {
    vpc_id = aws_vpc.example_vpc.id
    route = [ {
      carrier_gateway_id = ""
      cidr_block = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id = ""
      gateway_id = aws_internet_gateway.example_vpc_igw.id
      instance_id = ""
      ipv6_cidr_block = ""
      local_gateway_id = ""
      nat_gateway_id = ""
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    } ]
  
}

resource "aws_route_table_association" "rtba_for_public_subnet_1" {
    subnet_id = aws_subnet.example_vpc_public_subnet_1.id
    route_table_id = aws_route_table.rtb_for_public_subnet.id
}

resource "aws_route_table_association" "rtba_for_public_subnet_2" {
    subnet_id = aws_subnet.example_vpc_public_subnet_2.id
    route_table_id = aws_route_table.rtb_for_public_subnet.id
}

resource "aws_route_table_association" "rtba_for_public_subnet_3" {
    subnet_id = aws_subnet.example_vpc_public_subnet_3.id
    route_table_id = aws_route_table.rtb_for_public_subnet.id
}
