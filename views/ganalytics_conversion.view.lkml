view: ganalytics_conversion {
  derived_table: {
    sql: select
        dc.id,
        dc.date,
        ga.num_affiliates_sessions,
        ga.num_crossnetwork_sessions,
        ga.num_direct_sessions,
        ga.num_display_sessions,
        ga.num_email_sessions,
        ga.num_native_sessions,
        ga.num_organicsearch_sessions,
        ga.num_organicshopping_sessions,
        ga.num_organicsocial_sessions,
        ga.num_organicvideo_sessions,
        ga.num_other_sessions,
        ga.num_paidemail_sessions,
        ga.num_paidother_sessions,
        ga.num_paidsearch_sessions,
        ga.num_paidshopping_sessions,
        ga.num_paidsocial_sessions,
        ga.num_paidvideo_sessions,
        ga.num_referral_sessions,
        ga.num_social_sessions,
        ga.num_sponsorship_sessions,
        ga.num_unassigned_sessions,
        ga.num_video_sessions,
        ga.total_sessions,
        a.count_orders,
        a.total_og_ordered,
        a.total_pro_ordered,
        a.total_hq_ordered,
        a.total_wbo_ordered,
        a.total_mo3_ordered,
        a.total_owlbar_ordered,
        a.total_owls_ordered,
        a.total_hardware_ordered
        from dim_calendar dc
        left join public.ganalytics_daily_sessions ga
          on dc."date" = ga.date_utc
        left join (select
                  cast(order_date as date) as order_date,
                  count(distinct order_id) as count_orders,
                  sum(pro_quantity_ordered) as total_pro_ordered,
                  sum(og_quantity_ordered) as total_og_ordered,
                  sum(hq_quantity_ordered) as total_hq_ordered,
                  sum(wbo_quantity_ordered) as total_wbo_ordered,
                  sum(mo3_quantity_ordered) AS total_mo3_ordered,
                  sum(owlbar_quantity_ordered) AS total_owlbar_ordered,
                  sum(pro_quantity_ordered) + sum(og_quantity_ordered) + sum(mo3_quantity_ordered) as total_owls_ordered,
                  sum(pro_quantity_ordered) + sum(og_quantity_ordered) + sum(hq_quantity_ordered) + sum(wbo_quantity_ordered) + sum(mo3_quantity_ordered) + sum(owlbar_quantity_ordered) as total_hardware_ordered
                  from shopify_orders_line_items_view
                  where 1=1
                  and (distribution_channel <> 'Channel' OR distribution_channel IS NULL)
                  and revenue_item = True
                  and {% condition sales_channel_select %} sales_channel {% endcondition %}
                  and (pro_quantity_ordered + og_quantity_ordered + hq_quantity_ordered + wbo_quantity_ordered + mo3_quantity_ordered + owlbar_quantity_ordered) > 0 /*at least one of these devices ordered that day*/
                  group by cast(order_date as date) ) a
          on dc."date" = a.order_date
          where dc."date" >= '2016-04-01'
      ;;
  }


  filter: sales_channel_select {
    label: "Sales Channel Filter"
    description: "Use this filter to select the orders from which sales channel(s) to view against Website traffic in the Conversion Rate calculation."
    type:  string
    suggestions: ["InsideSales","Retail","VAR","Website"]
  }


## DIMENSIONS

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date {
    hidden: yes
    label: "Calendar"
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
    sql: ${TABLE}.date::timestamp ;;
  }

  dimension: num_affiliates_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_affiliates_sessions ;;
  }

  dimension: num_crossnetwork_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_crossnetwork_sessions ;;
  }

  dimension: num_direct_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_direct_sessions ;;
  }

  dimension: num_display_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_display_sessions ;;
  }

  dimension: num_email_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_email_sessions ;;
  }

  dimension: num_native_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_native_sessions ;;
  }

  dimension: num_organicsearch_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_organicsearch_sessions ;;
  }

  dimension: num_organicshopping_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_organicshopping_sessions ;;
  }

  dimension: num_organicsocial_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_organicsocial_sessions ;;
  }

  dimension: num_organicvideo_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_organicvideo_sessions ;;
  }

  dimension: num_other_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_other_sessions ;;
  }

  dimension: num_paidemail_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_paidemail_sessions ;;
  }

  dimension: num_paidother_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_paidother_sessions ;;
  }

  dimension: num_paidsearch_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_paidsearch_sessions ;;
  }

  dimension: num_paidshopping_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_paidshopping_sessions ;;
  }

  dimension: num_paidsocial_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_paidsocial_sessions ;;
  }

  dimension: num_paidvideo_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_paidvideo_sessions ;;
  }

  dimension: num_referral_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_referral_sessions ;;
  }

  dimension: num_social_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_social_sessions ;;
  }

  dimension: num_sponsorship_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_sponsorship_sessions ;;
  }

  dimension: num_unassigned_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_unassigned_sessions ;;
  }

  dimension: num_video_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_video_sessions ;;
  }

  dimension: total_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: count_orders {
    type: number
    sql: ${TABLE}.count_orders ;;
  }

  dimension: total_pro_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.total_pro_ordered ;;
  }

  dimension: total_og_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.total_og_ordered ;;
  }

 dimension: total_owlbar_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.total_owlbar_ordered ;;
  }

  dimension: total_hq_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.total_hq_ordered ;;
  }

  dimension: total_wbo_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.total_wbo_ordered ;;
  }

  dimension: total_owls_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.total_owls_ordered ;;
  }

  dimension: total_hardware_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.total_hardware_ordered ;;
  }



## MEASURES
  measure: sum_all_sessions {
    label: "Total Sessions"
    type: sum
    sql: ${total_sessions} ;;
  }

  measure: sum_num_affiliates_sessions {
    label: "# Affiliates Sessions"
    type: sum
    sql: ${num_affiliates_sessions} ;;
  }

  measure: sum_num_crossnetwork_sessions {
    label: "# Cross-Network Sessions"
    type: sum
    sql: ${num_crossnetwork_sessions} ;;
  }

  measure: sum_num_direct_sessions {
    label: "# Direct Sessions"
    type: sum
    sql: ${num_direct_sessions} ;;
  }

  measure: sum_num_display_sessions {
    label: "# Display Sessions"
    type: sum
    sql: ${num_display_sessions} ;;
  }

  measure: sum_num_email_sessions {
    label: "# Email Sessions"
    type: sum
    sql: ${num_email_sessions} ;;
  }

  measure: sum_num_native_sessions {
    label: "# Native Sessions"
    type: sum
    sql: ${num_native_sessions} ;;
  }

  measure: sum_num_organicsearch_sessions {
    label: "# Organic Search Sessions"
    type: sum
    sql: ${num_organicsearch_sessions} ;;
  }

  measure: sum_num_organicshopping_sessions {
    label: "# Organic Shopping Sessions"
    type: sum
    sql: ${num_organicshopping_sessions} ;;
  }

  measure: sum_num_organicsocial_sessions {
    label: "# Organic Social Sessions"
    type: sum
    sql: ${num_organicsocial_sessions} ;;
  }

  measure: sum_num_organicvideo_sessions {
    label: "# Organic Video Sessions"
    type: sum
    sql: ${num_organicvideo_sessions} ;;
  }

  measure: sum_num_other_sessions {
    label: "# Other Sessions"
    type: sum
    sql: ${TABLE}.num_other_sessions ;;
  }

  measure: sum_num_paidemail_sessions {
    label: "# Paid Email Sessions"
    type: sum
    sql: ${num_other_sessions} ;;
  }

  measure: sum_num_paidother_sessions {
    label: "# Paid Other Sessions"
    type: sum
    sql: ${num_paidother_sessions} ;;
  }

  measure: sum_num_paidsearch_sessions {
    label: "# Paid Search Sessions"
    type: sum
    sql: ${num_paidsearch_sessions} ;;
  }

  measure: sum_num_paidshopping_sessions {
    label: "# Paid Shopping Sessions"
    type: sum
    sql: ${num_paidshopping_sessions} ;;
  }

  measure: sum_num_paidsocial_sessions {
    label: "# Paid Social Sessions"
    type: sum
    sql: ${num_paidsocial_sessions} ;;
  }

  measure: sum_num_paidvideo_sessions {
    label: "# Paid Video Sessions"
    type: sum
    sql: ${num_paidvideo_sessions} ;;
  }

  measure: sum_num_referral_sessions {
    label: "# Referral Sessions"
    type: sum
    sql: ${num_referral_sessions} ;;
  }

  measure: sum_num_social_sessions {
    label: "# Social Sessions"
    type: sum
    sql: ${num_social_sessions} ;;
  }

  measure: sum_num_sponsorship_sessions {
    label: "# Sponsorship Sessions"
    type: sum
    sql: ${num_sponsorship_sessions} ;;
  }

  measure: sum_num_unassigned_sessions {
    label: "# Unassigned Sessions"
    type: sum
    sql: ${num_unassigned_sessions} ;;
  }

  measure: sum_num_video_sessions {
    label: "# Video Sessions"
    type: sum
    sql: ${num_video_sessions} ;;
  }

  measure: sum_count_orders {
    label: "# Orders"
    type: sum
    sql: ${count_orders} ;;
  }

  measure: conversion_rate {
    type: number
    value_format: "0.00%"
    sql: sum(${count_orders}) * 1.0 / sum(${total_sessions}) ;;
  }

}
