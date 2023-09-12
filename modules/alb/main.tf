resource "aws_lb" "wordpress_lb" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = "application"
  enable_deletion_protection = var.alb_enable_deletion_protection

  security_groups = var.alb_security_groups
  subnets         = var.alb_subnets
  enable_http2    = var.alb_enable_http2
  enable_cross_zone_load_balancing = var.alb_enable_cross_zone_load_balancing
  idle_timeout    = var.alb_idle_timeout
  tags            = var.alb_tags
}

output "alb_dns_name" {
  value = aws_lb.wordpress_lb.dns_name
}