view: order_items {
  sql_table_name: ecommerce.order_items ;;
  drill_fields: [order_item_id]

  dimension: order_item_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."order_item_id" ;;
  }

  dimension: inventory_item_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."inventory_item_id" ;;
  }

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."order_id" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."sale_price" ;;
  }

  measure: count {
    type: count
    drill_fields: [order_item_id, inventory_items.inventory_item_id, orders.order_id]
  }

  measure: total_sale_price {
    type: sum
    sql:  ${sale_price} ;;
    value_format: "$#,##0"
  }

  measure: average_sale_price {
    type: average_distinct
    sql: ${sale_price};;
    sql_distinct_key: ${order_item_id};;
    value_format: "$#,##0"
  }

  measure: total_profit {
    type: number
    sql: ${total_sale_price} - ${inventory_items.total_actual_cost} ;;
    value_format: "$#,##0"
  }

  measure: total_profit_int {
    type: number
    sql: ${total_sale_price} - ${inventory_items.total_actual_cost} ;;
    value_format: "$#,##0"
  }

}
