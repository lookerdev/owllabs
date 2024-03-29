view: item_fulfillments_looker{
  label: "Revenue Item Fulfillments"
  sql_table_name: public.item_fulfillments_looker ;;


  dimension_group: actual_ship {
    hidden: yes
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
    sql: ${TABLE}.actual_ship_date::timestamp ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    drill_fields: [customer_name, marketplace_segment, product_category, sales_order, document_number]
  }

  # dimension: cogs_account {
  #   type: string
  #   sql: ${TABLE}.cogs_account ;;
  # }

  # dimension: cogs_amount {
  #   type: number
  #   sql: ${TABLE}.cogs_amount ;;
  # }

  dimension: customer_internal_id {
    hidden: yes
    type: string
    sql: ${TABLE}.customer_internal_id ;;
  }

  dimension: customer_name {
    label: "Customer"
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension_group: date {
    hidden: yes
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
    sql: ${TABLE}.date::timestamp ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_created::timestamp ;;
  }

  dimension: document_number {
    label: "Transaction Number"
    type: string
    sql: ${TABLE}.document_number ;;
  }

  dimension: fulfillment_type {
    type: string
    sql: ${TABLE}.fulfillment_type ;;
  }

  dimension: item {
    label: "SKU"
    type: string
    sql: ${TABLE}.item ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
    drill_fields: [customer_name, item, product_category, product_line, sales_order, document_number]
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    drill_fields: [channel, customer_name, marketplace_segment, item, product_line, sales_order, document_number]
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
    drill_fields: [channel, customer_name, marketplace_segment, item, sales_order, document_number]
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: row_number{
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension_group: sales_effective {
    hidden: yes
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
    sql: ${TABLE}.sales_effective_date::timestamp ;;
  }

  dimension: sales_order {
    type: string
    sql: ${TABLE}.sales_order ;;
  }

  dimension: shopify_order_number {
    hidden: yes
    type: string
    sql: ${TABLE}.shopify_order_number ;;
  }

  dimension: nulls_filter {
    label: "Null Values Filter"
    description: "Channel or Marketplace Segment or Product Category or Product Line is null"
    type: yesno
    sql: ${channel} is null OR ${marketplace_segment} is null OR ${product_line} is null OR ${product_category} is null ;;
  }

  # dimension: fulfillments_owl_wbo_hq {
  #   type: yesno
  #   sql: case when ${product_category} in ('Owls', 'HQ', 'WBO') then True
  #             else False end;;
  # }

  # MEASURE

  measure: count {
    hidden: yes
    type: count
    drill_fields: [customer_name]
  }

  measure: total_quantity{
    label: "Total Fulfillments"
    type: sum
    sql: ${TABLE}.quantity  ;;
    drill_fields: [channel, marketplace_segment, product_category, product_line, sales_order, total_quantity]
  }

  measure: total_cogs{
    hidden: yes
    type: sum
    sql: ${TABLE}.cogs_amount  ;;
    value_format_name: usd
  }
}
