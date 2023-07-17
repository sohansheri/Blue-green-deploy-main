#------------------------------------------------------------------#
#        Resource to create Route Table for Public subnets
#------------------------------------------------------------------#
resource "aws_route_table" "public_subnet1_route_table" {
  vpc_id = aws_vpc.group2_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_subnet1_route_table"
  }
}

resource "aws_route_table" "public_subnet2_route_table" {
  vpc_id = aws_vpc.group2_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_subnet2_route_table"
  }
}

#------------------------------------------------------------------#
#        Resource to create Route Table for Private subnets
#------------------------------------------------------------------#
resource "aws_route_table" "private_subnet1_route_table" {
  vpc_id = aws_vpc.group2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway1.id
  }

  tags = {
    Name = var.private_subnet1_route_table
  }
}

resource "aws_route_table" "private_subnet2_route_table" {
  vpc_id = aws_vpc.group2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway2.id
  }

  tags = {
    Name = var.private_subnet2_route_table
  }
}

#------------------------------------------------------------------#
#   Resource to create Route Table Association for Private subnets
#------------------------------------------------------------------#
resource "aws_route_table_association" "private_subnet1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_subnet1_route_table.id
}
resource "aws_route_table_association" "private_subnet2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_subnet2_route_table.id
}

#------------------------------------------------------------------#
#   Resource to create Route Table Association for Prublic subnets
#------------------------------------------------------------------#
resource "aws_route_table_association" "public_subnet1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_subnet1_route_table.id
}
resource "aws_route_table_association" "public_subnet2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_subnet2_route_table.id
}