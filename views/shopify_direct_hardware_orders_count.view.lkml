view: shopify_direct_hardware_orders_count {
  derived_table: {
    sql: select
        ROW_NUMBER() OVER () as row_num,
        cast(order_date as date) as order_date,
        count(distinct order_id) as count_orders,
        sum(pro_quantity_ordered) as total_pro_ordered,
        sum(og_quantity_ordered) as total_og_ordered,
        sum(hq_quantity_ordered) as total_hq_ordered,
        sum(wbo_quantity_ordered) as total_wbo_ordered,
        sum(pro_quantity_ordered) + sum(og_quantity_ordered) as total_owls_ordered,
        sum(pro_quantity_ordered) + sum(og_quantity_ordered) + sum(hq_quantity_ordered) + sum(wbo_quantity_ordered) as total_hardware_ordered
        from shopify_orders_view sov
        where distribution_channel <> 'Channel'
        and (pro_quantity_ordered + og_quantity_ordered + hq_quantity_ordered + wbo_quantity_ordered) > 0 /*at least one of these devices ordered that day*/
        --and (pro_quantity_ordered > 0 or og_quantity_ordered > 0 or hq_quantity_ordered > 0 or wbo_quantity_ordered > 0)
        group by cast(order_date as date)
      ;;
  }


## DIMENSIONS

  dimension: row_num {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension_group: order {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql: ${TABLE}.order_date ;;
  }

  dimension: count_orders {
    label: "Count of Hardware Orders"
    description: "Number of orders placed for Owls, HQs, or WBOs"
    type: number
    sql: ${TABLE}.count_orders ;;
  }

  dimension: total_pro_ordered {
    label: "Total Meeting Owl Pros Ordered"
    description: "Total number of MOPs ordered"
    type: number
    sql: ${TABLE}.total_pro_ordered ;;
  }

  dimension: total_og_ordered {
    label: "Total Meeting Owl Ordered"
    description: "Total number of OGs ordered"
    type: number
    sql: ${TABLE}.total_og_ordered ;;
  }

  dimension: total_hq_ordered {
    label: "Total HQs Ordered"
    description: "Total number of HQs ordered"
    type: number
    sql: ${TABLE}.total_hq_ordered ;;
  }

  dimension: total_wbo_ordered {
    label: "Total WBOs Ordered"
    description: "Total number of WBOs ordered"
    type: number
    sql: ${TABLE}.total_wbo_ordered ;;
  }

  dimension: total_owls_ordered {
    label: "Total Owls Ordered"
    description: "Total MOPs and MOs ordered"
    type: number
    sql: ${TABLE}.total_owls_ordered ;;
  }

  dimension: total_hardware_ordered {
    label: "Total Hardware Ordered"
    description: "Total Owls, HQs, and WBOs ordered"
    type: number
    sql: ${TABLE}.total_hardware_ordered ;;
  }


  measure: sum_hardware_ordered {
    # description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${total_hardware_ordered} ;;
  }

  measure: conversion_rate {
    type: number
    sql: sum(${count_orders}) / sum(${google_analytics_traffic_sessions_by_day.all_sessions} ;;
  }
}
