variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "SSH key pair name"
}

variable "instance_type" {
  default = "t3.micro"
}

# variable "db_username" {
#   default = "postgres"
# }

# variable "db_password" {
#   description = "RDS password"
#   sensitive   = true
# }

# variable "db_name" {
#   default = "sipstr_db"
# }