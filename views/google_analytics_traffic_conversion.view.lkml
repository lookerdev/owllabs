view: google_analytics_traffic_conversion {
  derived_table: {
    sql: select
        dc.id,
        dc.date,
        ga.start_date as ga_session_start_date,
        ga.end_date as ga_session_end_date,
        ga.num_affiliates_sessions,
        ga.num_direct_sessions,
        ga.num_display_sessions,
        ga.num_email_sessions,
        ga.num_native_sessions,
        ga.num_notset_sessions,
        ga.num_organicsearch_sessions,
        ga.num_other_sessions,
        ga.num_paidemail_sessions,
        ga.num_paidsearch_sessions,
        ga.num_paidsocial_sessions,
        ga.num_referral_sessions,
        ga.num_social_sessions,
        ga.num_sponsorship_sessions,
        ga.num_video_sessions,
        ga.num_affiliates_sessions + ga.num_direct_sessions + ga.num_display_sessions + ga.num_email_sessions + ga.num_native_sessions + ga.num_notset_sessions + ga.num_organicsearch_sessions + ga.num_other_sessions + ga.num_paidemail_sessions + ga.num_paidsearch_sessions + ga.num_paidsocial_sessions + ga.num_referral_sessions + ga.num_social_sessions + ga.num_sponsorship_sessions + ga.num_video_sessions as all_sessions,
        a.order_date,
        a.count_orders,
        a.total_og_ordered,
        a.total_pro_ordered,
        a.total_hq_ordered,
        a.total_wbo_ordered,
        a.total_mo3_ordered,
        a.total_owls_ordered,
        a.total_hardware_ordered
        from dim_calendar dc
        left join public.ganalytics_traffic_sessions_by_day ga
          on ga.end_date = dc."date"
        left join (select
                  cast(order_date as date) as order_date,
                  count(distinct order_id) as count_orders,
                  sum(pro_quantity_ordered) as total_pro_ordered,
                  sum(og_quantity_ordered) as total_og_ordered,
                  sum(hq_quantity_ordered) as total_hq_ordered,
                  sum(wbo_quantity_ordered) as total_wbo_ordered,
                  sum(mo3_quantity_ordered) AS total_mo3_ordered,
                  sum(pro_quantity_ordered) + sum(og_quantity_ordered) + sum(mo3_quantity_ordered) as total_owls_ordered,
                  sum(pro_quantity_ordered) + sum(og_quantity_ordered) + sum(hq_quantity_ordered) + sum(wbo_quantity_ordered) + sum(mo3_quantity_ordered) as total_hardware_ordered
                  from shopify_orders_line_items_view
                  where distribution_channel <> 'Channel'
                  --and sales_channel is null
                  and {% condition sales_channel_select %} sales_channel {% endcondition %}
                  and (pro_quantity_ordered + og_quantity_ordered + hq_quantity_ordered + wbo_quantity_ordered + mo3_quantity_ordered) > 0 /*at least one of these devices ordered that day*/
                  --and (pro_quantity_ordered > 0 or og_quantity_ordered > 0 or hq_quantity_ordered > 0 or wbo_quantity_ordered > 0)
                  group by cast(order_date as date) ) a
          on a.order_date  = dc."date"
          where dc."date" >= '2016-04-01'
      ;;
  }
  # suggestions: yes
# affiliates_sessions + direct_sessions + display_sessions + email_sessions + native_sessions + notset_sessions + organicsearch_sessions + other_sessions + paidemail_sessions + paidsearch_sessions + paidsocial_sessions + referral_sessions + social_sessions + sponsorship_sessions + video_sessions as total_sessions


  filter: sales_channel_select {
    hidden: yes
    label: "Sales Channel Filter"
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

  # dimension: ga_session_start_date {
  #   hidden: yes
  #   type: date
  #   sql: ${TABLE}.ga_session_start_date ;;
  # }

  # dimension: ga_session_end_date {
  #   hidden: yes
  #   type: date
  #   sql: ${TABLE}.ga_session_end_date ;;
  # }

  dimension: num_affiliates_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_affiliates_sessions ;;
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

  dimension: num_notset_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_notset_sessions ;;
  }

  dimension: num_organicsearch_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_organicsearch_sessions ;;
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

  dimension: num_paidsearch_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_paidsearch_sessions ;;
  }

  dimension: num_paidsocial_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_paidsocial_sessions ;;
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

  dimension: num_video_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.num_video_sessions ;;
  }

  # dimension: order_date {
  #   type: date
  #   sql: ${TABLE}.order_date ;;
  # }

  dimension: count_orders {
    # hidden: yes
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

  # dimension: all_sessions {
  #   hidden: yes
  #   type: number
  #   sql: ${num_affiliates_sessions} + ${num_direct_sessions} + ${num_display_sessions} + ${num_email_sessions} + ${num_native_sessions} + ${num_notset_sessions} + ${num_organicsearch_sessions} + ${num_other_sessions} + ${num_paidemail_sessions} + ${num_paidsearch_sessions} + ${num_paidsocial_sessions} + ${num_referral_sessions} + ${num_social_sessions} + ${num_sponsorship_sessions} + ${num_video_sessions} ;;
  # }

  dimension: all_sessions {
    type: number
    sql: ${TABLE}.all_sessions ;;
  }




## MEASURES
  measure: sum_all_sessions {
    label: "# All Sessions"
    type: sum
    sql: ${all_sessions} ;;
  }

  measure: sum_all_sessions_test {
    hidden: yes
    type: sum
    sql: ${num_affiliates_sessions} + ${num_direct_sessions} + ${num_display_sessions} + ${num_email_sessions} + ${num_native_sessions} + ${num_notset_sessions} + ${num_organicsearch_sessions} + ${num_other_sessions} + ${num_paidemail_sessions} + ${num_paidsearch_sessions} + ${num_paidsocial_sessions} + ${num_referral_sessions} + ${num_social_sessions} + ${num_sponsorship_sessions} + ${num_video_sessions} ;;
  }

  measure: sum_all_sessions_test2 {
    hidden: yes
    type: number
    sql: sum(${num_affiliates_sessions}) + sum(${num_direct_sessions}) + sum(${num_display_sessions}) + sum(${num_email_sessions}) + sum(${num_native_sessions}) + sum(${num_notset_sessions}) + sum(${num_organicsearch_sessions}) + sum(${num_other_sessions}) + sum(${num_paidemail_sessions}) + sum(${num_paidsearch_sessions}) + sum(${num_paidsocial_sessions}) + sum(${num_referral_sessions}) + sum(${num_social_sessions}) + sum(${num_sponsorship_sessions}) + sum(${num_video_sessions}) ;;
  }

  measure: sum_num_affiliates_sessions {
    label: "# Affiliates Sessions"
    type: sum
    sql: ${num_affiliates_sessions} ;;
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

  measure: sum_num_notset_sessions {
    label: "# Not Set Sessions"
    type: sum
    sql: ${num_notset_sessions} ;;
  }

  measure: sum_num_organicsearch_sessions {
    label: "# Organic Search Sessions"
    type: sum
    sql: ${num_organicsearch_sessions} ;;
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

  measure: sum_num_paidsearch_sessions {
    label: "# Paid Search Sessions"
    type: sum
    sql: ${num_paidsearch_sessions} ;;
  }

  measure: sum_num_paidsocial_sessions {
    label: "# Paid Social Sessions"
    type: sum
    sql: ${num_paidsocial_sessions} ;;
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
    sql: sum(${count_orders}) / sum(${all_sessions}) ;;
  }

}
