view: orders_view {
  sql_table_name: public.orders_view ;;

  dimension: billing_address__address1 {
    type: string
    sql: ${TABLE}.billing_address__address1 ;;
  }

  dimension: billing_address__address2 {
    type: string
    sql: ${TABLE}.billing_address__address2 ;;
  }

  dimension: billing_address__city {
    type: string
    sql: ${TABLE}.billing_address__city ;;
  }

  dimension: billing_address__company {
    type: string
    sql: ${TABLE}.billing_address__company ;;
  }

  dimension: billing_address__country {
    type: string
    sql: ${TABLE}.billing_address__country ;;
  }

  dimension: billing_address__country_code {
    type: string
    sql: ${TABLE}.billing_address__country_code ;;
  }

  dimension: billing_address__first_name {
    type: string
    sql: ${TABLE}.billing_address__first_name ;;
  }

  dimension: billing_address__last_name {
    type: string
    sql: ${TABLE}.billing_address__last_name ;;
  }

  dimension: billing_address__name {
    type: string
    sql: ${TABLE}.billing_address__name ;;
  }

  dimension: billing_address__province {
    type: string
    sql: ${TABLE}.billing_address__province ;;
  }

  dimension: billing_address__province_code {
    type: string
    sql: ${TABLE}.billing_address__province_code ;;
  }

  dimension: billing_address__zip {
    type: string
    sql: ${TABLE}.billing_address__zip ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer__currency {
    type: string
    sql: ${TABLE}.customer__currency ;;
  }

  dimension: financial_status {
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: shopify_order_number {
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
    type: string
    sql: CONCAT(${order_id},${store}) ;;
    primary_key:  yes

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

  dimension: total_line_items_price_set__presentment_money__amount {
    type: number
    sql: ${TABLE}.total_line_items_price_set__presentment_money__amount ;;
    hidden: yes
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  dimension: total_price_set__presentment_money__amount {
    type: number
    sql: ${TABLE}.total_price_set__presentment_money__amount ;;
    hidden: yes
  }

  dimension_group: updated {
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

  measure: orders {
    type: count_distinct
    sql: concat(${TABLE}.store,${TABLE}.name) ;;
    drill_fields: [shopify_order_number, billing_address__first_name, billing_address__last_name, billing_address__name]
  }

  measure: sum_of_subtotal_price {
    type: sum
    sql: ${subtotal_price};;
  }

}
