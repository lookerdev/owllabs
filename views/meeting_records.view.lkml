view: meeting_records {
  sql_table_name: public.meeting_records ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
    type: string
    sql: ${TABLE}.crashinmeeting ;;
  }

  dimension_group: createdat {
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
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: durationseconds {
    type: number
    sql: ${TABLE}.durationseconds ;;
  }

  dimension: localtalktimeseconds {
    type: number
    sql: ${TABLE}.localtalktimeseconds ;;
  }

  dimension: location {
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
    type: number
    sql: ${TABLE}.personcount ;;
  }

  dimension: presenteradmin {
    type: string
    sql: ${TABLE}.presenteradmin ;;
  }

  dimension: presenterseconds {
    type: string
    sql: ${TABLE}.presenterseconds ;;
  }

  dimension: remotetalktimeseconds {
    type: number
    sql: ${TABLE}.remotetalktimeseconds ;;
  }

  dimension_group: startdate {
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
}
