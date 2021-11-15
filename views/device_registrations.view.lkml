# The name of this view in Looker is "Device Registrations"
view: device_registrations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.device_registrations ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel ID" in Explore.

  dimension: channel_id {
    label: "Channel ID"
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: company_domain {
    label: "Company Email Domain"
    type: string
    sql: ${TABLE}.company_domain ;;
  }

  dimension: company_id {
    hidden: yes
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: company_name {
    description: "Name of company device is registered to"
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: device_hardware_serial_number {
    type: string
    sql: ${TABLE}.device_hardware_serial_number ;;
  }

  dimension: device_id {
    hidden: yes
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: deviceuuid {
    label: "DeviceUUID"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    description: "Type of product registered"
    type: string
    sql: ${TABLE}.product_name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: registration {
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
    sql: ${TABLE}.registration_date ;;
  }

  dimension: registration_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.registration_id ;;
  }

  dimension_group: registration_record_delete {
    description: "Deletion date of registration record"
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
    sql: ${TABLE}.registration_record_delete_date ;;
  }

  dimension_group: registration_record_lastupdate {
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
    sql: ${TABLE}.registration_record_lastupdate_date ;;
  }

  dimension: registration_source {
    hidden: yes
    type: number
    sql: ${TABLE}.registration_source ;;
  }

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name {
    description: "Name of user device is registered to"
    type: string
    sql: ${TABLE}.user_name ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    label: "Count Registrations"
    type: count
    drill_fields: [product_name, company_name, user_name]
  }

  measure: count_companies {
    label: "Count of Companies"
    type: count_distinct
    sql: ${company_id} ;;
  }

  # measure: devices_per_company {
  #   sql: ${meeting_records.count_devices} / ${count_companies} ;;
  # }
}
