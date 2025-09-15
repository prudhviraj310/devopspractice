variable "key_name" {
  description = "EC2 Key Pair name"
  default     = "your-key" # Replace with your AWS Key Pair
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}
