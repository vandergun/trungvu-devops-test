variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "devops-test-app"
}

variable "app_port" {
  description = "Port exposed by the docker image"
  type        = number
  default     = 3000
}

variable "vpc_name" {
  description = "Name tag of the existing VPC"
  type        = string
  default     = "main-vpc" # Placeholder, user needs to update or provide via tfvars
}

variable "alb_name" {
  description = "Name of the existing ALB"
  type        = string
  default     = "main-alb" # Placeholder
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
  default     = "sample-app.example.com"
}

variable "app_environment" {
  description = "Application environment (e.g., development, staging, production)"
  type        = string
  default     = "production"
}
