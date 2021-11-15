view: device_view {
  label: "Devices"
  sql_table_name: public.device_view ;;
  drill_fields: [device_id]

# Dimensions

  dimension: alias {
    hidden: yes
    label: "Alias"
    description: "Customer's chosen nickname for device"
    type: string
    sql: ${TABLE}.device_alias ;;
  }

  dimension: channel_id {
    hidden: yes
    type: number
    sql: ${TABLE}.channel_id ;;
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
    sql: ${TABLE}.device_last_checkin ;;
  }

  dimension_group: createdat {
    hidden: yes
    description: "Device Record Creation"
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
    sql: ${TABLE}.device_record_create_date ;;
  }

  dimension_group: device_activation_date {
    description: "Device Activation"
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
    sql: ${TABLE}.device_activation_date ;;
  }

  dimension: device_hardware_serial_number {
    type: string
    sql: ${TABLE}.device_hardware_serial_number ;;
  }

  dimension: device_hardware_version {
    type: string
    sql: ${TABLE}.device_hardware_version ;;
  }

  dimension: device_id {
    primary_key: yes
    hidden: yes
    label: "Device Record ID"
    description: "Unique identifier for each device record"
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_name {
    hidden: yes
    type: string
    sql: ${TABLE}.device_name ;;
  }

  dimension: lastip {
    label: "Last IP Address"
    description: "Device's most recent IP address, captured during most recent check-in"
    hidden: yes
    type: string
    sql: ${TABLE}.device_last_ip_address ;;
  }

  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    label: "Product Name"
    description: "Device product type"
    type: string
    sql: ${TABLE}.product_name;;
  }

  dimension: serial {
    label: "Software Serial Number"
    type: string
    sql: ${TABLE}.device_serial_number ;;
  }

  dimension: software_version {
    label: "Device Current Software Version"
    description: "Device's most recent software version, captured during most recent check-in"
    type: string
    sql: ${TABLE}.device_software_version ;;
  }

  dimension: status {
    label: "Device Status"
    description: "Status Values: 0 - New, 1 - Active, 2 - Requires Update, 3 - Updating, 4 - Inactive, 5 - Downloading Update, 6 - Offline, 7 - Archived"
    type: number
    sql: ${TABLE}.device_status ;;
  }

  dimension: uuid {
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

# Measures
  measure: device_count {
    type: count
    drill_fields: [device_id, device_name, product_name, channel_name]
  }

  # dimension: 6mth_average_local_talk_time_minutes {
  #   hidden: yes
  #   label: "6 Month Avg. Local Talk Minutes"
  #   description: "Average number of minutes that meeting attendee(s) using the device spoke per meeting over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_average_local_talk_time_minutes" ;;
  # }

  # dimension: 6mth_average_meeting_len_minutes {
  #   hidden: yes
  #   label: "6 Month Avg. Meeting Minutes"
  #   description: "Average meeting length in minutes for device over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_average_meeting_len_minutes" ;;
  # }

  # dimension: 6mth_average_person_count {
  #   hidden: yes
  #   label: "6 Month Avg. Person Count"
  #   description: "Average number of people device counted per meeting over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_average_person_count" ;;
  # }

  # dimension: 6mth_average_remote_talk_time_minutes {
  #   hidden: yes
  #   label: "6 Month Avg. Remote Talk Minutes"
  #   description: "Average number of minutes meeting that attendee(s) not using the device spoke per meeting over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_average_remote_talk_time_minutes" ;;
  # }

  # dimension: 6mth_count_crash_meetings {
  #   hidden: yes
  #   label: "6 Month Count Crash Meetings"
  #   description: "Number of meetings device has crashed during over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_count_crash_meetings" ;;
  # }

  # dimension: 6mth_count_of_meetings {
  #   hidden: yes
  #   label: "6 Month Count of Meetings"
  #   description: "Total number of meetings device has participated in over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_count_of_meetings" ;;
  # }

  # dimension: 6mth_count_of_paired_meetings {
  #   hidden: yes
  #   label: "6 Month Count of Paired Meetings"
  #   description: "Number of meetings device has been paired to another device over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_count_of_paired_meetings" ;;
  # }

  # dimension: 6mth_max_person_count {
  #   hidden: yes
  #   label: "6 Month Maximum Person Count"
  #   description: "Greatest number of people counted by device in a single meeting over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_max_person_count" ;;
  # }
}
