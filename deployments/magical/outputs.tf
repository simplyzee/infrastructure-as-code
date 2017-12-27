output "id" {
  description = "A list of EC2 instances IDs"
  value       = ["${module.ec2.id}"]
}

output "public_ip" {
  description = "A list of public IP addresses assigned to the EC2 instances"
  value       = ["${module.ec2.public_ip}"]
}
