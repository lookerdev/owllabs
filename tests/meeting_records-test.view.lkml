view: meeting_records_test {
  # label: "Meeting Records"
  sql_table_name: public.device_meeting_record_view ;;
  drill_fields: [id]

# Dimensions
  dimension: id {
    primary_key: yes
    # hidden: yes
    label: "Meeting ID"
    description: "Unique identifier for each meeting record"
    type: number
    sql: ${TABLE}.id;;
  }

  dimension: avepinnedaoiwidth {
    hidden: yes
    label: "Average Pinned AOI Width"
    type: number
    sql: ${TABLE}.avepinnedaoiwidth ;;
  }

  dimension: crashinmeeting {
    label: "Crash in Meeting"
    description: "Whether the device crashed during the meeting"
    type: yesno
    sql: ${TABLE}.crashinmeeting ;;
  }

  dimension_group: createdat {
    hidden: yes
    label: "Meeting Record Created"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createdat::timestamp ;;
  }

  dimension: deviceuuid {
    # hidden: yes
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: location {
    hidden: yes
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: npinnedaoiedits {
    hidden: yes
    label: "Number of Pinned AOI Edits"
    type: number
    sql: ${TABLE}.npinnedaoiedits ;;
  }

  dimension: npinnedaoiseconds {
    hidden: yes
    label: "Number of Pinned AOI Seconds"
    type: number
    sql: ${TABLE}.npinnedaoiseconds ;;
  }

  dimension_group: originalstartdate {
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
    sql: ${TABLE}.originalstartdate::timestamp ;;
  }

  dimension: presenteradmin {
    label: "Presenter Mode Enabled"
    description: "Whether presenter mode was enabled by admin setting"
    type: yesno
    sql: ${TABLE}.presenteradmin ;;
  }

  dimension_group: startdate {
    label: "Meeting Start"
    description: "The datetime at which a meeting began"
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
    sql: ${TABLE}.startdate::timestamp ;; # have to cast as timestamp for the date parts (year, etc) to work
    allow_fill: yes
  }

  dimension_group: updatedat {
    hidden: yes
    label: "Meeting Record Updated"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updatedat::timestamp ;;
  }

  dimension: waspaired {
    type: yesno
    label: "Device Paired"
    description: "Whether this device was paired to another device during meeting"
    sql: ${TABLE}.waspaired ;;
  }

  dimension: meeting_software_version {
    label: "Meeting Software Version"
    description: "The software version a device had installed at the time of the meeting. Based on software version captured for device at most recent checkin prior to meeting start. If null, this data can't be gathered from the device's checkins (Possible reasons - the most recent checkin for device occurred after the meeting date and sw version could not be determined, no sw version captured at checkin)."
    type: string
    sql: ${TABLE}.softwareversion ;;
  }

  dimension: durationseconds_per_meeting {
    hidden: yes
    label: "Meeting Length - seconds"
    description: "The number of minutes that each individual meeting takes. Use this to filter by meeting length."
    type: number
    sql: ${TABLE}.durationseconds ;;
  }

  dimension: durationminutes_per_meeting {
    label: "Meeting Length (minutes)"
    description: "The number of seconds that each individual meeting takes. Use this to filter by meeting length."
    type: number
    sql: ${TABLE}.durationseconds / 60 ;;
    # value_format: "0" # integer
  }

  dimension: hour {
    hidden: yes
    type: number
    sql: extract(hour from ${startdate_raw}) ;;
  }

  dimension_group: owl_connect_return_after_first_mtg {
    hidden: yes
    type: duration
    # sql_start: ${devices.first_owl_connect_mtg_5_mins_date} ;;
    sql_start: ${device_view.first_owl_connect_mtg_5_mins_date} ;;
    sql_end: ${startdate_date} ;;
  }




# Measures

# counts
  measure: count_meetings {
    label: "Count of Meetings"
    description: "Count of unique meeting records"
    type: count
    # sql: ${id} ;;
    # drill_fields: [devices.product_name, count_meetings]
    drill_fields: [device_view.product_name, count_meetings]
  }

  measure: count_devices {
    label: "Count of Devices in Meetings"
    description: "Number of distinct devices that have had meetings"
    type: count_distinct
    sql: ${deviceuuid};;
    drill_fields: [durationminutes_per_meeting, count_devices]
  }

  measure: crash_count {
    description: "Count of Times Device Crashed"
    type: sum
    sql: CASE WHEN ${crashinmeeting} = 'true' THEN 1 ELSE NULL END;;
    # drill_fields: [devices.product_name, crash_count]
    drill_fields: [device_view.product_name, crash_count]
  }

  measure: count_days {
    hidden: yes
    type: number
    sql: count(distinct ${startdate_date}) ;;
  }

  measure: personcount {
    label: "Total Person Count"
    description: "Device's count of total people who spoke during the meeting"
    type: sum
    sql: ${TABLE}.personcount ;;
  }

# meeting duration
  measure: durationseconds {
    hidden: yes
    label: "Total Meeting Seconds"
    group_label: "Meeting Duration"
    description: "Total sum of meeting seconds for all devices"
    type: sum
    sql: ${durationseconds_per_meeting} ;;
  }

  measure: durationminutes {
    label: "Total Meeting Minutes"
    group_label: "Total Meeting Duration"
    description: "Total sum of meeting minutes for all devices"
    type: number
    sql: sum(${durationseconds_per_meeting}) / 60.0 ;;
    # value_format: "0" # integer
    value_format: "#,##0"
  }

  measure: durationhours {
    label: "Total Meeting Hours"
    group_label: "Total Meeting Duration"
    type: number
    sql: sum(${durationseconds_per_meeting}) / 3600.0 ;;
    value_format: "0.0" #adds 1 decimal place
  }

# averages
  measure: avg_hours_per_device{
    hidden: yes
    label: "Avg. Meeting Hours per Device"
    type: number
    value_format: "0.00"
    sql: (${durationhours} * 1.0) / ${count_devices} ;;
  }

  measure: avg_meetings_per_device {
    hidden: yes
    label: "Avg. Meetings per Device"
    type: number
    value_format: "0.00"
    sql: (${count_meetings} * 1.0) / ${count_devices} ;;
  }


# talk time
  measure: remotetalktimeseconds {
    label: "Total Remote Talk Time (seconds)"
    group_label: "Total Talk Time"
    description: "Total seconds that meeting attendee(s) not using the device spoke"
    type: sum
    sql: ${TABLE}.remotetalktimeseconds ;;
  }

  measure: bothtalktimeseconds {
    label: "Total Both Talk Time (seconds)"
    group_label: "Total Talk Time"
    description: "Total second at least one meeting attendee using the device and at least one meeting attendee not using the device spoke at the same time"
    type: sum
    sql: ${TABLE}.bothtalktimeseconds ;;
  }

  measure: localtalktimeseconds {
    label: "Total Local Talk Time (seconds)"
    group_label: "Total Talk Time"
    description: "Total seconds meeting attendee(s) using the device spoke"
    type: sum
    sql: ${TABLE}.localtalktimeseconds ;;
  }

  measure: neithertalktimeseconds {
    label: "Total Neither Talk Time (seconds)"
    group_label: "Total Talk Time"
    description: "Total seconds no meeting attendees spoke"
    type: sum
    sql: ${TABLE}.neithertalktimeseconds ;;
  }

# other
  measure: max_startdate {
    hidden: yes
    label: "Most Recent Meeting Date"
    sql: max(${originalstartdate_date})::timestamp ;;
  }

  measure: presenterseconds {
    label: "Total Presenter Mode (seconds)"
    description: "Seconds of meeting with presenter mode enabled"
    type: sum
    sql: ${TABLE}.presenterseconds ;;
  }

  # measure: avg_person_count_per_mtg {
  #   label: "Average Person Count per Meeting"
  #   type: average
  #   sql: ${personcount} * 1.0 ;; # personcount needs to be a dimension
  #   drill_fields: [id,deviceuuid]
  # }


# Averages per customer per time
  parameter: timespan_picker {
    group_label: "Avgs per time period test"
    label: "Time Granularity"
    type: string
    default_value: "date_month"
    allowed_value: {
      value: "day"
      # label: "Day"
    }
    allowed_value: {
      value: "week"
      # label: "Week"
    }
    allowed_value: {
      value: "month"
      # label: "Month"
    }
    allowed_value: {
      value: "quarter"
      # label: "Quarter"
    }
    allowed_value: {
      value: "year"
      # label: "Year"
    }
  }

  dimension: count_time {
    group_label: "Avgs per time period test"
    type: number
    sql: datediff({% parameter timespan_picker %}, {% date_start startdate_date %},{% date_end startdate_date %}) ;;
  }

  measure: avg_mtgs_customers_time {
    # label_from_parameter: timespan_picker
    group_label: "Avgs per time period test"
    label: "Avg meetings per customer per time"
    description: "requires use of date filter and time granularity filter"
    sql: (${count_meetings} * 1.0 / ${device_registrations.count_domain}) / nullif(${count_time},0) ;;
    value_format: "0.##"
  }


  measure: avg_lenth_device_time {
    label: "Avg. Meeting Minutes (per device count) per Time Period"
    description: "requires use of date filter and time granularity filter"
    group_label: "Avgs per time period test"
    sql: (${durationminutes} * 1.0 / ${count_devices}) / nullif(${count_time},0) ;;
  }
  # Avg length per device count per time period



  measure: avg_mtgs_per_customer {
    label: "Avg. # Meetings per Customer"
    sql: ${count_meetings} * 1.0 / ${device_registrations.count_domain} ;;
    value_format: "0.##"
  }


  measure: avg_mtg_lenth_per_device {
    label: "Avg. Meeting Minutes per Device"
    sql: ${durationminutes} * 1.0 / ${count_devices} ;;
    value_format: "0.##"
  }





}