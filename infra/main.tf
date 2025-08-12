# ### #
# AWS #
# ### #
provider "aws" {
  region = "us-east-1"
}

data "archive_file" "lambda_hello" {
  output_path = "${path.module}/hello.zip"
  source_file = "${path.module}/../hello.mjs"
  type        = "zip"
}

data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "aws_lambda_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  name               = "aws_lambda_role"
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.aws_instance_type

  tags = {
    Name = var.aws_instance_name
  }
}

resource "aws_lambda_function" "hello_world" {
  filename      = data.archive_file.lambda_hello.output_path
  function_name = "hello_world"
  role          = aws_iam_role.aws_lambda_role.arn
  handler          = "index.handler"
  runtime = "nodejs20.x"
  environment {
    variables = {
      ENVIRONMENT = "production"
      LOG_LEVEL   = "info"
    }
  }
}

# ########## #
# CLOUDFLARE #
# ########## #
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