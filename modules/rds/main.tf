variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "db_instance_name" {
  description = "Name of the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_engine" {
  description = "Database engine type (e.g., mysql)"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "db_instance_class" {
  description = "Instance type of the RDS instance (e.g., db.t2.micro)"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance (in GB)"
  type        = number
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "db_parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
}

variable "db_backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
}

variable "db_multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
}

variable "db_security_groups" {
  description = "List of security group names to associate with the RDS instance"
  type        = list(string)
}

variable "db_vpc_security_group_ids" {
  description = "List of security group IDs to associate with the RDS instance"
  type        = list(string)
}

variable "db_tags" {
  description = "Additional tags for the RDS instance"
  type        = map(string)
}

resource "aws_db_instance" "wordpress_db" {
  name                         = var.db_instance_name
  engine                       = var.db_engine
  engine_version               = var.db_engine_version
  instance_class               = var.db_instance_class
  allocated_storage            = var.db_allocated_storage
  identifier                   = var.db_name
  username                     = var.db_username
  password                     = var.db_password
  vpc_security_group_ids       = var.db_vpc_security_group_ids
  db_subnet_group_name         = var.db_subnet_group_name
  parameter_group_name         = var.db_parameter_group_name
  backup_retention_period       = var.db_backup_retention_period
  multi_az                     = var.db_multi_az
  apply_immediately            = true
  publicly_accessible          = false
  skip_final_snapshot          = true
  delete_automated_backups     = true
  copy_tags_to_snapshot        = true
  final_snapshot_identifier     = "final-snapshot-${var.db_instance_name}"
  tags                         = var.db_tags
}

output "rds_endpoint" {
  value = aws_db_instance.wordpress_db.endpoint
}