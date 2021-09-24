view: revenue_by_item_looker {
  sql_table_name: public.revenue_by_item_looker_primkey ;;
  drill_fields: [account_line_name, channel, entity_name, transaction_number, marketplace_segment,item]


# dimensions
  dimension: account_id {
    label: "Account internal id"
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
    drill_fields: [entity_name]
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

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    drill_fields: [account_line_name, channel, entity_name, transaction_number, marketplace_segment, item, product_line]
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
    drill_fields: [account_line_name, channel, entity_name, transaction_number, marketplace_segment, item]
  }

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: source_rev_rec_document_number {
    label: "Source Document Number"
    hidden: yes
    type: string
    sql: ${TABLE}.source_rev_rec_document_number ;;
  }

  dimension: source_rev_rec_document_type {
    label: "Document Type"
    type: string
    sql: ${TABLE}.source_rev_rec_document_type ;;
  }

  dimension: transaction_number {
    label: "Document Number"
    # hidden: yes
    type: string
    sql: ${TABLE}.transaction_number ;;
  }


  measure: count {
    type: count
    # drill_fields: [marketplace_segment, entity_name]
  }

  measure: total_revenue {
    label: "Revenue"
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
    drill_fields: [account_line_name, channel, entity_name, transaction_number, marketplace_segment, item]
  }
}
