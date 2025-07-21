# Create public subnet on each AZ - loop
resource "aws_subnet" "public_subnet" {
  for_each                = toset(var.availability_zones)
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet_cidrs[each.key]
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags = merge(
    { "Name" = "subnet-${each.key}" },
    local.common_tags
  )
}