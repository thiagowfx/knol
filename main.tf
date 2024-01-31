terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
    }
    linode = {
      source = "linode/linode"
    }
  }
}

provider "linode" {}

data "http" "github_keys" {
  url = "https://api.github.com/users/${var.github_username}/keys"
}

locals {
  keys = jsondecode(data.http.github_keys.response_body)[*].key
}

resource "linode_instance" "coruscant" {
  type             = "g6-nanode-1"
  image            = "linode/alpine3.19"
  label            = var.linode_hostname
  region           = var.linode_region
  authorized_keys  = local.keys
  backups_enabled  = "false"
  booted           = "true"
  watchdog_enabled = "true"
}
