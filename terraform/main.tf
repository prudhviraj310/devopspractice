provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type = "t2.micro"

  tags = {
    Name = "DevOpsPractice"
  }
}
