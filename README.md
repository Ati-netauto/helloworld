# Title
Hello-world application deployment using Terraform,AWS and NodeJs

# Description
Aim of this project is to create a simple hello-World application using Terraform ,AWS and NodeJs. 

Below section describes how each element will be used in the successful creation of the application on AWS 

## Terraform 
Tearraform is an open source infrastructure as a code tool which will be used to create required infrastructure in AWS

### AWS Infrastructure to be provisioned 

      .VPC - Virtual private cloud is a logically separated network where AWS resources will launched

      .Internet Gateway - Enables AWS workloads like EC2 instance (or a server) to connect with the internet  

      .Public Subnet - Has a route to the internet gateway and connects AWS resources to the internet 

      .Custom route table - A non-default route table with a default route towards the internet gateway

      .Route table association - Associates public subnet with custom route table enabling internet access

      .Security group- Acts like a virtual firewall controlling access to the EC2 instance in both directions
                           
      .EC2 instance - A virtual server running on AWS infrastructure

## Node.Js
 Node.js is open-sourece JavaScript runtime environment. It will used for creating Hello-World application
      . 
## NPM
Node Package Manager or NPM is a package manager for Node.js and maintains the libraries
 
# How to deploy the application ?

## Prerequisites
Please ensure all prerequisites have been met before

## Git account 

If you don't have a Git account you can create one 

https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2Fenterprise&source=header


### Terraform 
Install Terraform and AWS CLI

https://learn.hashicorp.com/tutorials/terraform/install-cli

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

### AWS account with necessary rights

https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/

### Clone Git to your local machine

 $ git clone https://github.com/Ati-netauto/helloworld


### Run Terraform commands

$ mkdir ec2-tf-nodejs
$ cd ec2-tf-nodejd
$ terraform init
$ terraform plan
$ terraform apply

# Testing

Once Terraform apply is completed successfully test the application by either using the public IP address of the EC2 instance or the hostname with correct port number.
In the browser please type

x.x.x.x:5000

Text 'Hello world' should be dispalye din the window.

# Troubleshooting
##If you encounter any issues please check if the user data section has implemented Node.js and NPM successfully

#### ssh into the EC2 instance

$node -v

$npm -v

#### Check init logs



