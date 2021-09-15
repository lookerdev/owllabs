view: netsuite_units_fulfilled {
  sql_table_name: public.netsuite_units_fulfilled ;;


  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: deleted_date {
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
    sql: ${TABLE}.deleteddate ;;
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
    type: number
    sql: ${TABLE}.internal_id ;;
  }

  dimension: item_fullfillment_number {
    type: string
    sql: ${TABLE}.item_fullfillment_number ;;
  }

  dimension: item_internal_id {
    type: number
    sql: ${TABLE}.item_internal_id ;;
  }

  dimension: quantity_fulfilled {
    type: number
    sql: ${TABLE}.quantity_fulfilled ;;
  }

  dimension: row_num {
    primary_key: yes
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
    type: sum_distinct
    sql: ${quantity_fulfilled} ;;
    }

  # measure: count_fulfillments {
  #   type: count_distinct
  #   sql: ${TABLE}.item_fullfillment_number ;;
  # }

}
