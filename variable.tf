variable "project_region" {
  type        = string
  description = "The region where the resources will be created."
  default = "us-east-1"
}

variable "instance_name_value" {
  type        = string
  description = "The name of the instance to be created."
}

variable "key_name" {
  type        = string
  description = "The name of the EC2 key pair to use for SSH access."
  default     = "Catalog"
}

variable "machine_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the machine to create."
}

variable "boot_disk_size" {
  type        = number
  default     = 8
  description = "The size in GB for the boot disk to be used for the instance."
}

variable "security_groups" {
  type        = list(string)
  description = "A list of security group IDs to associate with the EC2 instance."
  default     = null
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to associate this instance with."
  default     = null
}

variable "instance_ami_id" {
  type        = string
  description = "The ID of the AWS AMI to use for the instance."
  default = "ami-06aa3f7caf3a30282"
}

variable "security_group_tags" {
  type        = map(string)
  description = "Tags to be applied to the security group."
  default     = {}
}

variable "subnet_id" {
  type        = string
  description = "The subnet to associate this instance with."
  default     = null
}

variable "my_ip" {
  type        = string
  description = "Your IP Address."
}

variable "network_tags" {
  type        = list(string)
  description = "A list of network tags to be attached to the instance."
  default     = []
}

variable "resource_policies" {
  type        = list(string)
  description = "A list of resource policies to be associated with the instance."
  default     = []
}
