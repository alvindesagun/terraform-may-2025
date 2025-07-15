# creeate a VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

# create Subnet on each AZ loop
resource "aws_subnet" "subnet" {
  for_each                = toset(var.availability_zones)
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.subnet_cidrs[each.key]
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-${each.key}"
  }
}

# Create IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc.id
}

# create a route table
resource "aws_route_table" "rtb-default" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# iterate to each subnet and associate default route
resource "aws_route_table_association" "subnets" {
  for_each       = aws_subnet.subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rtb-default.id
}



