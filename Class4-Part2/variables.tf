# create a variable for the region so it will prompt
variable "vpc" {
  type = object({})
}

variable "region" {
  type        = string
  description = "Provide Region in tfvars"
}

variable "port" {
  type        = list(number)
  description = "Provide Ports to open in tfvars"
}

variable "instance_type" {
  type        = string
  description = "Provide Instance Type in tfvars"
}

variable "availability_zones" {
  type        = list(string)
  description = "Provide public AZ in tfvars"
}

variable "subnet_cidrs" {
  type        = map(string)
  description = "Provide subnet cidr AZ map in tfvars"
}