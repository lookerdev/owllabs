view: meeting_records {
  label: "Meeting Records"
  sql_table_name: public.device_meeting_record_view ;;
  drill_fields: [id]

# Dimensions
  dimension: id {
    primary_key: yes
    hidden: yes
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

  dimension: bothtalktimeseconds {
    label: "Both Talk Time - seconds"
    description: "Total second at least one meeting attendee using the device and at least one meeting attendee not using the device spoke at the same time"
    type: number
    sql: ${TABLE}.bothtalktimeseconds ;;
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

  dimension: durationseconds {
    label: "Meeting Duration - seconds"
    description: "The number of seconds the meeting lasted"
    type: number
    sql: ${TABLE}.durationseconds ;;
  }

  dimension: durationminutes {
    label: "Meeting Duration - minutes"
    description: "The number of minutes the meeting lasted"
    type: number
    sql: ${TABLE}.durationseconds/60 ;;
  }

  dimension: localtalktimeseconds {
    label: "Local Talk Time - seconds"
    description: "Total seconds meeting attendee(s) using the device spoke"
    type: number
    sql: ${TABLE}.localtalktimeseconds ;;
  }

  dimension: location {
    hidden: yes
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: neithertalktimeseconds {
    label: "Neither Talk Time - seconds"
    description: "Total seconds no meeting attendees spoke"
    type: number
    sql: ${TABLE}.neithertalktimeseconds ;;
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

  dimension: personcount {
    label: "Person Count"
    description: "Device's count of total people who spoke during the meeting"
    type: number
    sql: ${TABLE}.personcount ;;
  }

  dimension: presenteradmin {
    label: "Presenter Admin"
    description: "Whether presenter mode was enabled by admin setting"
    type: string
    sql: ${TABLE}.presenteradmin ;;
  }

  dimension: presenterseconds {
    label: "Presenter Seconds"
    description: "Seconds of meeting with presenter mode enabled"
    type: string
    sql: ${TABLE}.presenterseconds ;;
  }

  dimension: remotetalktimeseconds {
    label: "Remote Talk Time - seconds"
    description: "Total seconds meeting attendee(s) not using the device spoke"
    type: number
    sql: ${TABLE}.remotetalktimeseconds ;;
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
    label: "Was Paired"
    description: "Whether this device was paired to another device (MOP or WBO) during meeting"
    sql: ${TABLE}.waspaired ;;
  }

  dimension: meeting_software_version {
    label: "Meeting Software Version"
    sql: ${TABLE}.softwareversion ;;
    type: string

  }

# Measures
  measure: count {
    label: "Number of Meetings"
    type: count
    drill_fields: [id]
  }

  measure: avg_number_meetings {
    label: "Average Number of Meetings"
    type: average
    sql: ${TABLE}.id ;;
  }

  measure: crash_count {
    type: sum
    sql: CASE WHEN ${TABLE}.crashinmeeting = 'true' THEN 1 ELSE NULL END;;
  }

  measure: avg_meeting_length_minutes {
    label: "Average Meeting Length - minutes"
    type: average
    drill_fields: [id]
    sql: ${durationminutes};;
  }

  measure: max_number_meetings {
    label: "Maximum Number of Meetings"
    type: max
    drill_fields: [id,deviceuuid]
    sql: ${TABLE}.count;;
  }

  measure: avg_person_count {
    label: "Average Person Count per Meeting"
    type: average
    drill_fields: [id,deviceuuid]
    sql: ${TABLE}.personcount;;
  }

  measure: count_devices {
    label: "Number of Devices"
    type: count_distinct
    # drill_fields: [id,deviceuuid]
    sql: ${TABLE}.deviceuuid;;
  }


}
