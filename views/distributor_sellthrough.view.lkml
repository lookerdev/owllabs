view: distributor_sellthrough {
  sql_table_name: public.distributor_sellthrough ;;


# DIMENSIONS

  dimension: base_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.base_cost ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_name {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_address_line1 {
    label: "Customer Address"
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_address_line1 ;;
  }

  dimension: customer_address_line2 {
    hidden: yes
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_address_line2 ;;
  }

  dimension: customer_city {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_city ;;
  }

  dimension: customer_state {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_state ;;
  }

  dimension: customer_country {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_country ;;
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

  dimension: reseller_name {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_name ;;
  }

  dimension: reseller_address_line1 {
    label: "Reseller Address"
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_address_line1 ;;
  }

  dimension: reseller_address_line2 {
    hidden: yes
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_address_line2 ;;
  }

  dimension: reseller_city {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_city ;;
  }

  dimension: reseller_state {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_state ;;
  }

  dimension: reseller_country {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_country ;;
  }

  dimension: reseller_zip {
    group_label: "Reseller Info"
    type: string
    sql: ${TABLE}.reseller_zip ;;
  }

  dimension: serial_numbers {
    # hidden: yes
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
    label: "SKU"
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: warehouse {
    type: string
    sql: ${TABLE}.warehouse ;;
  }

  dimension: transaction_reference_no {
    label: "Transaction Reference #"
    description: "Depending on Dsitributor this is Order #, Invoice #, or PO #."
    type: string
    sql: ${TABLE}.transaction_reference_no ;;
  }

  dimension: salesforce_caseid {
    label: "Salesforce Case ID"
    type: string
    sql: ${TABLE}.salesforce_caseid ;;
  }

  dimension: file_date {
    # hidden: yes
    type: string
    sql: ${TABLE}.file_date ;;
  }

  dimension: filename {
    label: "File Name"
    # hidden: yes
    type: string
    sql: ${TABLE}.filename ;;
  }

  dimension: primary_key {
    primary_key: yes
    # hidden: yes
    type: string
    sql: ${TABLE}.primary_key ;;
  }

  dimension: uuid {
    hidden: yes
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: timestamp {
    hidden: yes
    type: date
    sql: ${TABLE}.timestamp ;;
  }




# MEASURES

  measure: count {
    label: "Count of Records"
    type: count
    drill_fields: [distributor, reseller_name, customer_name]
  }

  measure: sum_base_cost {
    label: "Total Base Cost"
    type: sum
    sql: ${base_cost} ;;
    value_format: "0.00"
  }

  measure: avg_base_cost {
    label: "Avg. Base Cost"
    type: average
    sql: ${base_cost} ;;
    value_format: "0.00"
  }

  measure: sum_extended_base_cost {
    label: "Total Extended Base Cost"
    type: sum
    sql: ${extended_base_cost} ;;
    value_format: "0.00"
  }

  measure: avg_extended_base_cost {
    label: "Avg. Extended Base Cost"
    type: average
    sql: ${extended_base_cost} ;;
    value_format: "0.00"
  }

  measure: sum_ship_quantity {
    label: "Total Ship Quantity"
    type: sum
    sql: ${ship_quantity} ;;
  }

  measure: max_ship_date {
    label: "Most Recent Ship Date"
    type: date
    sql: max(${ship_date}) ;;
  }


}
