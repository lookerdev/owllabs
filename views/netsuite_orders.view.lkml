view: netsuite_orders {
  sql_table_name: public.netsuite_orders ;;


## DIMENSIONS

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

  dimension: currency_exchange_rate {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.currency_exchange_rate ;;
  }

  dimension: discount_name {
    type: string
    sql: ${TABLE}.discount_name ;;
  }

  dimension: discount_total {
    type: number
    sql: ${TABLE}.discount_total ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: entity_internalid {
    # hidden: yes
    type: string
    sql: ${TABLE}.entity_internalid ;;
  }

  dimension: entity_name {
    type: string
    sql: ${TABLE}.entity_name ;;
  }

  dimension: externalid {
    hidden: yes
    type: string
    sql: ${TABLE}.externalid ;;
  }

  dimension: internalid {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.internalid ;;
  }

  dimension: is_taxable {
    type: yesno
    sql: ${TABLE}.is_taxable ;;
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
    sql: ${TABLE}.order_date ;;
  }

  # dimension: month_num_year {
  #   hidden: yes
  #   type: string
  #   sql: ${order_month} || ' ' || ${order_year};;
  # }

  # dimension_group: sales_order_delete {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.sales_order_delete_date ;;
  # }

  dimension: order_number {
    label: "Sales Order Number"
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: quantity_ordered {
    type: sum
    sql: ${TABLE}.quantity_ordered ;;
  }

  dimension: sales_rep {
    type: string
    sql: ${TABLE}.sales_rep ;;
  }

  dimension: sales_rep_internalid {
    hidden: yes
    type: string
    sql: ${TABLE}.sales_rep_internalid ;;
  }

  dimension: salesforce_opportunity_id {
    type: string
    sql: ${TABLE}.salesforce_opportunity_id ;;
  }

  dimension: shipping_total {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.shipping_cost ;;
  }

  dimension: shopify_store {
    type: string
    sql: ${TABLE}.shopify_store ;;
  }

  dimension: shopify_order_name {
    type: string
    sql: ${TABLE}.shopify_order_name ;;
  }

  dimension: shopify_order_number {
    type: string
    sql: ${TABLE}.shopify_order_number ;;
  }

  dimension: subsidiary_name {
    type: string
    sql: ${TABLE}.subsidiary_name ;;
  }

  dimension: subtotal {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.subtotal ;;
  }

  # dimension: subtotal_line_items_agg {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.subtotal_line_items_agg ;;
  # }

  measure: subtotal_usd {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.subtotal_usd ;;
  }

  # dimension: subtotal_usd_line_items_agg {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.subtotal_usd_line_items_agg ;;
  # }

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
    drill_fields: [order_number, entity_name]
  }
}
