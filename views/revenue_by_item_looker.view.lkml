view: revenue_by_item_looker {
  sql_table_name: public.revenue_by_item_looker ;;
  label: "Revenue by Item"
  # drill_fields: [account_line_name, channel, customer_name, transaction_number, marketplace_segment,item]


# DIMENSIONS
  dimension: account_id {
    label: "Account Internal id"
    hidden: yes
    type: string
    sql: ${TABLE}.account_line_internal_id ;;
  }

  dimension: account_line_name {
    label: "Account Name"
    type: string
    sql: ${TABLE}.account_line_name ;;
    drill_fields: [channel, customer_name, marketplace_segment, product_category, transaction_number]
  }

  dimension: account_line_name_glstyle {
    hidden: yes
    type: string
    sql: ${TABLE}.account_line_name_glstyle ;;
  }

  dimension: account_line_number {
    label: "Account Number"
    type: string
    sql: ${TABLE}.account_line_number ;;
  }

  dimension: accounting_period_name {
    label: "Accounting Period"
    # hidden: yes
    type: string
    sql: ${TABLE}.accounting_period_name ;;
  }

  dimension: amount {
    hidden: yes
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    drill_fields: [account_line_name, customer_name, marketplace_segment, product_category, transaction_number]
  }

  dimension_group: date {
    hidden: yes
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
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: customer_billing_address_country {
    hidden: yes
    type: string
    sql: ${TABLE}.entity_billing_address_country ;;
  }

  dimension: customer_internal_id {
    hidden: yes
    type: string
    sql: ${TABLE}.entity_internal_id ;;
  }

  dimension: customer_name {
    label: "Customer"
    type: string
    sql: ${TABLE}.entity_name ;;
  }

  dimension: item {
    label: "SKU"
    type: string
    sql: ${TABLE}.item ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
    drill_fields: [customer_name, item, product_category, product_line]
  }

  dimension: memo {
    hidden: yes
    type: string
    sql: ${TABLE}.memo ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    drill_fields: [account_line_name, channel, customer_name, marketplace_segment, item, product_line, transaction_number]
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
    drill_fields: [account_line_name, channel, customer_name, marketplace_segment, item, transaction_number]
  }

  dimension: row_number {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: sku_description {
    hidden: yes
    sql: ${TABLE}.description ;;
  }

  # dimension: source_rev_rec_document_number {
  #   label: "Source Document Number"
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.source_rev_rec_document_number ;;
  # }

  dimension: document_type {
    label: "Document Type"
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: subsidiary_name {
    hidden: yes
    sql: ${TABLE}.subsidiary_name ;;
  }

  dimension: transaction_number {
    label: "Document Number"
    # hidden: yes
    type: string
    sql: ${TABLE}.transaction_number ;;
  }

  dimension: nulls_filter {
    label: "Null Values Filter"
    description: "Channel or Marketplace Segment or Product Category or Product Line is null"
    type: yesno
    sql: ${channel} is null OR ${marketplace_segment} is null OR ${product_line} is null OR ${product_category} is null ;;
  }


#MEASURES
  measure: count {
    hidden: yes
    type: count
    # drill_fields: [marketplace_segment, customer_name]
  }

  measure: total_revenue {
    label: "Total Revenue (Exact)"
    description: "Revenue value including cents"
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
    drill_fields: [transaction_number, customer_name, channel, marketplace_segment, item, product_category, product_line, account_line_name, accounting_period_name]
  }

  measure: rounded_total_revenue {
    label: "Total Revenue (Rounded)"
    description: "Revenue value rounded to the nearest dollar"
    type: sum
    sql: ${TABLE}.amount ;;
    # value_format_name: usd
    value_format: "$#,##0"
    drill_fields: [transaction_number, customer_name, channel, marketplace_segment, item, product_category, product_line, account_line_name, accounting_period_name]
  }
}
