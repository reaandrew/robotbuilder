variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-2"
}

variable "domain_name" {
  description = "Root domain name (hosted zone)"
  type        = string
  default     = "jackrea.co.uk"
}

variable "subdomain" {
  description = "Full subdomain for the robot builder website"
  type        = string
  default     = "robotbuilder.jackrea.co.uk"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "robot-builder"
}