view: products {
  sql_table_name: ecommerce.products ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."product_id" ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."brand" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."cost" ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}."retail_price" ;;
  }

  measure: count {
    type: count_distinct
    sql:  ${product_id} ;;
  }
}
