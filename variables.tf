variable "region" {
  type        = string
  description = "The region in which the resources will be launched"
  default     = "us-east-1"
}

variable "app_name" {
  type        = string
  description = "The application name for which the instance needs to be created."
  default     = "iqz"
}

variable "environment" {
  type        = string
  description = "The name of the environment in which instance needs to be created."
  default     = "demo"
}

variable "instance_name" {
  type        = string
  description = "The name of the instance that needs to be created."
  default     = ""
}

variable "create_public_eip" {
  description = "Set to false if you don't want to create a public Elastic IP for the VM."
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "The Availability Zone in which to launch the EC2 instance. If set to null, AWS will automatically choose an Availability Zone."
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "The Base64-encoded user data to provide when launching the instance."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags for resources in AWS"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The vpc in which to launch the EC2 instance. If set to null, AWS will automatically launch in default VPC."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The subnet in which to launch the EC2 instance."
  type        = string
  default     = null
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}


variable "ami_id" {
  description = "AMI to use for the instance.If not set default ubuntu 22.04 will be launched. Either ami_name or ami_id variable will be used"
  type        = string
  default     = ""
}

variable "ami_id_owner" {
  description = "List of AMI owners to limit search. Valid values: an AWS account ID, self (the current account), or an AWS owner alias (e.g., amazon, aws-marketplace, microsoft).Default is aws-marketplace."
  type        = list(string)
  default     = ["aws-marketplace"]
}

variable "ami_name" {
  description = "Name of the AMI. Checkout ami section in instances for other public-images"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection until its disabled"
  type        = string
  default     = false
}

variable "instance_type" {
  description = "Instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "volume_encryption" {
  description = "Whether to enable volume encryption. Defaults to false. Must be configured to perform drift detection."
  type        = string
  default     = "false"
}

variable "delete_volume_on_termination" {
  description = "Whether the volume should be destroyed on instance termination. Defaults to true"
  type        = string
  default     = "true"
}

variable "volume_type" {
  description = "Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1"
  type        = string
  default     = "gp3"
}

variable "volume_size" {
  description = "Size of the volume in gibibytes (GiB)"
  type        = string
  default     = "20"
}

variable "aws_iam_role" {
  description = "aws iam role for ec2 instance"
  type        = string
  default     = ""
}

variable "key_pair" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
  type        = string
  default     = null
}