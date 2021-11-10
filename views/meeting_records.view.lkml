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
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.originalstartdate ;;
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
    sql: ${TABLE}.startdate ;;
  }

  dimension_group: updatedat {
    hidden: yes
    label: "Meeting Record Updated"
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
    sql: ${TABLE}.updatedat ;;
  }

  dimension: waspaired {
    type: yesno
    label: "Device Paired"
    description: "Whether this device was paired to another device during meeting"
    sql: ${TABLE}.waspaired ;;
  }

  dimension: meeting_software_version {
    type: string
    label: "Meeting Software Version"
    sql: ${TABLE}.softwareversion ;;
  }

  dimension: durationseconds_per_meeting {
    label: "Number of Seconds per Meeting"
    description: "The number of minutes that each individual meeting takes. Use this to filter by meeting length."
    type: number
    sql: ${TABLE}.durationseconds ;;
  }

  dimension: durationminutes_per_meeting {
    label: "Number of Minutes per Meeting"
    description: "The number of seconds that each individual meeting takes. Use this to filter by meeting length."
    type: number
    sql: ${TABLE}.durationseconds / 60 ;;
  }



# Measures

  measure: durationseconds {
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

  measure: avg_duration {
    type: average
    sql: ${durationminutes_per_meeting} ;;
  }

  measure: durationhours {
    label: "Total Meeting Hours"
    type: number
    sql: sum(${TABLE}.durationseconds) / 3600;;
  }

  # measure: avg_meeting_length_minutes {
  #   label: "Average Meeting Length - minutes"
  #   type: average
  #   drill_fields: [id]
  #   sql: ${durationminutes};; # durationminutes needs to be a dimension
  # }

  measure: bothtalktimeseconds {
    label: "Both Talk Time Seconds"
    description: "Total second at least one meeting attendee using the device and at least one meeting attendee not using the device spoke at the same time"
    type: sum
    sql: ${TABLE}.bothtalktimeseconds ;;
  }

  measure: localtalktimeseconds {
    label: "Local Talk Time Seconds"
    description: "Total seconds meeting attendee(s) using the device spoke"
    type: sum
    sql: ${TABLE}.localtalktimeseconds ;;
  }

  measure: neithertalktimeseconds {
    label: "Neither Talk Time Seconds"
    description: "Total seconds no meeting attendees spoke"
    type: sum
    sql: ${TABLE}.neithertalktimeseconds ;;
  }

  measure: personcount {
    label: "Person Count"
    description: "Device's count of total people who spoke during the meeting"
    type: sum
    sql: ${TABLE}.personcount ;;
  }

  measure: presenterseconds {
    label: "Presenter Mode Seconds"
    description: "Seconds of meeting with presenter mode enabled"
    type: sum
    sql: ${TABLE}.presenterseconds ;;
  }

  measure: remotetalktimeseconds {
    label: "Remote Talk Time Seconds"
    description: "Total seconds that meeting attendee(s) not using the device spoke"
    type: sum
    sql: ${TABLE}.remotetalktimeseconds ;;
  }

# # does this measure work?
#   measure: avg_number_meetings_per_week {

#     label: "Average Number of Meetings per Week"
#     type: number
#     sql: count(${TABLE}.id) / nullif(DATEDIFF(week,min(${TABLE}.startdate::timestamp), max(${TABLE}.startdate::timestamp)),0);;
#   }

  measure: crash_count {
    description: "Number of times device crashed"
    type: sum
    sql: CASE WHEN ${crashinmeeting} = 'true' THEN 1 ELSE NULL END;;
  }

  measure: max_number_meetings {
    label: "Maximum Number of Meetings"
    type: max
    sql: ${TABLE}.count;;
    drill_fields: [id,deviceuuid]
  }

  # measure: avg_person_count_per_mtg {
  #   label: "Average Person Count per Meeting"
  #   type: average
  #   sql: ${personcount} * 1.0 ;; # personcount needs to be a dimension
  #   drill_fields: [id,deviceuuid]
  # }

  measure: count {
    label: "Total Number of Meetings"
    type: count
    drill_fields: [id]
  }

  measure: count_devices {
    label: "Number of Devices"
    type: count_distinct
    sql: ${deviceuuid};;
    # drill_fields: [id,deviceuuid]
  }
}
