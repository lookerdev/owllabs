view: device_meetingdates_v {
  label: "Meetings Summary"
  sql_table_name: owlbarn_views.device_meetingdates_v ;;

  dimension: deviceuuid {
    label: "DeviceUUID"
    primary_key: yes
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: 1st_mtg {
    type: date
    sql: ${TABLE}."1st_mtg" ;;
  }

  # dimension_group: 1st_mtg {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}."1st_mtg" ;;
  # }

  dimension: 2nd_mtg {
    label: "2nd Meeting Date"
    type: date
    sql: ${TABLE}."2nd_mtg" ;;
  }

  # dimension_group: 2nd_mtg {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}."2nd_mtg" ;;
  # }

  # dimension_group: 10th_mtg {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}."10th_mtg" ;;
  # }

  dimension: 10th_mtg {
    type: date
    sql: ${TABLE}."10th_mtg" ;;
  }

  # dimension_group: 20th_mtg {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}."20th_mtg" ;;
  # }

  dimension: 20th_mtg {
    type: date
    sql: ${TABLE}."20th_mtg" ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }

  # https://community.looker.com/lookml-5/creating-a-type-count-measure-for-non-primary-keys-1163
  measure: count_1st_mtg {
    type: count
    filters: [1st_mtg: "-NULL"]
  }

  measure: count_2nd_mtg {
    type: count
    filters: [2nd_mtg: "-NULL"]
  }

  measure: count_10th_mtg {
    type: count
    filters: [10th_mtg: "-NULL"]
  }

  measure: count_20th_mtg {
    type: count
    filters: [20th_mtg: "-NULL"]
}
}
