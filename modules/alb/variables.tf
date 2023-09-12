variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "alb_security_groups" {
  description = "List of security group IDs for the ALB"
  type        = list(string)
}

variable "alb_subnets" {
  description = "List of subnet IDs where the ALB will be placed"
  type        = list(string)
}

variable "alb_internal" {
  description = "Set to true if the ALB should be internal, false if it should be public"
  type        = bool
}

variable "alb_enable_deletion_protection" {
  description = "Set to true to enable deletion protection for the ALB"
  type        = bool
}

variable "alb_idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle before it is closed by the ALB"
  type        = number
}

variable "alb_enable_http2" {
  description = "Set to true to enable HTTP/2 on the ALB"
  type        = bool
}

variable "alb_enable_cross_zone_load_balancing" {
  description = "Set to true to enable cross-zone load balancing on the ALB"
  type        = bool
}

variable "alb_tags" {
  description = "Additional tags for the ALB"
  type        = map(string)
  default = {
        "name" = "inialbwordpress"
        "purpose" = "albwordpress"
        "env" = "dev"
    }
}