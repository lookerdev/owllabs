view: netsuite_orders_line_items {
  sql_table_name: public.netsuite_orders_line_items ;;

# DIMENSIONS
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_usd {
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount_usd ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension: cogs_per_item {
    type: number
    sql: ${TABLE}.cogs_per_item ;;
  }

  dimension: cogs_total {
    type: number
    sql: ${TABLE}.cogs_total ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_internalid {
    hidden: yes
    type: string
    sql: ${TABLE}.customer_internalid ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: memo {
    hidden: yes
    type: string
    sql: ${TABLE}.memo ;;
  }

  dimension_group: order {
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
    sql: ${TABLE}.order_date::timestamp ;;
  }

  dimension: order_externalid {
    hidden: yes
    type: string
    sql: ${TABLE}.order_externalid ;;
  }

  dimension: order_internalid {
    hidden: yes
    type: string
    sql: ${TABLE}.order_internalid ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
  }

  dimension: quantity_fulfilled {
    type: number
    sql: ${TABLE}.quantity_fulfilled ;;
  }

  dimension: quantity_ordered {
    type: number
    sql: ${TABLE}.quantity_ordered ;;
  }

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: sales_rep {
    type: string
    sql: ${TABLE}.sales_rep ;;
  }

  dimension: sales_rep_id {
    hidden: yes
    type: string
    sql: ${TABLE}.sales_rep_id ;;
  }

  dimension: salesforce_opportunity_id {
    type: string
    sql: ${TABLE}.salesforce_opportunity_id ;;
  }

  dimension: shopify_marketplace {
    type: string
    sql: ${TABLE}.shopify_marketplace ;;
  }

  dimension: shopify_order_number {
    type: string
    sql: ${TABLE}.shopify_order_number ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: subsidiary {
    type: string
    sql: ${TABLE}.subsidiary ;;
  }

  dimension: terms {
    type: string
    sql: ${TABLE}.terms ;;
  }

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
  }

# MEASURES

  measure: count {
    type: count
    drill_fields: [customer_name]
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

}
