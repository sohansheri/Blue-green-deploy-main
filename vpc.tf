#----------------------------------------------------#
#          Resource to create VPC
#----------------------------------------------------#
resource "aws_vpc" "group2_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }

}

#----------------------------------------------------#
#        Resource to create Internet gateway
#----------------------------------------------------#
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.group2_vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

#----------------------------------------------------#
#         Resource to create EIP for NAT GW
#----------------------------------------------------#
resource "aws_eip" "nat_eip1" {
  vpc = true
}

resource "aws_eip" "nat_eip2" {
  vpc = true
}

#----------------------------------------------------#
#          Resource to create NAT GW 
#----------------------------------------------------#
resource "aws_nat_gateway" "nat_gateway1" {
  allocation_id = aws_eip.nat_eip1.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = var.nat_gateway1_name
  }

}

resource "aws_nat_gateway" "nat_gateway2" {
  allocation_id = aws_eip.nat_eip2.id
  subnet_id     = aws_subnet.public_subnet2.id

  tags = {
    Name = var.nat_gateway2_name
  }
}

