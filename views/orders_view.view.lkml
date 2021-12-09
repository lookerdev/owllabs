view: orders_view {
  # sql_table_name: public.orders_view ;;
  # sql_table_name: public.shopify_orders_view ;;
  sql_table_name: public.shopify_orders_redshift ;;

  dimension: billing_address_address1 {
    type: string
    sql: ${TABLE}.billing_address_address1 ;;
  }

  dimension: billing_address_address2 {
    type: string
    sql: ${TABLE}.billing_address_address2 ;;
  }

  dimension: billing_address_city {
    type: string
    sql: ${TABLE}.billing_address_city ;;
  }

  dimension: billing_address_company {
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: billing_address_country {
    type: string
    sql: ${TABLE}.billing_address_country ;;
  }

  dimension: billing_address_country_code {
    type: string
    sql: ${TABLE}.billing_address_country_code ;;
  }

  dimension: billing_address_first_name {
    type: string
    sql: ${TABLE}.billing_address_first_name ;;
  }

  dimension: billing_address_last_name {
    type: string
    sql: ${TABLE}.billing_address_last_name ;;
  }

  dimension: billing_address_name {
    type: string
    sql: ${TABLE}.billing_address_name ;;
  }

  dimension: billing_address_province {
    type: string
    sql: ${TABLE}.billing_address_province ;;
  }

  dimension: billing_address_province_code {
    type: string
    sql: ${TABLE}.billing_address_province_code ;;
  }

  dimension: billing_address_zip {
    type: string
    sql: ${TABLE}.billing_address_zip ;;
  }

  dimension: cancel_reason {
    label: "Order Cancel Reason"
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension_group: cancelled {
    label: "Order Cancel"
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
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension_group: created {
    label: "Order"
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
    sql: ${TABLE}.created_at::timestamp ;;
  }

  dimension: customer_currency {
    type: string
    sql: ${TABLE}.customer_currency ;;
  }

  dimension: financial_status {
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: name {
    label: "Order Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }


  dimension: order_primary_key  {
    primary_key: yes
    type: string
    sql: CONCAT(${order_id},${store}) ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
    hidden: yes
  }

  dimension: order_status_url {
    type: string
    sql: ${TABLE}.order_status_url ;;
  }

  dimension: presentment_currency {
    type: string
    sql: ${TABLE}.presentment_currency ;;
  }

  dimension_group: processed {
    label: "Order Process"
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
    sql: ${TABLE}.processed_at ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;

  }

  dimension: subtotal_price {
    type: number
    sql: ${TABLE}.subtotal_price ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: taxes_included {
    type: yesno
    sql: ${TABLE}.taxes_included ;;
    hidden: yes
  }

  dimension: total_discounts {
    type: number
    sql: ${TABLE}.total_discounts ;;
  }

  dimension: total_line_items_price {
    type: number
    sql: ${TABLE}.total_line_items_price ;;
  }

  dimension: total_line_items_price_set_presentment_money_amount {
    type: number
    sql: ${TABLE}.total_line_items_price_set_presentment_money_amount ;;
    hidden: yes
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  dimension: total_price_set_presentment_money_amount {
    type: number
    sql: ${TABLE}.total_price_set_presentment_money_amount ;;
    hidden: yes
  }

  dimension_group: updated {
    label: "Order Update"
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
    sql: ${TABLE}.updated_at ;;
  }

# MEASURES
  measure: count_orders {
    type: count_distinct
    sql: concat(${TABLE}.store,${TABLE}.name) ;;
    drill_fields: [order_number, billing_address_first_name, billing_address_last_name, billing_address_name]
  }

  measure: sum_subtotal_price {
    type: sum
    sql: ${subtotal_price};;
  }

}
