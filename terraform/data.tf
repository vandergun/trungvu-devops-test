data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
  
  # Assuming private subnets are tagged appropriately, or we can just use all subnets if simple
  # For this example, let's assume we want all subnets in the VPC for simplicity unless specified
}

data "aws_lb" "main" {
  name = var.alb_name
}

data "aws_lb_listener" "https" {
  load_balancer_arn = data.aws_lb.main.arn
  port              = 443
}

# Look up the certificate for the domain
data "aws_acm_certificate" "cert" {
  domain   = var.domain_name
  statuses = ["ISSUED"]
  most_recent = true
}
