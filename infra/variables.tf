variable "project_name" {
    type = string
    default = "tf-gitlab-demo"
    description = "Project tag and S3 prefix"
}


variable "environment" {
    type = string
    default = "dev"
}


variable "region" {
    type = string
    default = "ap-south-1"
}


variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}


variable "public_subnet_cidr" {
    type = string
    default = "10.0.1.0/24"
}


variable "availability_zone" {
    type = string
    default = "ap-south-1a"
}


variable "key_pair_name" {
    type = string
    default = "day1-keypair"
    description = "Existing EC2 key pair name (without .pem)"
}


variable "allowed_ssh_cidr" {
    type = string
    default = "0.0.0.0/0" # For demo. Restrict to your IP in real use.
}


variable "instance_type" {
    type = string
    default = "t3.micro"
}