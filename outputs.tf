
output "vpc_id" {
   description = "ID of the VPC"
   value = aws_vpc.prod-vpc.id
  }

output "instance_ip" {
    description = "EC2 instance public IP"
    value = aws_instance.web-server.public_ip
  
}
