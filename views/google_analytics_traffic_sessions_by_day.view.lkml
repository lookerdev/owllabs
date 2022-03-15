view: google_analytics_traffic_sessions_by_day {
  sql_table_name: public.ganalytics_traffic_sessions_by_day ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  dimension: row_num {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: affiliates_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.affiliates_sessions ;;
  }

  dimension: direct_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.direct_sessions ;;
  }

  dimension: display_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.display_sessions ;;
  }

  dimension: email_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.email_sessions ;;
  }

  dimension: native_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.native_sessions ;;
  }

  dimension: notset_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.notset_sessions ;;
  }

  dimension: organicsearch_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.organicsearch_sessions ;;
  }

  dimension: other_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.other_sessions ;;
  }

  dimension: paidemail_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.paidemail_sessions ;;
  }

  dimension: paidsearch_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.paidsearch_sessions ;;
  }

  dimension: paidsocial_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.paidsocial_sessions ;;
  }

  dimension: referral_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.referral_sessions ;;
  }

  dimension: social_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.social_sessions ;;
  }

  dimension: sponsorship_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.sponsorship_sessions ;;
  }

  dimension: video_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.video_sessions ;;
  }

  dimension: all_sessions {
    hidden: yes
    type: number
    sql: ${affiliates_sessions} + ${direct_sessions} + ${display_sessions} + ${email_sessions} + ${native_sessions} + ${notset_sessions} + ${organicsearch_sessions} + ${other_sessions} + ${paidemail_sessions} + ${paidsearch_sessions} + ${paidsocial_sessions} + ${referral_sessions} + ${social_sessions} + ${sponsorship_sessions} + ${video_sessions} ;;
  }


  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

  measure: sum_all_sessions {
    type: sum
    sql: ${all_sessions} ;;
  }

  # measure: conversion_rate {
  #   type: number
  #   sql: sum( / sum(${all_sessions}) ;;
  # }

}
