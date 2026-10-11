resource "grafana_apps_rules_recordingrule_v0alpha1" "apps_rules_recordingrule_v0alpha1s" {
  for_each = var.apps_rules_recordingrule_v0alpha1s


  dynamic "metadata" {
    for_each = each.value.metadata != null ? each.value.metadata : []
    content {
      folder_uid = metadata.value.folder_uid
      uid        = metadata.value.uid
    }
  }

  dynamic "options" {
    for_each = each.value.options != null ? each.value.options : []
    content {
      manager_identity = options.value.manager_identity
      overwrite        = options.value.overwrite
    }
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {
      expressions           = spec.value.expressions
      labels                = spec.value.labels
      metric                = spec.value.metric
      paused                = spec.value.paused
      target_datasource_uid = spec.value.target_datasource_uid
      title                 = spec.value.title
      dynamic "trigger" {
        for_each = spec.value.trigger != null ? spec.value.trigger : []
        content {
          interval = trigger.value.interval
        }
      }
    }
  }
}

