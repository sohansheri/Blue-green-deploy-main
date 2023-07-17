resource "aws_lb" "application_load_balancer" {
  name               = "group2-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_sg.id]
  subnets            = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]

  enable_deletion_protection = false
  tags = {
    Environment = "production"
  }
  depends_on = [
    aws_subnet.public_subnet1,
    aws_subnet.public_subnet2
  ]
}
resource "aws_lb_target_group" "alb_green_tg" {
  name     = "green-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.group2_vpc.id

 
}
resource "aws_lb_target_group" "alb_blue_tg" {
  name     = "blue-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.group2_vpc.id
}


resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.alb_blue_tg.arn
      }
      target_group {
        arn = aws_lb_target_group.alb_green_tg.arn
      }
      stickiness {
        enabled = true
        duration = 5
      }
    }
  }
}

# resource "aws_lb_target_group_attachment" "blue_attachment" {
#   target_group_arn = aws_lb_target_group.alb_blue_tg.arn
#   target_id = aws_lb.application_load_balancer.arn
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "green_attachment" {
#   target_group_arn = aws_lb_target_group.alb_green_tg.arn
#   target_id = aws_lb.application_load_balancer.arn
#   port             = 80
# }


resource "aws_autoscaling_attachment" "blue_attach_asg" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group_blue.name
  lb_target_group_arn    = aws_lb_target_group.alb_blue_tg.arn

}

resource "aws_autoscaling_attachment" "green_attach_asg" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group_green.name
  lb_target_group_arn    = aws_lb_target_group.alb_green_tg.arn

}

