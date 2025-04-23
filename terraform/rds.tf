# resource "aws_db_instance" "postgres" {
#   engine                 = "postgres"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 20
#   name                   = var.db_name
#   username               = var.db_username
#   password               = var.db_password
#   publicly_accessible    = true
#   skip_final_snapshot    = true
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]
# }