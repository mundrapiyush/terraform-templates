# Define Virtual Private Cloud (VPC)
resource "aws_vpc" "multi-zone-vpc" {
    cidr_block = "10.0.0.0/16"
}

# Define Public Subnets
resource "aws_subnet" "zone-1-public" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = "true"
}

resource "aws_subnet" "zone-2-public" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = "true" 
}

resource "aws_subnet" "zone-3-public" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1c"
    map_public_ip_on_launch = "true"
}

# Define Private Subnets
resource "aws_subnet" "zone-1-private" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = "false"
}

resource "aws_subnet" "zone-2-private" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = "false"
}

resource "aws_subnet" "zone-3-private" {
    vpc_id = aws_vpc.multi-zone-vpc.id
    cidr_block = "10.0.6.0/24"
    availability_zone = "ap-south-1c"
    map_public_ip_on_launch = "false"
}

# Define Internet Gateway
resource "aws_internet_gateway" "multi-zone-vpc-internet-gateway" {
    vpc_id = aws_vpc.multi-zone-vpc.id
}

# Define Route Table
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

# Define Route Associations
resource "aws_route_table_association" "zone-1-public-route-table-association" {
    subnet_id = aws_subnet.zone-1-public.id
    route_table_id = aws_route_table.multi-zone-vpc-route-table.id
}

resource "aws_route_table_association" "zone-2-public-route-table-association" {
    subnet_id = aws_subnet.zone-2-public.id
    route_table_id = aws_route_table.multi-zone-vpc-route-table.id
}

resource "aws_route_table_association" "zone-3-public-route-table-association" {
    subnet_id = aws_subnet.zone-3-public.id
    route_table_id = aws_route_table.multi-zone-vpc-route-table.id  
}