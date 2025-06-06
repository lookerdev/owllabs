view: devices {
  sql_table_name: owlbarn_views.devices_v ;;
  drill_fields: [device_id, device_url]

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
    # type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: deviceuuid {
    label: "DeviceUUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
    drill_fields: [device_url]
  }


  dimension: device_url {
    label: "Barn Device URL"
    description: "URL to record in Barn"
    type: string
    sql:'https://barn.owllabs.com/device/'||${TABLE}."deviceuuid" ;;
    html: <a href="{{value}}" target="_blank">Barn Device URL</a>;;
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

  dimension: dsku {
    label: "dSKU"
    type: string
    sql: ${TABLE}.dsku ;;
  }

  dimension: hardware_serial {
    label: "Hardware Serial Number"
    case_sensitive: no
    type: string
    sql: ${TABLE}.device_hardware_serial_number ;;
  }

  dimension: hardwareserial_weeknum {
    label: "Hardware Serial Week Number"
    group_label: "Hardware Serial Number Components"
    type: number
    sql: ${TABLE}.hardwareserial_weeknum ;;
  }

  dimension: hardwareserial_year {
    label: "Hardware Serial Year"
    group_label: "Hardware Serial Number Components"
    type: number
    sql: CASE WHEN ${TABLE}.hardwareserial_year IS NOT NULL THEN CONCAT('20',${TABLE}.hardwareserial_year) ELSE ${TABLE}.hardwareserial_year END ;;
  }

  dimension: hardware_version {
    label: "Hardware Version"
    type: string
    sql: ${TABLE}.device_hardware_version ;;
  }


  dimension: inventorysku {
    label: "Inventory SKU"
    type: string
    sql: ${TABLE}.inventorysku ;;
  }

  dimension: lastip {
    label: "Last IP Address"
    description: "Device most recent IP address, captured from most recent check-in"
    type: string
    sql: ${TABLE}.device_last_ip_address ;;
  }

  dimension: macaddress {
    label: "MAC Address"
    type: string
    sql: ${TABLE}.macaddress ;;
  }

  dimension: parent_settings {
    # currently trimmed to 256 characters
    hidden: yes
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
    # bypass_suggest_restrictions: yes
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
    # currently trimmed to 256 characters
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

  dimension: software_version_family {
    # hidden: yes
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
    # html:
    # {% if value == 'New' %}
    # <p style="color: lightgrey">{{ rendered_value }}</p>
    # {% elsif value == 'Offline' %}
    # <p style="color: lightgrey">{{ rendered_value }}</p>
    # {% elsif value == 'Active' %}
    # <p style="color: green">{{ rendered_value }}</p>
    # {% elsif value == 'Requires Update' %}
    # <p style="color: red">{{ rendered_value }}</p>
    # {% elsif value == 'Updating' %}
    # <p style="color: orange">{{ rendered_value }}</p>
    # {% elsif value == 'Downloading Update' %}
    # <p style="color: orange">{{ rendered_value }}</p>
    # {% else %}
    # <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    # {% endif %}
    # ;;
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
    hidden: yes
    type: number
    sql: ${TABLE}.settings_version ;;
  }

  dimension: settings_timestamp {
    hidden: yes
    type: number
    sql: ${TABLE}.settings_timestamp ;;
  }

  dimension: warrantyexpirationdate {
    label: "Warranty Expiration Date"
    type: date
    sql: ${TABLE}.warrantyexpirationdate ;;
  }

  dimension: bruinlastconnectto {
    label: "Bruin Last Connect To"
    description: "Hardware serial of the device this Bruin most recently connected with"
    group_label: "Bruin Connect"
    type: string
    sql: ${TABLE}.bruinlastconnectto ;;
  }

  dimension_group: lastconnectedbruintime {
    label: "Last Connected Bruin Time"
    group_label: "Bruin Connect"
    datatype: datetime
    # type: time
    #   timeframes: [
    #     raw,
    #     time,
    #     date,
    #     week,
    #     month,
    #     quarter,
    #     year
    #   ]
    sql: ${TABLE}.lastconnectedbruintime ;;
  }

## CONVERT TO BOOL
  dimension: lastconnectedbruinstatus {
    label: "Last Connected Bruin Status"
    group_label: "Bruin Connect"
    # type: yesno
    type: string
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

## LASTGEO
  dimension: lastgeo {
    label: "Last Geo"
    group_label: "Last Geo Location"
    description: "Geographic location of device's most recent meeting. Format is City | Region | Country | Longitude | Latitude | Timezone, translated from Last IP Address"
    type: string
    sql: ${TABLE}.lastgeo ;;
  }

  dimension: lastgeo_city {
    # hidden: yes
    label: "Last Geo City"
    group_label: "Last Geo Location"
    type: string
    sql: ${TABLE}.lastgeo_city ;;
  }

  dimension: lastgeo_latitude {
    hidden: yes
    label: "Last Geo Latitude"
    group_label: "Last Geo Location"
    type: number
    sql: ${TABLE}.lastgeo_latitude ;;
  }

  dimension: lastgeo_longitude {
    hidden: yes
    label: "Last Geo Longitude"
    group_label: "Last Geo Location"
    type: number
    sql: ${TABLE}.lastgeo_longitude ;;
  }

  dimension: lastgeo_region {
    # hidden: yes
    label: "Last Geo Region"
    description: "US states, CA provinces, etc."
    group_label: "Last Geo Location"
    type: string
    sql: ${TABLE}.lastgeo_region ;;
  }

  dimension: lastgeo_timezone {
    # hidden: yes
    label: "Last Geo Time Zone"
    group_label: "Last Geo Location"
    type: string
    sql: ${TABLE}.lastgeo_timezone ;;
  }

  dimension: location {
    # hidden: yes
    label: "Last Geo Latitude/Longitude"
    group_label: "Last Geo Location"
    type: location
    # sql_latitude:round(${lastgeo_latitude},6) ;;
    # sql_longitude:round(${lastgeo_longitude},6) ;;
    sql_latitude:${lastgeo_latitude} ;;
    sql_longitude:${lastgeo_longitude} ;;
  }

  dimension: lastgeo_country_iso2 {
    hidden: yes
    label: "Last Geo Country ISO Alpha-2 Code"
    group_label: "Last Geo Location"
    type: string
    sql: ${TABLE}.lastgeo_country_iso2 ;;
  }

# moved to devices_extend
  # dimension: lastgeo_country_iso3 {
  #   hidden: yes
  #   label: "Last Geo Country ISO Alpha-3 Code"
  #   group_label: "Last Geo Location"
  #   type: string
  #   sql: ${TABLE}.lastgeo_country_iso3 ;;
  # }

  dimension: lastgeo_country_shortname {
    # hidden: yes
    label: "Last Geo Country Name"
    group_label: "Last Geo Location"
    type: string
    sql: ${TABLE}.lastgeo_country_shortname ;;
  }

  dimension: lastgeo_world_region {
    # hidden: yes
    label: "Last Geo World Region"
    group_label: "Last Geo Location"
    type: string
    sql: ${TABLE}.lastgeo_world_region ;;
  }

# ## OWL CONNECT USAGE
#   dimension: firstowlconnectasprimary {
#     # hidden: yes
#     label: "Date of First Paired Meeting as Primary Device"
#     group_label: "Owl Connect"
#     description: "Device's first date in a paired meeting as the primary device"
#     type: date_time
#     sql: ${TABLE}.firstowlconnectasprimary ;;
#   }

#   dimension: pairedasprimary {
#     # hidden: yes
#     label: "Ever Paired as Primary Device?"
#     group_label: "Owl Connect"
#     description: "If device has ever participated in a paired meeting as the primary device"
#     type: yesno
#     sql: ${firstowlconnectasprimary} is not null ;;
#   }

#   dimension: firstowlconnectassecondary {
#     # hidden: yes
#     label: "Date of First Paired Meeting as Secondary Device"
#     group_label: "Owl Connect"
#     description: "Device's first date in a paired meeting connected to the primary device, with role other than primary"
#     type: date_time
#     sql: ${TABLE}.firstowlconnectassecondary ;;
#   }

#   dimension: pairedassecondary {
#     # hidden: yes
#     label: "Ever Paired as Secondary Device?"
#     group_label: "Owl Connect"
#     description: "If device has ever participated in a paired meeting as a device connected to the primary device/as any device other than Primary"
#     type: yesno
#     sql: ${firstowlconnectassecondary} is not null ;;
#   }

#   dimension: pairedasany {
#     label: "Ever Paired in Any Role?"
#     group_label: "Owl Connect"
#     description: "If the device has ever participated in a paired meeting in any capacity, regardless of device role"
#     type: yesno
#     sql: coalesce(${firstowlconnectasprimary}, ${firstowlconnectassecondary}) is not null ;;
#   }

#   dimension: firstpairedasany {
#     label: "Date of First Paired Meeting in Any Role"
#     group_label: "Owl Connect"
#     # description: "If the device has ever participated in a paired meeting in any capacity, regardless of device role"
#     type: date_time
#     sql: coalesce(cast(${firstowlconnectasprimary} as timestamp), cast(${firstowlconnectassecondary} as timestamp)) ;;
#   }

#   dimension: days_registration_to_paired_mtg {
#     # label: "Days from Registration to First Paired Meeting"
#     type: number
#     sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
#     # round to how many decimals?
#   }


#   measure: avg_days_registration_to_paired_mtg {
#     label: "Avg. Days from Registration to First Paired Meeting"
#     type: average
#     sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
#     # round to how many decimals?
#   }

#   measure: avg_days_registration_to_paired_mtg2 {
#     # label: "Avg. Days from Registration to First Paired Meeting"
#     type: average_distinct
#     sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
#     # round to how many decimals?
#   }

#   measure: avg_days_registration_to_paired_mtg3 {
#     # label: "Avg. Days from Registration to First Paired Meeting"
#     type: number
#     sql: sum(${days_registration_to_paired_mtg})/count(${deviceuuid})
#       ;;
#     # round to how many decimals?
#   }




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
    drill_fields: [device_id, deviceuuid, device_name, product_name, device_url]
  }


  # measure: map_count_devices {
  #   # hidden: yes
  #   label: "Count of Devices"
  #   description: "Count of unique deviceuuids"
  #   type: count_distinct
  #   sql: ${deviceuuid} ;;
  #   drill_fields: [lastgeo_country_shortname, device_registrations.company_domain, map_count_devices]
  # }

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
