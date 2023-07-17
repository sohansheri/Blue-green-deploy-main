
#--------------------------------------------------------------------------#
variable "vpc_cidr" {
  type        = string
  description = " Variable to declare VPC CIDR range"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "Group2_VPC"
}
#--------------------------------------------------------------------------#
variable "private_subnet1_cidr" {
  description = "This is the CIDR range for private subnet1 "
  default     = "10.0.3.0/24"
}

variable "private_subnet1_name" {
  type        = string
  description = "Name of private subnet1"
  default     = "private_subnet1"
}
#--------------------------------------------------------------------------#

variable "private_subnet2_cidr" {
  description = "This is the CIDR range for private subnet2 "
  default     = "10.0.4.0/24"
}

variable "private_subnet2_name" {
  description = "Name of private subnet2"
  default     = "private_subnet2"
}
#-------------------------------------------------------------------------#

variable "public_subnet1_cidr" {
  description = "This is the CIDR range for Data subnet "
  default     = "10.0.1.0/24"
}

variable "public_subnet1_name" {
  description = "Name of public subnet1"
  default     = "public_subnet1"
}
#--------------------------------------------------------------------#
variable "public_subnet2_cidr" {
  description = "This is the CIDR range for Data subnet "
  default     = "10.0.2.0/24"
}

variable "public_subnet2_name" {
  description = "Name of public subnet2"
  default     = "public_subnet2"
}

#-----------------------------------------------------------------------#
variable "internet_gateway_name" {
  description = "Name of internet gateway "
  default     = "group2_vpc_igw"
}
#---------------------------------------------------------------------#
variable "nat_gateway1_name" {
  description = "Name of nat gateway1 "
  default     = "vpc_nat_gateway1"
}

variable "nat_gateway2_name" {
  description = "Name of nat gateway2 "
  default     = "vpc_nat_gateway2"
}
#--------------------------------------------------------------------------#

variable "private_subnet1_route_table" {
  type        = string
  description = "(optional) describe your variable"
  default     = "private_subnet1_route_table"
}

variable "private_subnet2_route_table" {
  type        = string
  description = "(optional) describe your variable"
  default     = "private_subnet2_route_table"
}
#--------------------------------------------------------------------------#