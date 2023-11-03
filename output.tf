output "instance_name" {
  value = aws_instance.ec2_instance.tags.Name
  description = "The name of the created EC2 instance."
}

output "instance_ip" {
  value       = aws_instance.ec2_instance.private_ip
  description = "The private IP address of the EC2 instance."
}
