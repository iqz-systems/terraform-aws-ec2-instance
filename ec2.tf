resource "aws_eip" "instance_ip" {
  count    = var.create_public_eip ? 1 : 0
  instance = aws_instance.ec2_instance.id
  tags = {
    Name = format("%s-%s-%s", var.app_name, var.environment, "EIP")
  }
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = var.ami_id_owner
}

module "sg" {
  source                                         = "terraform-aws-modules/security-group/aws"
  version                                        = "4.7.0"
  name                                           = format("%s-%s-%s", var.app_name, var.environment, "sg")
  vpc_id                                         = var.vpc_id
  ingress_with_cidr_blocks                       = var.ingress_with_cidr_blocks
  computed_ingress_with_source_security_group_id = var.ingress_with_source_security_group_id
  egress_with_cidr_blocks = [{
    from_port   = 0
    to_port     = 0
    protocol    = -1
    description = "All Traffic egress from everywhere on all protocols"
    cidr_blocks = "0.0.0.0/0"
  }]
  tags = merge(
    { "Name" = format("%s-%s-%s", var.app_name, var.environment, "sg") },
    var.tags
  )
}


resource "aws_instance" "ec2_instance" {
  ami                     = length(var.ami_id) > 0 ? var.ami_id : data.aws_ami.ami.id
  key_name                = var.key_pair
  availability_zone       = var.availability_zone
  subnet_id               = var.subnet_id
  iam_instance_profile    = var.aws_iam_role
  vpc_security_group_ids  = [module.sg.security_group_id]
  user_data_base64        = var.user_data_base64
  disable_api_termination = var.disable_api_termination
  instance_type           = var.instance_type
  tags = merge({
    Name = length(var.instance_name) > 0 ? var.instance_name : format("%s-%s-%s", var.app_name, var.environment, "vm")
  }, var.tags)

    root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    delete_on_termination = var.delete_volume_on_termination
    encrypted = var.volume_encryption
  }
}
