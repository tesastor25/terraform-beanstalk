output "elastic_beanstalk_url" {
  value = aws_elastic_beanstalk_environment.wordpress_env.endpoint_url
}