output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = module.vpc.subnet_id
}

output "ec2_instance_ids" {
  description = "EC2 Instance IDs"
  value       = module.ec2.instance_ids
}

output "ec2_private_ips" {
  description = "Private IPs of EC2 instances"
  value       = module.ec2.instance_private_ips
}

output "ec2_public_ips" {
  description = "Public IPs (Elastic IPs) of EC2 instances"
  value       = module.ec2.instance_public_ips
}
