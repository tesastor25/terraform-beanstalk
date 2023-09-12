variable "application_name" {
  description = "Name of the Elastic Beanstalk application"
  type        = string
}

variable "environment_name" {
  description = "Name of the Elastic Beanstalk environment"
  type        = string
}

variable "solution_stack_name" {
  description = "Solution stack name (e.g., 64bit Amazon Linux 2 v3.2.5 running PHP 7.4)"
  type        = string
}