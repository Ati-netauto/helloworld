
terraform{
    required_providers {
      aws={
           source="hashicorp/aws"
      }
    }
}


provider "aws"{
    profile ="default"
    region = var.aws_region
     
}


# 1.Create VPC #

resource "aws_vpc" "prod-vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_support= "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"
        tags= {
        Name= "prod-vpc"
    }
    
  }

# 2.Create internet Gateway #

resource "aws_internet_gateway" "prod-igw" {
    vpc_id = aws_vpc.prod-vpc.id
    tags= {
        Name="prod.igw"
    }    
  
}

# 3.Create an IP subnet #

resource "aws_subnet" "prod-pub-subnet" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = var.subnet_cidr
    map_public_ip_on_launch = "true"

    tags = {
        Name="prod-pub-subnet1"
    }
  
}

# 4.Create a custom route table #

resource "aws_route_table" "prod-pub-crt" {
    vpc_id = aws_vpc.prod-vpc.id

    route {
        cidr_block = var.internet_default_route
        gateway_id = aws_internet_gateway.prod-igw.id

          }
    }


# 5.Associate custom route table with the subnet #

resource "aws_route_table_association" "prod-crt1-public-subnet" {
  subnet_id = aws_subnet.prod-pub-subnet.id
  route_table_id = aws_route_table.prod-pub-crt.id
}


# 6.Create a Security group #

resource "aws_security_group" "prod-sg" {
    name = "prod-sg"
    description = "Allow inbound http traffic"
    vpc_id= aws_vpc.prod-vpc.id

    ingress {
        description = "Allow Web application port for nodejs"
        from_port = 5000
        to_port = 5000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    
    ingress {
        description = "Allow ssh access from the internet"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    
    egress {
        description = "Allow outbound internet access"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      "Name" = "prod-sg"
    }
}

# 7.Create EC2 instance
resource "aws_instance" "web-server" {
    ami= var.eu-west2-ubuntu-ami
    instance_type = var.instance_type
    key_name = "aws-ec2"
    subnet_id = aws_subnet.prod-pub-subnet.id
    security_groups = [ aws_security_group.prod-sg.id ]
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install -y nodejs npm
                sudo wget https://github.com/Ati-netauto/helloworld/raw/main/helloworld-app.js
                node helloworld-app.js
                EOF
}





