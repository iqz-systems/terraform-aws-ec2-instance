output "instance_name" {
  value       = aws_instance.ec2_instance.id
  description = "The id of the created ec2 instance."
}
