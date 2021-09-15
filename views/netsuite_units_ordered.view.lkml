view: netsuite_units_ordered {
  sql_table_name: public.netsuite_units_ordered ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: cogs_per_item {
    type: number
    sql: ${TABLE}.cogs_per_item ;;
  }

  dimension: cogs_total {
    type: number
    sql: ${TABLE}.cogs_total ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

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

  dimension: estgrossprofit {
    type: number
    sql: ${TABLE}.estgrossprofit ;;
  }

  dimension: estgrossprofitpercent {
    type: number
    sql: ${TABLE}.estgrossprofitpercent ;;
  }

  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.exchange_rate ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: internal_id {
    type: number
    sql: ${TABLE}.internal_id ;;
  }

  dimension: item_internal_id {
    type: number
    sql: ${TABLE}.item_internal_id ;;
  }

  dimension: item_price {
    type: number
    sql: ${TABLE}.item_price ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: order_billing_country {
    type: string
    sql: ${TABLE}.order_billing_country ;;
  }

  dimension: order_shipping_cost {
    type: number
    sql: ${TABLE}.order_shipping_cost ;;
  }

  dimension: order_shipping_country {
    type: string
    sql: ${TABLE}.order_shipping_country ;;
  }

  dimension: order_tax_rate {
    type: number
    sql: ${TABLE}.order_tax_rate ;;
  }

  dimension: order_total_tax {
    type: number
    sql: ${TABLE}.order_total_tax ;;
  }

  dimension: quantity_ordered {
    type: number
    sql: ${TABLE}.quantity_ordered ;;
  }

  dimension: quantitybackordered {
    type: number
    sql: ${TABLE}.quantitybackordered ;;
  }

  dimension: quantitybilled {
    type: number
    sql: ${TABLE}.quantitybilled ;;
  }

  dimension: quantitycommitted {
    type: number
    sql: ${TABLE}.quantitycommitted ;;
  }

  dimension: quantityfulfilled {
    type: number
    sql: ${TABLE}.quantityfulfilled ;;
  }

  dimension: quantitypacked {
    type: number
    sql: ${TABLE}.quantitypacked ;;
  }

  dimension: quantitypicked {
    type: number
    sql: ${TABLE}.quantitypicked ;;
  }

  dimension: quantityremaining {
    type: yesno
    sql: ${TABLE}.quantityremaining ;;
  }

  dimension: row_num {
    primary_key: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension_group: sales_order {
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
    sql: ${TABLE}.sales_order_date ;;
  }

  dimension: sales_order_number {
    type: string
    sql: ${TABLE}.sales_order_number ;;
  }

  dimension: shopify_order_num {
    type: string
    sql: ${TABLE}.shopify_order_num ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: taxable {
    type: yesno
    sql: ${TABLE}.taxable ;;
  }

  dimension: taxitem__name {
    type: string
    sql: ${TABLE}.taxitem__name ;;
  }

  dimension: terms {
    type: string
    sql: ${TABLE}.terms ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_ordered {
    # label: "T"
    type: sum_distinct
    sql: ${quantity_ordered} ;;
  }

  measure: order_subtotal {
    # label: ""
    type: sum
    sql: ${amount} ;;
  }
}
