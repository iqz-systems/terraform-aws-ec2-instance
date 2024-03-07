output "instance_name" {
  value       = aws_instance.ec2_instance.id
  description = "The id of the created ec2 instance."
}

output "instance_ip" {
  value       = aws_instance.ec2_instance.public_ip
  description = "The IP of the created ec2 instance."
}