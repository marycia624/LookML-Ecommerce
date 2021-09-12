view: distribution_centers {
  sql_table_name: ecommerce.distribution_centers ;;
  drill_fields: [distribution_center_id]

  dimension: distribution_center_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."distribution_center_id" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: count {
    type: count
    drill_fields: [distribution_center_id, name, inventory_items.count]
  }
}
