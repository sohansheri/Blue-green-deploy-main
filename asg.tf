#------------------------------------------------------------------------#
#       Resource to create Security Group for Launch Configuration
#------------------------------------------------------------------------#
resource "aws_security_group" "allow_ssh" {
  name        = "Allow-SSH-SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.group2_vpc.id

  ingress {
    description = "Allow SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow-SSH-SG"
  }
}

#------------------------------------------------------------------------#
#          Resource to create Data resource for fetching AMI
#------------------------------------------------------------------------#
data "aws_ami" "packer_ami_blue" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "tag:Name"
    values = ["Blue-Server"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "packer_ami_blue" {
  value = data.aws_ami.packer_ami_blue.id
}

data "aws_ami" "packer_ami_green" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "tag:Name"
    values = ["Green-Server"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "packer_ami_green" {
  value = data.aws_ami.packer_ami_green.id
}

#------------------------------------------------------------------------#
#        Resource to create Launch Configuration / Launch Template
#------------------------------------------------------------------------#
resource "aws_launch_configuration" "asg_lauch_config_blue" {
  name            = "group2-asg-lauch-config-blue"
  image_id        = data.aws_ami.packer_ami_blue.id
  instance_type   = "t3.small"
  key_name        = "ec2key"
  security_groups = [aws_security_group.allow_ssh.id]
  ebs_optimized   = true

  root_block_device {
    volume_size = "10"
    volume_type = "gp2"
  }

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_subnet.private_subnet1,
    aws_subnet.private_subnet2
  ]
}

resource "aws_launch_configuration" "asg_lauch_config_green" {
  name            = "group2-asg-lauch-config-green"
  image_id        = data.aws_ami.packer_ami_green.id
  instance_type   = "t3.small"
  key_name        = "ec2key"
  security_groups = [aws_security_group.allow_ssh.id]
  ebs_optimized   = true

  root_block_device {
    volume_size = "10"
    volume_type = "gp2"
  }

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_subnet.private_subnet1,
    aws_subnet.private_subnet2
  ]
}

#------------------------------------------------------------------------#
#       Resource to create Auto-Scaling Group for Green environment
#------------------------------------------------------------------------#

resource "aws_autoscaling_group" "auto_scaling_group_green" {
  name                      = "group2-auto-scaling-group-green"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.asg_lauch_config_green.name
  vpc_zone_identifier       = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]

  timeouts {
    delete = "15m"
  }
  depends_on = [
    aws_subnet.private_subnet1,
    aws_subnet.private_subnet2
  ]
}

#------------------------------------------------------------------------#
#       Resource to create Auto-Scaling Group for Blue environment
#------------------------------------------------------------------------#

resource "aws_autoscaling_group" "auto_scaling_group_blue" {
  name                      = "g2_auto_scaling_group_blue"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.asg_lauch_config_blue.name
  vpc_zone_identifier       = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]


  timeouts {
    delete = "15m"
  }

  depends_on = [
    aws_subnet.private_subnet1,
    aws_subnet.private_subnet2
  ]

}


