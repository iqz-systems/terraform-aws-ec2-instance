locals {
  all_ports      = 0
  ssh_port       = 22
  http_port      = 80
  https_port     = 443
  tcp_protocol   = "tcp"
  any_protocol   = "-1"
  all_ips        = ["0.0.0.0/0"]
  my_ips         = [var.my_ip]
  ami_id         = "ami-06aa3f7caf3a30282"
  machine_type   = "t2.micro"
  region         = "us-east-1"
  disk_size      = "8"
  key_name       = "Catalog"
  instance_count = "1"
  eip_name       = "iqz-ip"
  vpc_name       = "iqz-vpc"
  ig_name        = "iqz-internet-gateway"
  subnet_name    = "iqz-subnet"
  sg_name        = "iqz-security-group"
}
