# helloworld
Creating a Hello-world application using node.js

# Description

This code will create infrastructure in AWS usign Terraform and will also deploy a Hello-world node.js application on the Ec2 instance 

# AWS Infrastructure

VPC - virtual private cloud

Internet Gateway - Provides internet access to the Ec2 instance

IP Subnet - Ec2 instance will be created in this /24 subnet

Custom route table - Routes all traffic for internet towards internet gateway 

Route table association - customer route table and IP subnet

Security group- 
   Ingress Access - Allows ssh access for managing the EC2 instance
                    Allows internet users to access the application on port 5000. 
                    
   Egress Access - Permits internet access to the EC2 instance 

EC2 instance - A new Ubuntu EC2 instance will be created in the region eu-west-2

Node.js and NPM will be installed using user data in TF

Download helloworld node.js application from Git

Run the server

From any machine access the application x.x.x.x:5000




