view: item_fulfillments_looker {
  sql_table_name: public.item_fulfillments_looker ;;

  # dimension: actual_ship_date {
  #   type: string
  #   sql: ${TABLE}.actual_ship_date ;;
  # }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: cogs_account {
    type: string
    sql: ${TABLE}.cogs_account ;;
  }

  dimension: cogs_amount {
    type: number
    sql: ${TABLE}.cogs_amount ;;
  }

  dimension: created_from {
    type: string
    sql: ${TABLE}.created_from ;;
  }

  dimension: customer_country {
    type: string
    sql: ${TABLE}.customer_country ;;
  }

  dimension: customer_internal_id {
    type: string
    sql: ${TABLE}.customer_internal_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  # dimension: date_created {
  #   type: string
  #   sql: ${TABLE}.date_created ;;
  # }

  dimension: document_number {
    type: string
    sql: ${TABLE}.document_number ;;
  }

  dimension: item {
    label: "SKU"
    type: string
    sql: ${TABLE}.item ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: ${TABLE}.primary_key ;;
  }

  dimension: product_category {
    label: "Product"
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
  }

  dimension: quantity {
    description: "Absolute quantity"
    type: number
    sql: ${TABLE}.quantity ;;
  }

  # dimension: sales_effective_date {
  #   type: string
  #   sql: ${TABLE}.sales_effective_date ;;
  # }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: total_quantity{
    type: sum
    sql: ${TABLE}.quantity  ;;
  }

  measure: total_cogs{
    type: sum
    sql: ${TABLE}.cogs_amount  ;;
    value_format_name: usd
  }

}
