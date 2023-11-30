variable "create" {
  description = "Whether to create an instance or not"
  type        = bool
  default     = true
}

variable "name" {
  type        = string
  description = "The name of the instance to be created."
}

variable "my_ip" {
  type        = string
  description = "Your IP Address."
}

variable "instance_count" {
  type        = number
  description = "The number of EC2 Instances that needs to be created"
  default     = 1
}

variable "create_public_eip" {
  description = "Set to true if you want to create a public Elastic IP, false for a private Elastic IP"
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "The Availability Zone in which to launch the EC2 instance. If set to null, AWS will automatically choose an Availability Zone."
  type        = string
  default     = null
}
