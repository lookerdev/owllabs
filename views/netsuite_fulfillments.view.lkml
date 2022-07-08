view: netsuite_fulfillments {
  sql_table_name: public.netsuite_fulfillments ;;

# DIMENSIONS

  dimension_group: actual_ship {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.actual_ship_date::date ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
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

  dimension_group: fulfillment {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.fulfillment_date::date;;
  }

  dimension: fulfillment_externalid {
    hidden:  yes
    type: string
    sql: ${TABLE}.fulfillment_externalid ;;
  }

  dimension: fulfillment_internalid {
    hidden: yes
    type: string
    sql: ${TABLE}.fulfillment_internalid ;;
  }

  dimension: fulfillment_number {
    type: string
    sql: ${TABLE}.fulfillment_number ;;
  }

  dimension: list_order_skus {
    type: string
    sql: ${TABLE}.list_order_skus ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
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

  dimension: posting_period {
    type: string
    sql: ${TABLE}.posting_period ;;
  }

  dimension: quantity_fulfilled {
    type: number
    sql: ${TABLE}.quantity_fulfilled ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: revenue_usd {
    type: number
    value_format_name: usd
    sql: ${TABLE}.revenue_usd ;;
  }

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: ship_status {
    type: string
    sql: ${TABLE}.ship_status ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: shopify_marketplace {
    type: string
    sql: ${TABLE}.shopify_marketplace ;;
  }

  dimension: shopify_order_number {
    type: string
    sql: ${TABLE}.shopify_order_number ;;
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

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
  }

  measure: average_revenue {
    type: average
    sql: ${revenue} ;;
  }

}
