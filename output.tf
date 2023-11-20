output "instance_name" {
  value = aws_instance.ec2_instance.tags.Name
  description = "The name of the created EC2 instance."
}

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
}
