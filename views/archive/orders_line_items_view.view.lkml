view: orders_line_items_view {
  sql_table_name: public.orders_line_items_view ;;

  dimension: fulfillable_quantity {
    type: number
    sql: ${TABLE}.fulfillable_quantity ;;
  }

  dimension: fulfillment_service {
    type: string
    sql: ${TABLE}.fulfillment_service ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id_key {
    type: number
    value_format_name: id
    sql: ${TABLE}.order_id_key ;;
  }

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension_group: order_cancelled {
    # hidden: yes
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
    sql: ${TABLE}.order_cancelled ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }


  dimension_group: order_created {
    # hidden: yes
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
    sql: ${TABLE}.order_created ;;
  }

  dimension_group: order_updated {
    # hidden: yes
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
    sql: ${TABLE}.order_updated ;;
  }

  dimension_group: order_processed {
    # hidden: yes
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
    sql: ${TABLE}.order_processed ;;
  }

  dimension: primary_key {
    type: string
    sql: ${TABLE}.primary_key ;;
    primary_key: yes
    hidden: yes
  }

  dimension: pre_tax_price {
    type: number
    sql: ${TABLE}.pre_tax_price ;;
  }

  dimension: pre_tax_price_set__presentment_money__amount {
    type: number
    sql: ${TABLE}.pre_tax_price_set__presentment_money__amount ;;
  }

  dimension: pre_tax_price_set__presentment_money__currency_code {
    type: string
    sql: ${TABLE}.pre_tax_price_set__presentment_money__currency_code ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_set__presentment_money__currency_code {
    type: string
    sql: ${TABLE}.price_set__presentment_money__currency_code ;;
  }

  dimension: price_set__shop_money__amount {
    type: number
    sql: ${TABLE}.price_set__shop_money__amount ;;
  }

  dimension: price_set__shop_money__currency_code {
    type: string
    sql: ${TABLE}.price_set__shop_money__currency_code ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: unbundle_qty {
    type: number
    sql: ${TABLE}.unbundle_qty ;;
  }

  dimension: unbundled_sku {
    type: string
    sql: ${TABLE}.unbundled_sku ;;
  }


# MEASURES
  measure: order_lines {
    type: count
    drill_fields: [name]
  }

  measure: sum_of_order_value {
    type: sum
    sql: ${TABLE}.price ;;
  }

  # measure: sum_of_ordered_units_excl_cancelled {
  #   type: sum
  #   sql: ${TABLE}.quantity  ;;
  #   filters: [orders_view.cancel_reason: "NULL"]
  # }

  measure: sum_of_ordered_units_excl_cancelled {
    type: sum
    sql: ${TABLE}.quantity  ;;
    filters: [cancel_reason: "NULL"]
  }

  measure: sum_of_ordered_units_incl_cancelled {
    type: sum
    sql: ${TABLE}.quantity  ;;
  }

  # measure: sum_of_cancelled_units {
  #   type: sum
  #   sql: ${TABLE}.quantity  ;;
  #   filters: [orders_view.cancel_reason: "-NULL"]
  # }

  measure: sum_of_cancelled_units {
    type: sum
    sql: ${TABLE}.quantity  ;;
    filters: [cancel_reason: "-NULL"]
  }


}
