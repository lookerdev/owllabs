view: device_view {
  sql_table_name: public.device_view ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    description: ""
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: 6mth_average_local_talk_time_minutes {
    hidden: yes
    type: number
    sql: ${TABLE}."6mth_average_local_talk_time_minutes" ;;
  }

  dimension: 6mth_average_meeting_len_minutes {
    hidden: yes
    type: number
    sql: ${TABLE}."6mth_average_meeting_len_minutes" ;;
  }

  dimension: 6mth_average_person_count {
    hidden: yes
    type: number
    sql: ${TABLE}."6mth_average_person_count" ;;
  }

  dimension: 6mth_average_remote_talk_time_minutes {
    hidden: yes
    type: number
    sql: ${TABLE}."6mth_average_remote_talk_time_minutes" ;;
  }

  dimension: 6mth_count_crash_meetings {
    hidden: yes
    type: number
    sql: ${TABLE}."6mth_count_crash_meetings" ;;
  }

  dimension: 6mth_count_of_meetings {
    hidden: yes
    type: number
    sql: ${TABLE}."6mth_count_of_meetings" ;;
  }

  dimension: 6mth_count_of_paired_meetings {
    hidden: yes
    type: number
    sql: ${TABLE}."6mth_count_of_paired_meetings" ;;
  }

  dimension: 6mth_max_person_count {
    hidden: yes
    type: number
    sql: ${TABLE}."6mth_max_person_count" ;;
  }

  dimension: alias {
    hidden: yes
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: channel_name {
    label: "Channel Name"
    description: ""
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension_group: checkedinat {
    hidden: yes
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
    description: "IP address recorded at device's most recent check-in"
    hidden: yes
    type: string
    sql: ${TABLE}.lastip ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: product_name {
    label: "Product Name"
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: serial {
    type: string
    sql: ${TABLE}.serial ;;
  }

  dimension: software_version {
    label: "Software Version"
    description: "Device's most recent software version"
    type: string
    sql: ${TABLE}.software_version ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: uuid {
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.uuid ;;
  }

  measure: device_count {
    type: count
    drill_fields: [id, name, product_name, channel_name]
  }
}
