variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "fastapi-app"
}

variable "environment" {
  description = "Environment (staging, production)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "container_image" {
  description = "Docker container image"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 8000
}

variable "desired_count" {
  description = "Desired number of ECS service instances"
  type        = number
  default     = 2
}

variable "cpu" {
  description = "Fargate instance CPU units"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Fargate instance memory"
  type        = number
  default     = 512
}

variable "domain_name" {
  description = "Domain name for the application (e.g., hamza-qureshi.duckdns.org)"
  type        = string
  default     = ""
}

variable "domain_zone" {
  description = "Route53 hosted zone for the domain (e.g., duckdns.org)"
  type        = string
  default     = ""
}

variable "enable_ipv6" {
  description = "Enable IPv6 support for ALB and Route53"
  type        = bool
  default     = false
}

variable "enable_ssl" {
  description = "Enable SSL/HTTPS with ACM certificate"
  type        = bool
  default     = false
}

variable "ssl_policy" {
  description = "SSL policy for ALB HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-TLS-1-2-2017-01"
}