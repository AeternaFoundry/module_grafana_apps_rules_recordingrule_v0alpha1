variable "apps_rules_recordingrule_v0alpha1s" {
  description = <<EOT
Map of apps_rules_recordingrule_v0alpha1s, attributes below
Optional:
    - metadata (block):
        - folder_uid (optional)
        - uid (required)
    - options (block):
        - manager_identity (optional)
        - overwrite (optional)
    - spec (block):
        - expressions (required)
        - labels (optional)
        - metric (required)
        - paused (optional)
        - target_datasource_uid (required)
        - title (required)
        - trigger (optional, block):
            - interval (required)
EOT

  type = map(object({
    metadata = optional(list(object({
      folder_uid = optional(string)
      uid        = string
    })))
    options = optional(list(object({
      manager_identity = optional(string)
      overwrite        = optional(bool)
    })))
    spec = optional(list(object({
      expressions           = map(string)
      labels                = optional(map(string))
      metric                = string
      paused                = optional(bool)
      target_datasource_uid = string
      title                 = string
      trigger = optional(list(object({
        interval = string
      })))
    })))
  }))
}

