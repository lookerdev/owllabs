view: device_checkins {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: public.device_checkins ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: id {
    primary_key: yes
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: deviceuuid {
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: needsupdate {
    label: "Needs Update"
    description: "Whether the device software version needs be updated to match the most recent version"
    type: yesno
    sql: ${TABLE}.needsupdate ;;
  }

  dimension: softwareversion {
    label: "Software Version"
    # description: ""
    type: number
    sql: ${TABLE}.softwareversion ;;
  }

  dimension_group: updatedat {
    hidden: yes
    # description: ""
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


  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}
