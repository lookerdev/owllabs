view: device_updates_downloads {
  label: "Device Update Downloads"
  sql_table_name: owlbarn_views.deviceupdatesdownloads_v ;;
  drill_fields: [id]


# DIMENSIONS

  dimension: id {
    primary_key: yes
    # hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: createdat {
    label: "Update Attempt"
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: deviceuuid {
    # hidden: yes
    label: "DeviceUUID"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: software_release_version {
    label: "Software Version"
    # hidden: yes
    type: string
    sql: ${TABLE}.software_release_version ;;
  }

  dimension: software_release_version_number {
    label: "Software Version (integer)"
    # hidden: yes
    type: number
    sql: ${TABLE}.software_release_version_number ;;
  }

  dimension_group: updatedat {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updatedat ;;
  }

# MEASURES

  measure: count {
    label: "Count of Update Attempts"
    # hidden: yes
    type: count
    drill_fields: [id, createdat_date]
  }

  measure: count_devices {
    label: "Count of Devices"
    type: count_distinct
    sql: ${deviceuuid} ;;
  }

  measure: most_recent_attempt {
    label: "Most Recent Update Attempt Date"
    type: date
    sql: max(${createdat_date}) ;;
  }

}
