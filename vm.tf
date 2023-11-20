resource "aws_eip" "instance_ip" {
  instance = aws_instance.ec2_instance.id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "test-vpc"
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "test-internet-gateway"
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"  # Update with your desired availability zone

  tags = {
    Name = "test-subnet"
  }
}

resource "aws_security_group" "instance_sg" {
  name        = "instance-security-group"
  description = "Security group for EC2 instance"
  vpc_id      = aws_vpc.main.id

  provisioner "local-exec" {
    command = "curl ifconfig.me > ip.txt"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-security-group"
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = "ami-06aa3f7caf3a30282"  # Update with your desired AMI ID
  instance_type          = "t2.micro"  # Update with your desired instance type
  subnet_id              = aws_subnet.main.id
  key_name               = "Catalog"  # Update with your key pair name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = {
    Name = var.instance_name_value
  }

    root_block_device {
    volume_size = var.boot_disk_size
  }
}
