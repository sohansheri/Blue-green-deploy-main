#----------------------------------------------------#
#         Resource to create private subnets
#----------------------------------------------------#
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.group2_vpc.id
  cidr_block = var.private_subnet1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = var.private_subnet1_name
  }

}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.group2_vpc.id
  cidr_block = var.private_subnet2_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = var.private_subnet2_name
  }

}

#----------------------------------------------------#
#         Resource to create public subnets
#----------------------------------------------------#
resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.group2_vpc.id
  cidr_block = var.public_subnet1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = var.public_subnet1_name
  }

}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.group2_vpc.id
  cidr_block = var.public_subnet2_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = var.public_subnet2_name
  }

}
