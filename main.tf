# VPC
resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
    }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.gtw_name
  }
}

# SUBNETS
## PUBLIC

resource "aws_eip" "nat_a_eip" {
    vpc = true
}

resource "aws_nat_gateway" "nat_public_a" {
  allocation_id = aws_eip.nat_a_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "NAT-GW-public-a"
  }

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "nat_b_eip" {
    vpc = true
}

resource "aws_nat_gateway" "nat_public_b" {
  allocation_id = aws_eip.nat_b_eip.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    Name = "NAT-GW-public-b"
  }

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "nat_c_eip" {
    vpc = true
}

resource "aws_nat_gateway" "nat_public_c" {
  allocation_id = aws_eip.nat_c_eip.id
  subnet_id     = aws_subnet.public_c.id

  tags = {
    Name = "NAT-GW-public-c"
  }

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_a_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_b_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_c_cidr
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-c"
  }
}

## PRIVATE
resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_a_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "talent-academy-private-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_b_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "talent-academy-private-b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_c_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "talent-academy-private-c"
  }
}