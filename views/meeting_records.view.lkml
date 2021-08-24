view: meeting_records {
  sql_table_name: public.meeting_records ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id;;
  }

  dimension: avepinnedaoiwidth {
    type: number
    sql: ${TABLE}.avepinnedaoiwidth ;;
  }

  dimension: bothtalktimeseconds {
    type: number
    sql: ${TABLE}.bothtalktimeseconds ;;
  }

  dimension: crashinmeeting {
    label: "Crash in Meeting"
    description: ""
    type: yesno
    sql: ${TABLE}.crashinmeeting ;;
  }

  dimension_group: createdat {
    label: "created at"
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
    label: "Device UUID"
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
    description: "The number of mintes the meeting lasted"
    type: number
    sql: ${TABLE}.durationseconds/60 ;;
  }

  dimension: localtalktimeseconds {
    type: number
    sql: ${TABLE}.localtalktimeseconds ;;
  }

  dimension: location {
    hidden: yes
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: neithertalktimeseconds {
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
    description: "Whether presenter mode was enabled by admin setting"
    type: string
    sql: ${TABLE}.presenteradmin ;;
  }

  dimension: presenterseconds {
    description: "Seconds of meeting with presenter mode enabled"
    type: string
    sql: ${TABLE}.presenterseconds ;;
  }

  dimension: remotetalktimeseconds {
    type: number
    sql: ${TABLE}.remotetalktimeseconds ;;
  }

  dimension_group: startdate {
    label: "Meeting Start"
    description: "The date and time at which a meeting began"
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
    sql: ${TABLE}.waspaired ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: device_count {
    type: count_distinct
    drill_fields: [id]
    sql: ${TABLE}.deviceuuid;;
  }

  measure: avg_meeting_length_minutes {
    type: average
    drill_fields: [id]
    sql: ${TABLE}.durationminutes;;
  }


}
