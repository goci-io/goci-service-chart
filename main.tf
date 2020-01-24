terraform {
  required_version = ">= 0.12.1"
}

provider "helm" {
  version = "~> 0.10"
}

data "null_data_source" "values" {
  count = length(var.values)

  inputs = {
    content = file(element(var.values, count.index))
  }
}

resource "helm_release" "deployment" {
  name          = var.name
  chart         = "./"
  recreate_pods = true
  wait          = true
  values        = data.null_data_source.values.*.outputs.content
  
  dynamic "set" {
    for_each = var.set

    content {
      name  = set.key
      value = set.value
    }
  }

  dynamic "set_sensitive" {
    for_each = var.set_sensitive

    content {
      name  = set_sensitive.key
      value = set_sensitive.value
    }
  }
}
