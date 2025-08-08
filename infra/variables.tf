variable "aws_instance_name" {
  default     = "Website"
  description = "The value of the EC2's Name tag"
  type        = string
}

variable "aws_instance_type" {
  default     = "t2.micro"
  description = "The type of the EC2 instance"
  type        = string
}

variable "cloudflare_api_key" {
  description = "The API Key (Legacy) for Cloudflare"
  sensitive   = true
  type        = string
}

variable "cloudflare_email" {
  description = "The Email for Cloudflare"
  sensitive   = true
  type        = string
}

variable "website_domain" {
  description = "The Domain Name for the website"
  sensitive   = true
  type        = string
}
