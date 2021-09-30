view: item_fulfillments_looker {
  sql_table_name: public.item_fulfillments_looker_primkey ;;


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
    sql: ${TABLE}.actual_ship_date ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    drill_fields: [customer_name, marketplace_segment, product_category]
  }

  dimension: cogs_account {
    type: string
    sql: ${TABLE}.cogs_account ;;
  }

  dimension: cogs_amount {
    type: number
    sql: ${TABLE}.cogs_amount ;;
  }

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
    sql: ${TABLE}.date ;;
  }

  dimension_group: date_created {
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
    sql: ${TABLE}.date_created ;;
  }

  dimension: document_number {
    type: string
    sql: ${TABLE}.document_number ;;
  }

  dimension: fulfillment_type {
    case: {
      when: {
        sql: ${TABLE}.item in ('ACC100-1000','ACC100-2000','ACC100-2001','PTW100-1000','PTW100-2000','MTW100-1000','MTW100-2000','MTW200-1000','MTW200-2000','MTW200-3000','MTW200-4000','PPK100-0000','PPK100-2000','PPK200-0000','PPK200-0000-UPDATE','PPK200-2000','PPK200-2000-UPDATE','PPKU200-1000','REF100-1000','REF200-1000','REF200-2000','WBC100-1000','WBC100-2000') ;;
        label: "Revenue Units"
      }
      when: {
        sql: ${TABLE}.item in ('REPLC - NA','REPLC100-1000','REPLC100-2000','REPLC100-2001','REPPS - Universal','REPUSB - Universal','PTW100-1000-RPL','PTW100-2000-RPL','MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-2000-RPL','WBC100-1000-RPL','WBC100-2000-RPL') ;;
        label: "Other Units"
      }
      else: "N/A"
    }
    # can_filter:
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

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    drill_fields: [channel, customer_name, marketplace_segment, item, product_line]
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
    drill_fields: [channel, customer_name, marketplace_segment, item]
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
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
    sql: ${TABLE}.sales_effective_date ;;
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

  measure: count {
    hidden: yes
    type: count
    drill_fields: [customer_name]
  }

  measure: total_quantity{
    type: sum
    sql: ${TABLE}.quantity  ;;
  }

  measure: total_cogs{
    type: sum
    sql: ${TABLE}.cogs_amount  ;;
    value_format_name: usd
  }
}
