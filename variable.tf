variable "project_region" {
  type        = string
  description = "The region where the resources will be created."
  default = "us-east-1"
}

variable "instance_name_value" {
  type        = string
  description = "The name of the instance to be created."
}

variable "eip_name_value" {
  type        = string
  description = "The name of the instance to be created."
  default = "cloud-ip"
}

variable "key_name" {
  type        = string
  description = "The name of the EC2 key pair to use for SSH access."
}

variable "machine_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the machine to create."
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = "us-east-1a"
}

variable "boot_disk_size" {
  type        = number
  default     = 8
  description = "The size in GB for the boot disk to be used for the instance."
}

variable "security_groups" {
  type        = list(string)
  default     = []
  description = "A list of security group IDs to associate with the EC2 instance."
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "The VPC ID to associate this instance with."
}

variable "create_new_iam_role" {
  description = "Whether to create a new IAM role or use an existing one."
  type        = bool
  default     = false
}

variable "instance_ami_id" {
  type = string
  description = "The ID of the AWS AMI to use for the instance."
}

variable "security_group_tags" {
  type        = map(string)
  description = "Tags to be applied to the security group."
  default     = {}
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "The subnet to associate this instance with."
}

variable "network_tags" {
  type        = list(string)
  description = "A list of network tags to be attached to the instance."
  default     = []
}
