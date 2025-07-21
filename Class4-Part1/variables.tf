# create a variable for the region so it will prompt
variable "region" {
  type        = string
  default     = "us-east-1" #provide region here
  description = "Provide Region"
}

variable "port" {
  type        = list(number)
  default     = [80, 22]
  description = "Ports to open in Security Group"
}