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

resource "aws_elastic_beanstalk_application" "wordpress_app" {
  name        = var.application_name
  description = "WordPress application"
}

resource "aws_elastic_beanstalk_environment" "wordpress_env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.wordpress_app.name
  solution_stack_name = var.solution_stack_name

  # Add more environment settings as needed
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "1"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "4"
  }
}

output "elastic_beanstalk_url" {
  value = aws_elastic_beanstalk_environment.wordpress_env.endpoint_url
}