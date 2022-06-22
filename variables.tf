
variable "aws_region"{
    type=string
    description="AWS region"
    default="eu-west-2"
}

variable "vpc_cidr"{
    type=string
    description="IP CIDR range for VPC"
    default="10.0.0.0/16"
}

variable "subnet_cidr"{
    type=string
    description="IP CIDR range for the subnet"
    default="10.0.172.0/24"
}


variable "eu-west2-ubuntu-ami"{
    type=string
    description="Regional Ubuntu AMI "
    default="ami-05a8c865b4de3b127"
}

variable "instance_type"{
    type=string
    description=" AMI instance type "
    default="t2.micro"
}

variable "internet_default_route"{
    type=string
    description="Default route for internet access"
    default="0.0.0.0/0"
}
