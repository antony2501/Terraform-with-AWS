output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.main[*].id
}

output "instance_private_ips" {
  description = "Private IP addresses of the instances"
  value       = aws_instance.main[*].private_ip
}

output "instance_public_ips" {
  description = "Elastic IP addresses of the instances"
  value       = aws_eip.main[*].public_ip
}
