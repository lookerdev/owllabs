view: userdeviceregistrations {
  label: "User Device Registrations"
  sql_table_name: public.userdeviceregistrations ;;
  drill_fields: [id]

  # Dimensions
  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: createdat {
    label: "Device Registration"
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

  dimension_group: deletedat {
    # filter out records that have a deletion date
    # capture the number of device registrations that have been deleted?
    hidden: yes
    description: "Device Registration Record Deletion Date"
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
    sql: ${TABLE}.deletedat ;;
   }

  dimension: devicehardwareserial {
    type: string
    label: "Hardware Serial Number"
    sql: ${TABLE}.devicehardwareserial ;;
  }

  dimension: deviceid {
    type: number
    sql: ${TABLE}.deviceid ;;
  }

  dimension: deviceuuid {
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: source {
    hidden: yes
    type: number
    sql: ${TABLE}.source ;;
  }

  dimension: userid {
    label: "User ID"
    type: number
    sql: ${TABLE}.userid ;;
  }

# Measures
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}
