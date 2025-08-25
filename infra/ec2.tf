# Find the latest Amazon Linux 2023 x86_64 AMI in the region
# (avoids hard-coding AMI IDs that vary by region)
data "aws_ami" "al2023" {
    most_recent = true
    owners = ["amazon"]


    filter {
        name = "name"
        values = ["al2023-ami-*-x86_64"]
    }


    filter {
        name = "state"
        values = ["available"]
    }
}


resource "aws_instance" "web" {
    ami = data.aws_ami.al2023.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.web_ssh.id]
    associate_public_ip_address = true
    key_name = var.key_pair_name


    user_data = <<-EOF
        #!/bin/bash
        dnf -y update
        dnf -y install nginx
        systemctl enable nginx
        echo "<h1>${var.project_name} (${var.environment}) — Hello from $(hostname)</h1>" > /usr/share/nginx/html/index.html
        systemctl start nginx
        EOF


tags = merge(local.tags, { Name = "${var.project_name}-ec2" })
}