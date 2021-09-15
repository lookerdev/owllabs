view: netsuite_revenue_report {
  sql_table_name: public.netsuite_revenue_report ;;

  dimension: account_id {
    hidden: yes
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bill_country {
    type: string
    sql: ${TABLE}.bill_country ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    hidden: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: deleteddate {
    hidden: yes
    type: string
    sql: ${TABLE}.deleteddate ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_item_name {
    hidden: yes
    type: string
    sql: ${TABLE}.discount_item_name ;;
  }

  dimension: discount_rate {
    hidden: yes
    type: number
    sql: ${TABLE}.discount_rate ;;
  }

  dimension: discount_total {
    hidden: yes
    type: number
    sql: ${TABLE}.discount_total ;;
  }

  dimension: document_number {
    type: string
    sql: ${TABLE}.document_number ;;
  }

  dimension: document_type {
    type: string
    sql: ${TABLE}.document_type ;;
  }

  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.exchange_rate ;;
  }

  dimension: internal_id {
    hidden: yes
    type: string
    sql: ${TABLE}.internal_id ;;
  }

  dimension: item_internal_id {
    hidden: yes
    type: string
    sql: ${TABLE}.item_internal_id ;;
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

  dimension: posting_period {
    type: string
    sql: ${TABLE}.posting_period ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: rate {
    type: string
    sql: ${TABLE}.rate ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: revenue_usd {
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.revenue_usd ;;
  }

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: shipping_address_country_value {
    type: string
    sql: ${TABLE}.shipping_address_country_value ;;
  }

  dimension: shipping_method {
    type: string
    sql: ${TABLE}.shipping_method ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension_group: transaction {
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
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_status {
    type: string
    sql: ${TABLE}.transaction_status ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, discount_item_name]
  }

  measure: total_revenue_usd {
    type: sum
    # value_format: "#,##0.00"
    value_format_name: usd
    sql: ${revenue_usd} ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
  }
}
