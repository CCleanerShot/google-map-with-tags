output "ec2-ip" {
  description = "The Public IPv4 address for the EC2"
  value       = aws_instance.app_server.public_ip
}