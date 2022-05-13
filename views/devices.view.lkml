view: devices {
  sql_table_name: public.devices_view ;;
  drill_fields: [device_id]
  # label: "Devices - new"

# Dimensions

  dimension: device_id {
    primary_key: yes
    hidden: yes
    label: "Device Record ID"
    description: "Unique identifier for each device record"
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: alias {
    label: "Device Alias"
    description: "Customer's chosen nickname for device, User Given Name field in Barn UI"
    type: string
    sql: ${TABLE}.device_alias ;;
  }

  dimension: device_name {
    # hidden: yes
    type: string
    sql: ${TABLE}.device_name ;;
  }

  dimension: display_name {
    hidden: yes
    label: "Device Display Name"
    type: string
    sql: coalesce(${alias}, ${device_name}) ;;
  }

# possibly remove this column from table, can replace with barn_channels view
  dimension: channel_id {
    label: "Channel ID"
    hidden: yes
    type: number
    sql: ${TABLE}.channel_id ;;
  }

# possibly remove this column from table, can replace with barn_channels view
  dimension: channel_name {
    hidden: yes
    label: "Barn Channel Name"
    description: "Name of Barn channel device belongs to"
    type: string
    sql: ${TABLE}.channel_name ;;
  }

# possibly remove this column from table, can replace with barn_channels view
  dimension: barn_channel_category {
    hidden: yes
    description: "Public = customer-facing, Internal = testing, Beta = beta testing"
    type: string
    sql: ${TABLE}.channel_category;;
  }

  dimension: bootloaderversion {
    label: "Bootloader Version"
    type:  string
    sql: ${TABLE}.bootloaderversion ;;
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
    description: "Device Record Creation"
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

  dimension_group: activated {
    label: "Device Activation"
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

  dimension_group: deletedat {
    hidden: yes
    label: "Device Record Delete"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.device_record_delete_date::timestamp ;;
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
    description: "Device's most recent IP address, captured during most recent check-in"
    hidden: yes
    type: string
    sql: ${TABLE}.device_last_ip_address ;;
  }

  dimension: lastgeo {
    label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo ;;
  }

  dimension: last_location {
    hidden: yes
    type: string
    sql: ${TABLE}.device_last_location ;;
  }

  dimension: macaddress {
    label: "MAC Address"
    type: string
    sql: ${TABLE}.macaddress ;;
  }

  dimension: parent_settings {
    # hidden: yes
    type: string
    sql: ${TABLE}.device_parent_settings ;;
  }

  dimension: pcb_version {
    label: "PCB Version"
    # hidden: yes
    type: string
    sql: ${TABLE}.device_pcb_version ;;
  }

  dimension: product_id {
    hidden: yes
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
    hidden: yes
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

  # # have to test if this dimension works properly
  dimension: is_current_version {
    description: "Whether the device's Current Software Version is the most recent production release to that device's Barn Channel."
    type: yesno
    sql: ${software_version_number} = ${barn_channels.current_version} ;;
    }

  dimension: status_number {
    hidden: yes
    # description: "Status Values: 0 - New, 1 - Active, 2 - Requires Update, 3 - Updating, 4 - Inactive, 5 - Downloading Update, 6 - Offline, 7 - Archived"
    type: number
    sql: ${TABLE}.device_status ;;
  }

  dimension: status_text {
    label: "Device Status"
    type: string
    sql: ${TABLE}.device_status_text ;;
    # sql: (CASE when ${TABLE}.device_status = 0 then 'New'
    #           when ${TABLE}.device_status = 1 then 'Active'
    #           when ${TABLE}.device_status = 2 then 'Requires Update'
    #           when ${TABLE}.device_status = 3 then 'Updating'
    #           when ${TABLE}.device_status = 4 then 'Inactive'
    #           when ${TABLE}.device_status = 5 then 'Downloading Update'
    #           when ${TABLE}.device_status = 6 then 'Offline'
    #           when ${TABLE}.device_status = 7 then 'Archive'
    #           else 'Not Defined'
    #           end) ;;
  }

  dimension: deviceuuid {
    label: "DeviceUUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: record_source {
    hidden: yes
    description: "place where this record is from"
    type: string
    sql: ${TABLE}.record_source ;;
  }

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

  dimension_group: updatedat {
    hidden: yes
    sql: ${TABLE}.updatedat ;;
  }

  dimension_group: retiredat {
    hidden: yes
    sql: ${TABLE}.retiredat ;;
  }

  dimension: settings_version {
    hidden: yes
    type: number
    sql: ${TABLE}.settings_version ;;
  }

  dimension: settings_timestamp {
    hidden: yes
    type: number
    sql: ${TABLE}.settings_timestamp ;;
  }

  dimension_group: lastconnectedbruintime {
    hidden: yes
    sql: ${TABLE}.lastconnectedbruintime ;;
  }

  dimension: lastconnectedbruinstatus {
    hidden: yes
    sql: ${TABLE}.lastconnectedbruinstatus ;;
  }

  dimension: bruinlastconnectto {
    hidden: yes
    sql: ${TABLE}.bruinlastconnectto ;;
  }



# Measures
  measure: device_count {
    label: "Count of Devices"
    description: "Count of unique deviceuuids"
    type: count_distinct
    sql: ${deviceuuid} ;;
    drill_fields: [device_id, deviceuuid, device_name, product_name, channel_name]
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
