output "id" {
  description = "The ID of the instance"
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.id }, "")
}

output "arn" {
  description = "The ARN of the instance"
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.arn }, "")
}

output "instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.instance_state }, "")
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.primary_network_interface_id }, "")
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.private_dns }, "")
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.public_dns }, "")
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.public_ip }, "")
}

output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.private_ip }, "")
}

output "availability_zone" {
  description = "The availability zone of the instance"
  value       = try({ for srv in aws_instance.ec2_instance : srv.tags.Name => srv.availability_zone }, [])
}

