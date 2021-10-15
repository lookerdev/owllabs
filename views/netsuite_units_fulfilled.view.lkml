view: netsuite_units_fulfilled {
  sql_table_name: public.netsuite_units_fulfilled ;;


  dimension: created_from_internal_id {
    hidden: yes
    type: number
    sql: ${TABLE}.created_from_internal_id ;;
  }

  dimension: created_from_sales_order {
    type: string
    sql: ${TABLE}.created_from_sales_order ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: deleted_date {
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
    sql: ${TABLE}.deleteddate ;;
  }

  dimension: document_number {
    type: string
    sql: ${TABLE}.document_number ;;
  }

  dimension_group: fullfillment {
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
    sql: ${TABLE}.fullfillment_date ;;
  }

 dimension: internal_id {
    hidden: yes
    type: number
    sql: ${TABLE}.internal_id ;;
  }

  dimension: item_internal_id {
    hidden: yes
    type: number
    sql: ${TABLE}.item_internal_id ;;
  }

  dimension: fulfillment_posting_period {
    type: string
    sql: ${TABLE}.posting_period ;;
  }

  dimension: quantity_fulfilled {
    type: number
    sql: ${TABLE}.quantity_fulfilled ;;
  }

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: sales_order {
    type: string
    sql: ${TABLE}.sales_order ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_fulfilled {
    type: sum
    sql_distinct_key: ${row_num} ;;
    sql: ${TABLE}.quantity_fulfilled  ;;
    }

  # measure: count_fulfillments {
  #   type: count_distinct
  #   sql: ${TABLE}.item_fullfillment_number ;;
  # }

}
