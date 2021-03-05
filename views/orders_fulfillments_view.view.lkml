view: orders_fulfillments_view {
  sql_table_name: public.orders_fulfillments_view ;;

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }


  dimension: primary_key {
    type: number
    sql: ${TABLE}.primary_key ;;
    primary_key: yes
    hidden: yes
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: order_fulfillment_number {
    type: string
    sql: ${TABLE}.order_fulfillment_number ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  measure: sum_of_fulfilled_units {
    type: sum
    sql: ${quantity} ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: tracking_number {
    type: string
    sql: ${TABLE}.tracking_number ;;
  }

  dimension: tracking_url {
    type: string
    sql: ${TABLE}.tracking_url ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: orders_fulfilled {
    type: count
    drill_fields: []
  }
}
