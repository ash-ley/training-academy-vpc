# INTERNET GATEWAY - ROUTE TABLE
resource "aws_route_table" "igw_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "internet-gateway-route-table"
  }
}

# SUBNET A
resource "aws_route_table" "private_to_public_subnet_rt_a" {
  vpc_id = aws_vpc.main_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat_public_a.id
  }

  tags = {
    Name = "private-to-public-a"
  }
}

# ASSOCIATION TO SUBNET PUBLIC A
resource "aws_route_table_association" "igw_for_public_a" {
    subnet_id = aws_subnet.public_a.id
    route_table_id = aws_route_table.igw_route_table.id
}

# ASSOCIATION TO SUBNET PRIVATE A
resource "aws_route_table_association" "private_rt_for_public_a" {
    subnet_id = aws_subnet.private_a.id
    route_table_id = aws_route_table.private_to_public_subnet_rt_a.id
}

# SUBNET B
resource "aws_route_table" "private_to_public_subnet_rt_b" {
  vpc_id = aws_vpc.main_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat_public_b.id
  }

  tags = {
    Name = "private-to-public-b"
  }
}

# ASSOCIATION TO SUBNET PUBLIC B
resource "aws_route_table_association" "igw_for_public_b" {
    subnet_id = aws_subnet.public_b.id
    route_table_id = aws_route_table.igw_route_table.id
}

# ASSOCIATION TO SUBNET PRIVATE B
resource "aws_route_table_association" "private_rt_for_public_b" {
    subnet_id = aws_subnet.private_b.id
    route_table_id = aws_route_table.private_to_public_subnet_rt_b.id
}

# SUBNET C

resource "aws_route_table" "private_to_public_subnet_rt_c" {
  vpc_id = aws_vpc.main_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat_public_c.id
  }

  tags = {
    Name = "private-to-public-c"
  }
}

# ASSOCIATION TO SUBNET PUBLIC C
resource "aws_route_table_association" "igw_for_public_c" {
    subnet_id = aws_subnet.public_c.id
    route_table_id = aws_route_table.igw_route_table.id
}

# ASSOCIATION TO SUBNET PRIVATE C
resource "aws_route_table_association" "private_rt_for_public_c" {
    subnet_id = aws_subnet.private_c.id
    route_table_id = aws_route_table.private_to_public_subnet_rt_c.id
}