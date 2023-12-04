# terraform-aws-ec2-instance

Terraform module to create a AWS EC2 instance with meaningful defaults.

This module uses the [AWS](https://registry.terraform.io/providers/hashicorp/aws) provider.

## Usage

```hcl
module "ec2" {
  source            = "iqz-systems/ec2-instance"
  version           = "1.0.0"

  region            = "us-east-1"
  app_name          = "iqz"
  environment       = "dev"
  create_public_eip = true
  availability_zone = "us-east-1a"
  vpc_id            = "my-vpc"
  subnet_id         = "my-subnet"
  ami_id_owner      = ["aws-marketplace"]
  ami_name          = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" # instead of ami_name. you can pass ami_id also
  instance_type     = "t3.micro"
  volume_size       = 20
  volume_type       = "gp3"
  key_pair          = "my-keypair" 

  ingress_with_cidr_blocks = [{
    description = "allow-ssh"
    protocol    = "ssh"
    from_port   = 22
    to_port     = 22
    type        = "ingress"
    cidr_blocks = "101.188.67.134/32"  # add the ip or cidr block from where ssh needs to be allowed
  }]

  tags = {
    app = demo
  }
}
```

