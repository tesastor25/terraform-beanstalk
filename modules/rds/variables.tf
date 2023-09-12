variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "db_instance_name" {
  description = "Name of the RDS instance"
  type        = string
  default     = "db_wordpress"
}

variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "admin"
}

variable "db_engine" {
  description = "Database engine type (e.g., mysql)"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "db_instance_class" {
  type        = string
  default     = "t2.micro"
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
  default = {
        "name" = "inialbwordpress"
        "purpose" = "albwordpress"
        "env" = "dev"
    }
}