view: orders {
  sql_table_name: ecommerce.orders ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."order_id" ;;
  }

  filter: date_filter {
    type: date
  }

  # dimension_group: filter_start_date {
  #   type: time
  #   timeframes: [raw]
  #   sql:coalesce({% date_start date_filter %}, timestamp '2016-01-01') ;;
  # }

  # dimension_group: filter_end_date {
  #   type: time
  #   timeframes: [raw]
  #   sql: COALESCE({% date_end date_filter %},CURRENT_TIMESTAMP);;
  # }

  dimension: created_at_ts {
    type: number
    sql: TIMESTAMP 'epoch' + ${TABLE}."created_at" * INTERVAL '1 second' ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }

  dimension_group: order_date {
    type: time
    timeframes: [date, week, month, year]
    datatype: timestamp
    sql: ${created_at_ts} ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id, users.last_name, users.first_name, users.user_id, order_items.count]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${order_id} ;;
  }
}
