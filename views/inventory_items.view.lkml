view: inventory_items {
  sql_table_name: ecommerce.inventory_items ;;
  drill_fields: [inventory_item_id]

  dimension: inventory_item_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."inventory_item_id" ;;
  }

  dimension: actual_cost {
    type: number
    sql: ${TABLE}."actual_cost" ;;
  }

  dimension: distribution_center_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."distribution_center_id" ;;
  }

  dimension: product_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."product_id" ;;
  }

  measure: count {
    type: count_distinct
    sql: ${inventory_item_id} ;;
  }

  # measure: total_actual_cost {
  #   type:  sum_distinct
  #   sql: ${actual_cost} ;;
  #   sql_distinct_key: ${inventory_item_id};;
  #   value_format: "0"
  # }
}
