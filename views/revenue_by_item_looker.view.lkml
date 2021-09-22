view: revenue_by_item_looker {
  sql_table_name: public.revenue_by_item_looker ;;

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: coalesce {
    type: string
    sql: ${TABLE}.coalesce ;;
  }

  dimension: customer_country {
    type: string
    sql: ${TABLE}.customer_country ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: entity_billing_address_country {
    type: string
    sql: ${TABLE}.entity_billing_address_country ;;
  }

  dimension: entity_name {
    type: string
    sql: ${TABLE}.entity_name ;;
  }

  dimension: item {
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
    type: string
    sql: ${TABLE}.memo ;;
  }

  dimension: memo_1 {
    type: string
    sql: ${TABLE}.memo_1 ;;
  }

  dimension: primary_key {
    primary_key: yes
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
    type: string
    sql: ${TABLE}.transaction_number_2 ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, marketplace_segment_name, entity_name]
  }
}
