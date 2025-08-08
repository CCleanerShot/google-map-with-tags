provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.aws_instance_type

  tags = {
    Name = var.aws_instance_name
  }
}

provider "cloudflare" {
  api_key = var.cloudflare_api_key
  email   = var.cloudflare_email
}

data "cloudflare_zone" "website_zone" {
  filter = {
    name = var.website_domain
  }
}

resource "cloudflare_dns_record" "dns_record" {
  comment = "DNS record for website"
  content = aws_instance.app_server.public_ip
  name    = var.website_domain
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = data.cloudflare_zone.website_zone.zone_id
}