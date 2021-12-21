view: netsuite_orders {
  sql_table_name: public.netsuite_orders ;;

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
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

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension: discount_name {
    type: string
    sql: ${TABLE}.discount_name ;;
  }

  dimension: is_taxable {
    type: yesno
    sql: ${TABLE}.is_taxable ;;
  }

  dimension: line_items_subtotal_agg {
    hidden: yes
    type: number
    sql: ${TABLE}.line_items_subtotal_agg ;;
  }

  dimension: line_items_subtotal_agg_usd {
    hidden: yes
    type: number
    sql: ${TABLE}.line_items_subtotal_agg_usd ;;
  }

  dimension: list_order_skus {
    type: string
    sql: ${TABLE}.list_order_skus ;;
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

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
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

  dimension: shipping_cost {
    type: number
    sql: ${TABLE}.shipping_cost ;;
  }

  dimension: shopify_marketplace {
    type: string
    sql: ${TABLE}.shopify_marketplace ;;
  }

  dimension: shopify_order_number {
    type: string
    sql: ${TABLE}.shopify_order_number ;;
  }

  dimension: subsidiary {
    type: string
    sql: ${TABLE}.subsidiary ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}.subtotal ;;
  }

  dimension: subtotal_usd {
    type: number
    value_format_name: usd
    sql: ${TABLE}.subtotal_usd ;;
  }

  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
  }

  dimension: tax_total {
    type: number
    sql: ${TABLE}.tax_total ;;
  }

  dimension: terms {
    type: string
    sql: ${TABLE}.terms ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
  }


# MEASURES
  measure: count {
    type: count
    drill_fields: [discount_name, customer_name]
  }
}
