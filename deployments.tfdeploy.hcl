# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "ca-west" {
  inputs = {
    prefix    = "ca-west"
  }
}

deployment "us-east" {
  inputs = {
    prefix    = "us-east"
  }
}

deployment "eu-de" {
  inputs = {
    prefix    = "eu-de"
  }
}
