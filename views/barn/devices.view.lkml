view: devices {
  sql_table_name: owlbarn_views.devices_v ;;
  drill_fields: [device_id]

# Dimensions

  dimension_group: activated {
    label: "Activation"
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
    sql: ${TABLE}.device_activation_date::timestamp ;;
  }

  dimension: alias {
    description: "Customer's chosen nickname for device, User Given Name field in Barn website"
    type: string
    sql: ${TABLE}.device_alias ;;
  }

  dimension: bootloaderversion {
    label: "Bootloader Version"
    type:  string
    sql: ${TABLE}.bootloaderversion ;;
  }

# to join to barn_channels
  dimension: channel_id {
    label: "Channel ID"
    hidden: yes
    type: number
    sql: ${TABLE}.channel_id ;;
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
    sql: ${TABLE}.device_last_checkin_date::timestamp ;;
  }

  dimension_group: createdat {
    hidden: yes
    description: "Device Record Create"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.device_record_create_date::timestamp ;;
  }

  dimension: device_id {
    primary_key: yes
    label: "ID"
    description: "Unique identifier for each device record"
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: deviceuuid {
    label: "DeviceUUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: device_name {
    label: "Name"
    type: string
    sql: ${TABLE}.device_name ;;
  }

  dimension: display_name {
    label: "Display Name"
    type: string
    sql: coalesce(${alias}, ${device_name}) ;;
  }

  dimension: hardware_serial {
    label: "Hardware Serial Number"
    type: string
    sql: ${TABLE}.device_hardware_serial_number ;;
  }

  dimension: hardware_version {
    label: "Hardware Version"
    type: string
    sql: ${TABLE}.device_hardware_version ;;
  }

  dimension: lastip {
    label: "Last IP Address"
    description: "Device most recent IP address, captured from most recent check-in"
    type: string
    sql: ${TABLE}.device_last_ip_address ;;
  }

  dimension: lastgeo {
    label: "Last Geo"
    # group_label: "Last Geo"
    description: "Format is City | Region | Country | Longitude | Latitude | Timezone, translated from Last IP Address"
    type: string
    sql: ${TABLE}.lastgeo ;;
  }

  dimension: lastgeo_city {
    hidden: yes
    # group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_city ;;
  }

  dimension: lastgeo_country {
    hidden: yes
    # group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_country ;;
  }

  dimension: lastgeo_latitude {
    hidden: yes
    # group_label: "Last Geo"
    type: number
    sql: ${TABLE}.lastgeo_latitude ;;
  }

  dimension: lastgeo_longitude {
    hidden: yes
    # group_label: "Last Geo"
    type: number
    sql: ${TABLE}.lastgeo_longitude ;;
  }

  dimension: lastgeo_region {
    hidden: yes
    # hidden: yes
    # group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_region ;;
  }

  dimension: lastgeo_timezone {
    hidden: yes
    # group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_timezone ;;
  }

  dimension: location {
    hidden: yes
    label: "Last Geo Location"
    # group_label: "Last Geo"
    type: location
    # sql_latitude:round(${lastgeo_latitude},2) ;;
    # sql_longitude:round(${lastgeo_longitude},2) ;;
    sql_latitude:${lastgeo_latitude} ;;
    sql_longitude:${lastgeo_longitude} ;;
  }

  dimension: last_location {
    description: "Device most recent meeting location, captured from most recent check-in"
    type: string
    sql: ${TABLE}.device_last_location ;;
  }

  dimension: macaddress {
    label: "MAC Address"
    type: string
    sql: ${TABLE}.macaddress ;;
  }

  dimension: parent_settings {
    type: string
    sql: ${TABLE}.device_parent_settings ;;
  }

  dimension: pcb_version {
    label: "PCB Version"
    type: string
    sql: ${TABLE}.device_pcb_version ;;
  }

  dimension: product_id {
    label: "Product ID"
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    label: "Device Type"
    description: "Device product type"
    type: string
    sql: ${TABLE}.product_name;;
  }

  dimension: software_serial {
    label: "Software Serial Number"
    type: string
    sql: ${TABLE}.device_serial_number ;;
  }

  dimension: settings {
    type: string
    sql: ${TABLE}.device_settings ;;
  }

  dimension: software_version {
    label: "Current Software Version"
    description: "Device's most recent software version (decimal expansion format), captured during most recent check-in"
    type: string
    sql: ${TABLE}.device_software_version ;;
  }

  dimension: software_version_number {
    label: "Current Software Version (integer)"
    description: "Device's most recent software version (integer format), captured during most recent check-in"
    type: number
    value_format: "0"
    sql: ${TABLE}.device_software_version_number ;;
  }

  dimension: software_version_family {
    hidden: yes
    label: "Current Software Version Family"
    # description: "The first "
    type: number
    sql: ${TABLE}.software_version_family ;;
  }

  dimension: status_number {
    hidden: yes
    # description: "Status Values: 0 - New, 1 - Active, 2 - Requires Update, 3 - Updating, 4 - Inactive, 5 - Downloading Update, 6 - Offline, 7 - Archived"
    type: number
    sql: ${TABLE}.device_status ;;
  }

  dimension: status_text {
    label: "Status"
    type: string
    sql: ${TABLE}.device_status_text ;;
  }

  dimension: record_source {
    hidden: yes
    # description: "place where this record is from"
    type: string
    sql: ${TABLE}.record_source ;;
  }

  dimension_group: updatedat {
    hidden: yes
    sql: ${TABLE}.updatedat ;;
  }

  dimension_group: retiredat {
    hidden: yes
    sql: ${TABLE}.retiredat ;;
  }

  dimension: settings_version {
    # hidden: yes
    type: number
    sql: ${TABLE}.settings_version ;;
  }

  dimension: settings_timestamp {
    # hidden: yes
    type: number
    sql: ${TABLE}.settings_timestamp ;;
  }

  dimension: bruinlastconnectto {
    label: "Bruin Last Connect To"
    group_label: "Bruin Connect"
    sql: ${TABLE}.bruinlastconnectto ;;
  }

  dimension_group: lastconnectedbruintime {
    label: "Last Connected Bruin Time"
    group_label: "Bruin Connect"
    sql: ${TABLE}.lastconnectedbruintime ;;
  }

  # dimension_group: lastconnectedbruintime {
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
  #   sql: ${TABLE}.lastconnectedbruintime ;;
  # }

  dimension: lastconnectedbruinstatus {
    label: "Last Connected Bruin Status"
    group_label: "Bruin Connect"
    sql: ${TABLE}.lastconnectedbruinstatus ;;
  }

  dimension_group: most_recent_meeting {
    label: "Most Recent Meeting"
    type: time
    timeframes: [
      raw,
      date,
      time,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.most_recent_meeting_date::timestamp ;;
  }

  dimension: most_recent_meeting_length_seconds {
    hidden: yes
    label: "Most Recent Meeting Length (seconds)"
    type: number
    sql: ${TABLE}.most_recent_meeting_length_seconds ;;
  }

  dimension: most_recent_meeting_length_minutes {
    label: "Most Recent Meeting Length (minutes)"
    description: "Length in minutes of device's most recent meeting."
    type: number
    sql: ${most_recent_meeting_length_seconds} / 60 ;;
  }


# cohort analysis
  dimension_group: first_owl_connect_mtg_5_mins {
    hidden: yes
    label: "First Owl Connect Meeting >= 5 Minutes"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_owl_connect_meeting_date_longer_than_5_mins::timestamp ;;
  }






# Measures
# update name - count_deviceuuid
  measure: device_count {
    label: "Count of Devices"
    description: "Count of unique deviceuuids"
    type: count_distinct
    sql: ${deviceuuid} ;;
    drill_fields: [device_id, deviceuuid, device_name, product_name]
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
