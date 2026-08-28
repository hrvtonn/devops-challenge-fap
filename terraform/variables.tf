variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "sa-east-1"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
