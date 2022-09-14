view: most_recent_update_attempt {
  label: "Device Most Recent Software Update Attempt"
  sql_table_name: public.most_recent_update_attempt ;;
  # drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: createdat {
    label: "Most Recent Update Attempt"
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
    label: "DeviceUUID"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: row_num {
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: software_release_version {
    label: "Attempted Software Version"
    type: string
    sql: ${TABLE}.software_release_version ;;
  }

  dimension: software_release_version_number {
    label: "Attempted Software Version (integer)"
    type: number
    value_format: "0"
    sql: ${TABLE}.software_release_version_number ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}