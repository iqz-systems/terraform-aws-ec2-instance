resource "aws_eip" "instance_ip" {
  instance = aws_instance.ec2_instance.id
}

resource "aws_instance" "ec2_instance" {
  ami           = var.instance_ami_id
  instance_type = var.machine_type
  tags = {
    Name = var.instance_name_value
  }

  key_name      = var.key_name
  subnet_id     = var.subnet_id

  vpc_security_group_ids = var.security_groups

  root_block_device {
    volume_size = var.boot_disk_size
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  tags = var.security_group_tags

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*
# Define an SSM association for the EC2 instance (example - you can modify as needed)(If tasks like patch management are to be performed we can use these variables.)
resource "aws_ssm_association" "ec2_ssm_association" {
  name = "AWS-ApplyPatchBaseline"

  targets {
    key    = "InstanceIds"
    values = [aws_instance.ec2_instance.id]
  }
    schedule_expression = "cron(0 0 ? * SUN *)"
}

# Define the EC2 instance lifecycle configuration
resource "aws_instance" "ec2_instance_lifecycle" {
  ami                     = var.instance_ami_id
  instance_type           = var.machine_type
  disable_api_termination = false
}
*/