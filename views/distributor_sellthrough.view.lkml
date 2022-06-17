view: distributor_sellthrough {
  sql_table_name: public.distributor_sellthrough ;;


# DIMENSIONS

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: base_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.base_cost ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_address {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_address ;;
  }

  dimension: customer_city {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_city ;;
  }

  dimension: customer_country {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_country ;;
  }

  dimension: customer_name {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_state {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_state ;;
  }

  dimension: customer_zip {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_zip ;;
  }

  dimension: distributor {
    type: string
    sql: ${TABLE}.distributor ;;
  }

  dimension: extended_base_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.extended_base_cost ;;
  }

  dimension: file_date {
    type: string
    sql: ${TABLE}.file_date ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.filename ;;
  }

  dimension: reseller_address {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_address ;;
  }

  dimension: reseller_city {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_city ;;
  }

  dimension: reseller_country {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_country ;;
  }

  dimension: reseller_name {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_name ;;
  }

  dimension: reseller_state {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_state ;;
  }

  dimension: reseller_zip {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_zip ;;
  }

  dimension: serial_numbers {
    hidden: yes
    type: string
    sql: ${TABLE}.serial_numbers ;;
  }

  dimension_group: ship {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ship_date ;;
  }

  dimension: ship_quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.ship_quantity ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: warehouse {
    type: string
    sql: ${TABLE}.warehouse ;;
  }

# MEASURES

  measure: count {
    type: count
    drill_fields: [reseller_name, customer_name, filename]
  }

  measure: total_base_cost {
    type: sum
    sql: ${base_cost} ;;
  }

  measure: average_base_cost {
    type: average
    sql: ${base_cost} ;;
  }

  measure: total_extended_base_cost {
    type: sum
    sql: ${extended_base_cost} ;;
  }

  measure: average_extended_base_cost {
    type: average
    sql: ${extended_base_cost} ;;
  }

  measure: total_ship_quantity {
    type: sum
    sql: ${ship_quantity} ;;
  }

  measure: max_ship_date {
    type: date
    sql: max(${ship_date}) ;;
  }


}
