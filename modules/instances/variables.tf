variable "name" {
  default     = "Name to use across AWS resources to segregate by"
}

variable "count" {
  default     = 1
  description = "Number of EC2 instance to create provision"
}

variable "ami" {
  description = "AMI Image ID to use with the EC2 instance"
}

variable "instance_type" {
  description = "EC2 Instance type to use when provisioning i.e t2.micro, t2.medium, c4.large etc..."
}

variable "subnet_id" {
  description = "Subnet ID to provision EC2 instance in"
}

variable "key_name" {
  default = ""
  description = "Key name used for instance key pairing"
}

variable "vpc_security_group_ids" {
  type        = "list"
  description = "A list of security groups to associate with"
}

variable "iam_instance_profile" {
  default = ""
  description = "Assign iam role to instances"
}

variable "associate_public_ip_address" {
  default     = false
  description = "Associate a public IP with the EC2 instance"
}

variable "private_ip" {
  default     = ""
  description = "Associate EC2 instance with private IP"
}

variable "tags" {
  default     = {}
  description = "Assign tags to the resource"
}

variable "user_data" {
  default = ""
  description = "Applies templated user data on provisioning i.e cloud-config"
}
