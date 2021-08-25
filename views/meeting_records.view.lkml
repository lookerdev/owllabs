view: meeting_records {
  sql_table_name: public.meeting_records ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    label: "Meeting ID"
    description: "Unique identifier for each meeting"
    type: number
    sql: ${TABLE}.id;;
  }

  dimension: avepinnedaoiwidth {
    type: number
    sql: ${TABLE}.avepinnedaoiwidth ;;
  }

  dimension: bothtalktimeseconds {
    label: "Both Talk Time Seconds"
    description: ""
    type: number
    sql: ${TABLE}.bothtalktimeseconds ;;
  }

  dimension: crashinmeeting {
    label: "Crash in Meeting"
    description: "Whether the Owl crashed during the meeting"
    type: yesno
    sql: ${TABLE}.crashinmeeting ;;
  }

  dimension_group: createdat {
    label: "Meeting Record Creation"
    description: ""
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
    hidden: yes
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
    label: "Local Talk Time - Seconds"
    description: "Total seconds that the "
    type: number
    sql: ${TABLE}.localtalktimeseconds ;;
  }

  dimension: location {
    hidden: yes
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: neithertalktimeseconds {
    label: "Neither Talk Time - Seconds"
    description: "Number of total seconds no meeting attendees spoke"
    type: number
    sql: ${TABLE}.neithertalktimeseconds ;;
  }

  dimension: npinnedaoiedits {
    type: number
    sql: ${TABLE}.npinnedaoiedits ;;
  }

  dimension: npinnedaoiseconds {
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
    description: ""
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
    label: "Remote Talk Time - Seconds"
    description: ""
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

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: device_count {
    hidden: yes
    type: count_distinct
    drill_fields: [id]
    sql: ${TABLE}.deviceuuid;;
  }

  measure: crash_count {
    type: sum
    sql: CASE WHEN ${TABLE}.crashinmeeting = 'true' THEN 1 ELSE NULL END;;
  }

  measure: avg_meeting_length_minutes {
    type: average
    drill_fields: [id]
    sql: ${durationminutes};;
  }


}
