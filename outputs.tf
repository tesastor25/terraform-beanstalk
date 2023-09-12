output "elastic_beanstalk_url" {
  value = module.elastic_beanstalk.elastic_beanstalk_url
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}