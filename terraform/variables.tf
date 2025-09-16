# AWS Provider
variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  default     = "default"
}

# Key Pair
variable "key_name" {
  description = "Name of the existing AWS key pair to access EC2 instances"
  default     = "replatforming"
}

# VPC and Networking
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  default     = "10.0.2.0/24"
}

# Security Group
variable "sg_name" {
  description = "Name of the security group"
  default     = "devops_sg"
}

# EC2 Instances
variable "jenkins_instance_type" {
  description = "EC2 instance type for Jenkins"
  default     = "t2.micro"
}

variable "monitoring_instance_type" {
  description = "EC2 instance type for Monitoring (Prometheus/Grafana)"
  default     = "t2.micro"
}

variable "sonarqube_instance_type" {
  description = "EC2 instance type for SonarQube"
  default     = "t2.medium"
}

# AMI IDs (must be valid in us-east-1)
variable "jenkins_ami" {
  description = "AMI ID for Jenkins server (Amazon Linux 2)"
  default     = "ami-0b09ffb6d8b58ca91"
}

variable "monitoring_ami" {
  description = "AMI ID for Monitoring server (Amazon Linux 2)"
  default     = "ami-0b09ffb6d8b58ca91"
}

variable "sonarqube_ami" {
  description = "AMI ID for SonarQube server (Amazon Linux 2)"
  default     = "ami-0b09ffb6d8b58ca91"
}
