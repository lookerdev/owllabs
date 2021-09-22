view: revenue_by_item_looker {
  sql_table_name: public.revenue_by_item_looker ;;

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: accounting_period_name {
    type: string
    sql: ${TABLE}.accounting_period_name ;;
  }

  dimension: amount {
    hidden: yes
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: customer_country {
    hidden: yes
    type: string
    sql: ${TABLE}.customer_country ;;
  }

  dimension: date {
    hidden: yes
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: entity_billing_address_country {
    hidden: yes
    type: string
    sql: ${TABLE}.entity_billing_address_country ;;
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

  dimension: marketplace_segment_name {
    type: string
    sql: ${TABLE}.marketplace_segment_name ;;
  }

  dimension: memo {
    hidden: yes
    type: string
    sql: ${TABLE}.memo ;;
  }

  dimension: memo_1 {
    hidden: yes
    type: string
    sql: ${TABLE}.memo_1 ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.primary_key ;;
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

  dimension: transaction_number_2 {
    hidden: yes
    type: string
    sql: ${TABLE}.transaction_number_2 ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, marketplace_segment_name, entity_name]
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }
}
