resource "aws_eip" "instance_ip" {
  count    = var.create && var.create_public_eip ? var.instance_count : 0
  instance = aws_instance.ec2_instance[count.index].id
  tags = {
    Name = local.eip_name
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = local.vpc_name
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = local.ig_name
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone != null ? var.availability_zone : ""

  tags = {
    Name = local.subnet_name
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
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.my_ips
  }

   ingress {
    from_port   = local.http_port
    to_port     = local.http_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }

  ingress {
    from_port   = local.https_port
    to_port     = local.https_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }

  egress {
    from_port   = local.all_ports
    to_port     = local.all_ports
    protocol    = local.any_protocol
    cidr_blocks = local.all_ips
  }

  tags = {
    Name = local.sg_name
  }
}

resource "aws_instance" "ec2_instance" {
  count                  = var.create ? local.instance_count : 0
  ami                    = local.ami_id
  instance_type          = local.machine_type
  key_name               = local.key_name
  availability_zone      = var.availability_zone
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = {
    Name = "${var.name}-${count.index + 1}"
  }

    root_block_device {
    volume_size = local.disk_size
  }
}
