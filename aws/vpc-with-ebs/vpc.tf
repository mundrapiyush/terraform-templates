# Create a VPC

resource "aws_vpc" "multi-zone-vpc" {
    cidr_block = "10.0.0.0/16"  
}

resource "aws_subnet" "public-subnet-1" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "public-subnet-2" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "public-subnet-3" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1c"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "private-subnet-3" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.6.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = false
}

resource "aws_internet_gateway" "multi-zone-vpc-internet-gateway" {
    vpc_id = aws_vpc.multi-zone-vpc.id
}

resource "aws_route_table" "multi-zone-vpc-route-table" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    route = [ {
      carrier_gateway_id = ""
      cidr_block = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id = ""
      gateway_id = aws_internet_gateway.multi-zone-vpc-internet-gateway.id
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

resource "aws_route_table_association" "subnet1-route-table-association" {
    subnet_id = aws_subnet.public-subnet-1.id
    route_table_id = aws_route_table.multi-zone-vpc-route-table.id
}