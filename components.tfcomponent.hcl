# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "prefix" {
  type = string
}

required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }
}

provider "random" "this" {}

component "app-cache" {
  source = "./common/cache"

  inputs = {
    prefix = var.prefix
  }

  providers = {
    random = provider.random.this
  }
}

component "app-rev-proxy" {
  source = "./common/nginx"

  inputs = {
    prefix = var.prefix
  }

  providers = {
    random = provider.random.this
  }
}

output "store-cache" {
  description = "Cache component for the online store"
  type = string
  value = component.app-cache.name
  sensitive = false
  ephemeral = false
}

output "store-rev-proxy" {
  description = "Reverse proxy component for the online store"
  type = string
  value = component.app-rev-proxy.name
  sensitive = false
  ephemeral = false
}
