output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "aws_security_group" {
  description = "Security groups"
  value	      = aws_security_group.allow_tls.id
}

output "subnet_1" {
  description = "subnet_1"
  value       = aws_subnet.subnet_1.id
}
