view: revenue_by_item_aggregated {
# includes revenue for all accounts
  derived_table: {
    sql: SELECT
          accounting_period_name,
          channel,
          marketplace_segment,
          product_category,
          product_line,
          SUM(amount) AS aggregated_revenue
         FROM revenue_by_item_looker
         GROUP BY
          product_line,
          product_category,
          channel,
          marketplace_segment,
          accounting_period_name;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden:  yes
    type: string
    sql: ${TABLE}.accounting_period_name || ${TABLE}.channel || ${TABLE}.marketplace_segment || ${TABLE}.product_category || ${TABLE}.product_line;;
  }

  dimension: accounting_period_name {
    type: string
    sql: ${TABLE}.accounting_period_name ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
  }

  measure: aggregated_revenue {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.aggregated_revenue ;;
  }

  measure: asp {
    label: "ASP"
    description: "Average Selling Price"
    type: number
    # value_format_name: usd
    value_format: "$#,##0" #rounded to the nearest dollar
    sql: ${aggregated_revenue} / nullif(${item_fulfillments_aggregated.aggregated_quantity},0) ;;
  }

}
