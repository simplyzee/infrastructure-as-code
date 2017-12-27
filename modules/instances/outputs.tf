output "id" {
  description = "A list of EC2 instances IDs"
  value       = ["${aws_instance.ec2_instances.*.id}"]
}

output "public_ip" {
  description = "A list of public IP addresses assigned to the EC2 instances"
  value       = ["${aws_instance.ec2_instances.*.public_ip}"]
}
