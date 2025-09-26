terraform {
  required_providers {
    morpheus = {
      source  = "gomorpheus/morpheus"
      version = ">= 0.0.0"
    }
  }
}

provider "morpheus" {
  url   = var.morpheus_url
  token = var.morpheus_api_token
}

resource "local_file" "hello" {
  content  = "Hello from Terraform!"
  filename = "${path.module}/hello.txt"
}