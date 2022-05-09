view: device_checkins {
  label: "Device Check-ins"
  sql_table_name: public.device_checkins ;;

# Dimensions
  dimension: id {
    label: "Check-in ID"
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: analyticsrecords {
    hidden: yes
    # description: ""
    type: number
    sql: ${TABLE}.analyticsrecords ;;
  }

  dimension_group: createdat {
    label: "Check-in"
    description: "Device check-in date and time"
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
    sql: ${TABLE}.createdat::timestamp ;;
  }

  dimension: deviceuuid {
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: needsupdate {
    label: "Needs Update"
    description: "Whether the device software version needs be updated to match the most recently released version"
    type: yesno
    sql: ${TABLE}.needsupdate ;;
  }

  dimension: softwareversion {
    label: "Software Version (integer)"
    # description: ""
    type: number
    value_format: "0"
    sql: ${TABLE}.softwareversion ;;
  }

  dimension_group: updatedat {
    hidden: yes
    # description: ""
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

# Measures

  measure: device_count {
    label: "Count of Devices"
    description: "Count of unique deviceuuid"
    type: count_distinct
    sql: ${deviceuuid} ;;
    # drill_fields: [device_id, uuid, device_name, product_name, channel_name]
  }

  measure: checkin_count {
    label: "Count of Check-ins"
    type: count_distinct
    sql: ${id} ;;
  }

}
