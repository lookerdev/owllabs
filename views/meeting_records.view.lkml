view: meeting_records {
  label: "Meeting Records"
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
  }

  dimension: hour {
    hidden: yes
    type: number
    sql: extract(hour from ${startdate_raw}) ;;
  }

  dimension_group: owl_connect_return_after_first_mtg {
    hidden: yes
    type: duration
    sql_start: ${device_view.first_owl_connect_mtg_5_mins_date} ;;
    sql_end: ${startdate_date} ;;
  }




# Measures

  measure: count_meetings {
    label: "Count of Meetings"
    description: "Count of unique meeting records"
    type: count
    # sql: ${id} ;;
    drill_fields: [device_view.product_name, count_meetings]
  }

  measure: count_devices {
    label: "Count of Devices in Meetings"
    description: "Number of distinct devices that have had meetings"
    type: count_distinct
    sql: ${deviceuuid};;
    drill_fields: [durationminutes_per_meeting, count_devices]
  }

  measure: durationseconds {
    hidden: yes
    # label: "Meeting Duration - seconds"
    label: "Total Meeting Seconds"
    description: "Total sum of meeting seconds for all devices"
    type: sum
    sql: ${TABLE}.durationseconds ;;
  }

  measure: durationminutes {
    label: "Total Meeting Minutes"
    description: "Total sum of meeting minutes for all devices"
    type: number
    sql: sum(${TABLE}.durationseconds) / 60 ;;
  }

  measure: durationhours {
    label: "Total Meeting Hours"
    type: number
    sql: sum(${TABLE}.durationseconds) / 3600;;
  }

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

  measure: avg_meeting_length_minutes {
    label: "Avg. Minutes per Meeting"
    type: average
    value_format: "0"
    sql: ${durationminutes_per_meeting};;
  }

  measure: bothtalktimeseconds {
    label: "Total Both Talk Time Seconds"
    description: "Total second at least one meeting attendee using the device and at least one meeting attendee not using the device spoke at the same time"
    type: sum
    sql: ${TABLE}.bothtalktimeseconds ;;
  }

  measure: localtalktimeseconds {
    label: "Total Local Talk Time Seconds"
    description: "Total seconds meeting attendee(s) using the device spoke"
    type: sum
    sql: ${TABLE}.localtalktimeseconds ;;
  }

  measure: neithertalktimeseconds {
    label: "Total Neither Talk Time Seconds"
    description: "Total seconds no meeting attendees spoke"
    type: sum
    sql: ${TABLE}.neithertalktimeseconds ;;
  }

  measure: personcount {
    label: "Total Person Count"
    description: "Device's count of total people who spoke during the meeting"
    type: sum
    sql: ${TABLE}.personcount ;;
  }

  measure: presenterseconds {
    label: "Total Presenter Mode Seconds"
    description: "Seconds of meeting with presenter mode enabled"
    type: sum
    sql: ${TABLE}.presenterseconds ;;
  }

  measure: remotetalktimeseconds {
    label: "Total Remote Talk Time Seconds"
    description: "Total seconds that meeting attendee(s) not using the device spoke"
    type: sum
    sql: ${TABLE}.remotetalktimeseconds ;;
  }

  measure: crash_count {
    description: "Count of Times Device Crashed"
    type: sum
    sql: CASE WHEN ${crashinmeeting} = 'true' THEN 1 ELSE NULL END;;
    drill_fields: [device_view.product_name, crash_count]
  }

  measure: count_days {
    hidden: yes
    type: number
    sql: count(distinct ${startdate_date}) ;;
  }

  measure: max_startdate {
    hidden: yes
    label: "Most Recent Meeting Date"
    sql: max(${originalstartdate_date})::timestamp ;;
  }


  # measure: max_number_meetings {
  #   label: "Maximum Number of Meetings"
  #   type: max
  #   sql: ${TABLE}.count;;
  #   drill_fields: [id,deviceuuid]
  # }

  # measure: avg_person_count_per_mtg {
  #   label: "Average Person Count per Meeting"
  #   type: average
  #   sql: ${personcount} * 1.0 ;; # personcount needs to be a dimension
  #   drill_fields: [id,deviceuuid]
  # }

# # does this measure work?
#   measure: avg_number_meetings_per_week {
#     label: "Average Number of Meetings per Week"
#     type: number
#     sql: count(${TABLE}.id) / nullif(DATEDIFF(week,min(${TABLE}.startdate::timestamp), max(${TABLE}.startdate::timestamp)),0);;
#   }
}
