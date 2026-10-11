data "oci_data_safe_target_database_groups" "data_safe_target_database_groups_lookup" {
  for_each = var.data_safe_target_database_groups_lookup

  compartment_id                        = each.value.compartment_id
  access_level                          = each.value.access_level
  compartment_id_in_subtree             = each.value.compartment_id_in_subtree
  display_name                          = each.value.display_name
  state                                 = each.value.state
  target_database_group_filter          = each.value.target_database_group_filter
  target_database_group_id              = each.value.target_database_group_id
  time_created_greater_than_or_equal_to = each.value.time_created_greater_than_or_equal_to
  time_created_less_than                = each.value.time_created_less_than

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

