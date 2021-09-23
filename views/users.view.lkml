view: users {
  sql_table_name: ecommerce.users ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."user_id" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."age" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."gender" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: state {
    map_layer_name: us_states
    sql: ${TABLE}."state" ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}."traffic_source" ;;
  }

  dimension: age_group {
    type: tier
    tiers: [25,35,45,55,65]
    style: integer
    sql: ${TABLE}."age" ;;
  }

  dimension: state_name {
    type: string
    sql:  case ${TABLE}."state"
      when 'AL' then 'Alabama'
      when 'AK' then 'Alaska'
      when 'AZ' then 'Arizona'
      when 'AR' then 'Arkansas'
      when 'CA' then 'California'
      when 'CO' then 'Colorado'
      when 'CT' then 'Connecticut'
      when 'DE' then 'Delaware'
      when 'DC' then 'District of Columbia'
      when 'FL' then 'Florida'
      when 'GA' then 'Georgia'
      when 'HI' then 'Hawaii'
      when 'ID' then 'Idaho'
      when 'IL' then 'Illinois'
      when 'IN' then 'Indiana'
      when 'IA' then 'Iowa'
      when 'KS' then 'Kansas'
      when 'KY' then 'Kentucky'
      when 'LA' then 'Louisiana'
      when 'ME' then 'Maine'
      when 'MD' then 'Maryland'
      when 'MA' then 'Massachusetts'
      when 'MI' then 'Michigan'
      when 'MN' then 'Minnesota'
      when 'MS' then 'Mississippi'
      when 'MO' then 'Missouri'
      when 'MT' then 'Montana'
      when 'NE' then 'Nebraska'
      when 'NV' then 'Nevada'
      when 'NH' then 'New Hampshire'
      when 'NJ' then 'New Jersey'
      when 'NM' then 'New Mexico'
      when 'NY' then 'New York'
      when 'NC' then 'North Carolina'
      when 'ND' then 'North Dakota'
      when 'OH' then 'Ohio'
      when 'OK' then 'Oklahoma'
      when 'OR' then 'Oregon'
      when 'PA' then 'Pennsylvania'
      when 'RI' then 'Rhode Island'
      when 'SC' then 'South Carolina'
      when 'SD' then 'South Dakota'
      when 'TN' then 'Tennessee'
      when 'TX' then 'Texas'
      when 'UT' then 'Utah'
      when 'VT' then 'Vermont'
      when 'VA' then 'Virginia'
      when 'WA' then 'Washington'
      when 'WV' then 'West Virginia'
      when 'WI' then 'Wisconsin'
      when 'WY' then 'Wyoming'
  end

;;
  }

  measure: count {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: men_count {
    type: count_distinct
    sql:  CASE WHEN ${gender} = 'Male' THEN ${user_id} ELSE NULL END ;;
  }

  measure: female_count {
    type:  count_distinct
    sql:  CASE WHEN ${gender} = 'Female' THEN ${user_id} ELSE NULL END ;;
  }
}
