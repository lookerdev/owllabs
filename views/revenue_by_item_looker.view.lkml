view: revenue_by_item_looker {
  sql_table_name: public.revenue_by_item_looker ;;
  drill_fields: [account_line_name, channel, entity_name, transaction_number, marketplace_segment,item]


# dimensions
  dimension: account_id {
    hidden: yes
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_line_name {
    label: "Account Name"
    type: string
    sql: ${TABLE}.account_line_name ;;
  }

  dimension: account_line_name_glstyle {
    type: string
    sql: ${TABLE}.account_line_name_glstyle ;;
  }

  dimension: account_line_number {
    type: string
    sql: ${TABLE}.account_line_number ;;
  }

  dimension: accounting_period_name {
    type: string
    sql: ${TABLE}.accounting_period_name ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  # dimension: customer_country {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.customer_country ;;
  # }

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
    sql: ${TABLE}.date ;;
  }

  dimension: entity_billing_address_country {
    hidden: yes
    type: string
    sql: ${TABLE}.entity_billing_address_country ;;
  }

  dimension: entity_internal_id {
    hidden: yes
    type: string
    sql: ${TABLE}.entity_internal_id ;;
  }

  dimension: entity_name {
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
  }

  dimension: memo {
    hidden: yes
    type: string
    sql: ${TABLE}.memo ;;
  }

  # dimension: memo_1 {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.memo_1 ;;
  # }

  # dimension: old_account_name {
  #   type: string
  #   sql: ${TABLE}.old_account_name ;;
  # }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.uuid, ${TABLE}.primary_key, ${TABLE}.entity_internal_id, ${TABLE}.amount) ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
  }

  dimension: source_rev_rec_document_number {
    type: string
    sql: ${TABLE}.source_rev_rec_document_number ;;
  }

  dimension: source_rev_rec_document_type {
    type: string
    sql: ${TABLE}.source_rev_rec_document_type ;;
  }

  dimension: transaction_number {
    # hidden: yes
    type: string
    sql: ${TABLE}.transaction_number ;;
  }

  dimension: uuid {
    hidden: yes
    type: string
    sql: ${TABLE}.uuid ;;
  }

  measure: count {
    type: count
    # drill_fields: [marketplace_segment, entity_name]
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }
}
