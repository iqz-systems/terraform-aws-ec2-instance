resource "aws_eip" "instance_ip" {
  instance = aws_instance.ec2_instance.id

  tags = {
    Name = var.eip_name_value
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = var.instance_ami_id
  instance_type          = var.machine_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  availability_zone      = var.availability_zone

  vpc_security_group_ids = var.security_groups

   tags = {
    Name = var.instance_name_value
  }

  root_block_device {
    volume_size = var.boot_disk_size
  }

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  user_data = <<-EOF
    #cloud-config
    enable_oslogin: true
    EOF

}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_instance_role.name
}

resource "aws_iam_role" "ec2_instance_role" {
  name = "ec2_instance_role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_security_group" "ec2_security_group" {
  vpc_id      = var.vpc_id
  tags        = var.security_group_tags
}

