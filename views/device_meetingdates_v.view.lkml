view: device_meetingdates_v {
  label: "Meetings Summary"
  sql_table_name: owlbarn_views.device_meetingdates_v ;;

  dimension: deviceuuid {
    primary_key: yes
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  # dimension: 1st_mtg {
  #   type: date
  #   sql: ${TABLE}."1st_mtg" ;;
  # }

  dimension_group: 1st_mtg {
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
    sql: ${TABLE}."1st_mtg" ;;
  }

  # dimension: 2nd_mtg {
  #   type: date
  #   sql: ${TABLE}."2nd_mtg" ;;
  # }

  dimension_group: 2nd_mtg {
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
    sql: ${TABLE}."2nd_mtg" ;;
  }

  dimension_group: 10th_mtg {
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
    sql: ${TABLE}."10th_mtg" ;;
  }

  dimension_group: 20th_mtg {
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
    sql: ${TABLE}."20th_mtg" ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }

  measure: count_1st_mtg {
    type: count_distinct
    sql: ${1st_mtg_raw} ;;
  }

  measure: count_2nd_mtg {
    type: count_distinct
    sql: ${2nd_mtg_raw} ;;
  }

  measure: count_10th_mtg {
    type: count_distinct
    sql: ${10th_mtg_raw} ;;
  }

  measure: count_20th_mtg {
    type: count_distinct
    sql: ${20th_mtg_raw} ;;
  }

}
