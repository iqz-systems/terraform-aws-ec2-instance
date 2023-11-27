output "instance_name" {
  value = try(aws_instance.ec2_instance.tags.Name, "Name Not Found")
  description = "The name of the created EC2 instance."
}

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
  description = "The public IP address of the EC2 instance."
}

output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
  description = "The private IP address of the EC2 instance."
}
