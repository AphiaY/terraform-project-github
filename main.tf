# project vpc 

resource "aws_vpc" "project-vpc" {
  cidr_block       = var.vpc-cidr-block
  instance_tenancy = "default"

  tags = {
    Name = "project-vpc"
  }
}

# Public subnet 1
resource "aws_subnet" "public-sub1" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.public-sub1-cidr-block
  availability_zone = var.availability-zone2
  tags = {
    Name = "public-sub1"
  }
}

# Public subnet 2
resource "aws_subnet" "public-sub2" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.public-sub2-cidr-block
  availability_zone = var.availability-zone2

  tags = {
    Name = "public-sub2"
  }
}


# Private subnet 1
resource "aws_subnet" "private-sub1" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.private-sub1-cidr-block
  availability_zone = var.availability-zone1

  tags = {
    Name = "private-sub1"
  }
}

# Private subnet 2
resource "aws_subnet" "private-sub2" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.private-sub2-cidr-block
  availability_zone = var.availability-zone1

  tags = {
    Name = "private-sub2"
  }
}


# Route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.project-vpc.id
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.project-vpc.id
  tags = {
    Name = "private-route-table"
  }
}

# Route association public

#Public route table1
resource "aws_route_table_association""public-route-table-association-1" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

#Public route table2
resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.public-sub2.id
  route_table_id = aws_route_table.public-route-table.id
}

# Route association private

#Private route table1
resource "aws_route_table_association" "private-route-table-association-1" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route-table.id
}

#Private route table2
resource "aws_route_table_association" "private-route-table-association-2" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-route-table.id
}


# internet gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.project-vpc.id

  tags = {
    Name = "IGW"
  }
}

# aws route

resource "aws_route" "public-igw-route" {
  route_table_id            = aws_route_table.public-route-table.id
  gateway_id                = aws_internet_gateway.IGW.id
  destination_cidr_block    = "0.0.0.0/0"
}
