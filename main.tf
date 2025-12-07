terraform {
  backend "s3" {
    bucket         = "terraform-series-s3-backend-annhung"
    key            = "terraform-jenkins"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform-series-s3-backend"
  }
}

provider "aws" {
  region = "ap-southeast-1"
  assume_role {
    role_arn     = "arn:aws:iam::237083715815:role/Terraform-SeriesS3BackendRole"
    session_name = "terraform-session"
  }
}

resource "aws_instance" "server" {
  ami           = "ami-047126e50991d067b"
  instance_type = "t3.micro"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Server"
  }
}

output "public_ip" {
  value = aws_instance.server.public_ip
}