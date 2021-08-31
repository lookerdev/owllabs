view: device_view {
  label: "Devices View"
  sql_table_name: public.device_view ;;
  drill_fields: [id]

# Dimensions
  dimension: id {
    primary_key: yes
    label: "Device Record ID"
    description: "Unique identifier for each device record"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: 6mth_average_local_talk_time_minutes {
    hidden: yes
    label: "6 Month Avg. Local Talk Minutes"
    description: "Average number of minutes that meeting attendee(s) using the device spoke per meeting over the last 6 months"
    type: number
    sql: ${TABLE}."6mth_average_local_talk_time_minutes" ;;
  }

  dimension: 6mth_average_meeting_len_minutes {
    hidden: yes
    label: "6 Month Avg. Meeting Minutes"
    description: "Average meeting length in minutes for device over the last 6 months"
    type: number
    sql: ${TABLE}."6mth_average_meeting_len_minutes" ;;
  }

  dimension: 6mth_average_person_count {
    hidden: yes
    label: "6 Month Avg. Person Count"
    description: "Average number of people device counted per meeting over the last 6 months"
    type: number
    sql: ${TABLE}."6mth_average_person_count" ;;
  }

  dimension: 6mth_average_remote_talk_time_minutes {
    hidden: yes
    label: "6 Month Avg. Remote Talk Minutes"
    description: "Average number of minutes meeting that attendee(s) not using the device spoke per meeting over the last 6 months"
    type: number
    sql: ${TABLE}."6mth_average_remote_talk_time_minutes" ;;
  }

  dimension: 6mth_count_crash_meetings {
    hidden: yes
    label: "6 Month Count Crash Meetings"
    description: "Number of meetings device has crashed during over the last 6 months"
    type: number
    sql: ${TABLE}."6mth_count_crash_meetings" ;;
  }

  dimension: 6mth_count_of_meetings {
    hidden: yes
    label: "6 Month Count of Meetings"
    description: "Total number of meetings device has participated in over the last 6 months"
    type: number
    sql: ${TABLE}."6mth_count_of_meetings" ;;
  }

  dimension: 6mth_count_of_paired_meetings {
    hidden: yes
    label: "6 Month Count of Paired Meetings"
    description: "Number of meetings device has been paired to another device over the last 6 months"
    type: number
    sql: ${TABLE}."6mth_count_of_paired_meetings" ;;
  }

  dimension: 6mth_max_person_count {
    hidden: yes
    label: "6 Month Maximum Person Count"
    description: "Greatest number of people counted by device in a single meeting over the last 6 months"
    type: number
    sql: ${TABLE}."6mth_max_person_count" ;;
  }

  dimension: alias {
    hidden: yes
    label: "Alias"
    description: "Customer's chosen nickname for device"
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: channel_name {
    label: "Channel Name"
    description: "Name of Barn channel device belongs to"
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension_group: checkedinat {
    label: "Most Recent Device Check-In"
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
    sql: ${TABLE}.checkedinat ;;
  }

  dimension_group: createdat {
    hidden: yes
    description: "Device record creation date"
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

  dimension: lastip {
    label: "Last IP Address"
    description: "Device's most recent IP address, captured during most recent check-in"
    hidden: yes
    type: string
    sql: ${TABLE}.lastip ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: product_name {
    label: "Product"
    description: "Device product type"
    type: string
    sql: ${TABLE}.product_name;;
  }

  dimension: serial {
    label: "Software Serial Number"
    type: string
    sql: ${TABLE}.serial ;;
  }

  dimension: software_version {
    label: "Device Current Software Version"
    description: "Device's most recent software version, captured during most recent check-in"
    type: string
    sql: ${TABLE}.software_version ;;
  }

  dimension: status {
    label: "Status"
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: uuid {
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.uuid ;;
  }

# Measures
  measure: device_count {
    type: count
    drill_fields: [id, name, product_name, channel_name]
  }
}
