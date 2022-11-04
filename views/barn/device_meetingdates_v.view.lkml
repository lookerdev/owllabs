view: device_meetingdates_v {
  label: "Usage Summary"
  # label: "Usage Snapshot"
  sql_table_name: owlbarn_views.device_meetingdates_v ;;

  dimension: deviceuuid {
    label: "DeviceUUID"
    primary_key: yes
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: 1st_mtg {
    label: "1st Meeting Date"
    description: "Date of DeviceUUID's first meeting record, if applicable"
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
    description: "Date of DeviceUUID's second meeting record, if applicable"
    type: date
    sql: ${TABLE}."2nd_mtg" ;;
  }

  dimension: 10th_mtg {
    label: "10th Meeting Date"
    description: "Date of DeviceUUID's tenth meeting record, if applicable"
    type: date
    sql: ${TABLE}."10th_mtg" ;;
  }

  dimension: 20th_mtg {
    label: "20th Meeting Date"
    description: "Date of DeviceUUID's twentieth meeting record, if applicable"
    type: date
    sql: ${TABLE}."20th_mtg" ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }

  # https://community.looker.com/lookml-5/creating-a-type-count-measure-for-non-primary-keys-1163
  measure: count_1st_mtg {
    label: "Count of Devices with 1st Meeting"
    description: "Total number of DeviceUUIDs that have a first meeting record"
    type: count
    filters: [1st_mtg: "-NULL"]
  }

  measure: count_2nd_mtg {
    label: "Count of Devices with 2nd Meeting"
    description: "Total number of DeviceUUIDs that have a second meeting record"
    type: count
    filters: [2nd_mtg: "-NULL"]
  }

  measure: count_10th_mtg {
    label: "Count of Devices with 10th Meeting"
    description: "Total number of DeviceUUIDs that have a tenth meeting record"
    type: count
    filters: [10th_mtg: "-NULL"]
  }

  measure: count_20th_mtg {
    label: "Count of Devices with 20th Meeting"
    description: "Total number of DeviceUUIDs that have a twentieth meeting record"
    type: count
    filters: [20th_mtg: "-NULL"]
}
}
