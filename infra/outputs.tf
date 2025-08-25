output "vpc_id" {
    value = aws_vpc.main.id
}


output "public_subnet_id" {
    value = aws_subnet.public.id
}


output "security_group_id" {
    value = aws_security_group.web_ssh.id
}


output "instance_public_ip" {
    value = aws_instance.web.public_ip
}


output "s3_bucket_name" {
    value = aws_s3_bucket.bucket.bucket
}