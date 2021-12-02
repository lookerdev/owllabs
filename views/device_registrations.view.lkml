# The name of this view in Looker is "Device Registrations"
view: device_registrations {
  sql_table_name: public.device_registrations ;;

  dimension: channel_id {
    label: "Channel ID"
    hidden: yes
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: company_domain {
    label: "Registration Email Domain"
    description: "Email domain that devices is registered to"
    type: string
    sql: ${TABLE}.company_domain ;;
  }

  dimension: company_id {
    hidden: yes
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: sf_accounts_join_key {
    hidden: yes
    description: "this is what to use to join to salesforce_accounts. mostly domains, but has company name for gmail.com, comcast.net, and aol.com because of all the companies that use those domains"
    type: string
    sql: ${TABLE}.sf_accounts_join_key ;;
  }


  dimension: company_name {
    label: "Registeration Company Name"
    description: "Name of company that device is registered to"
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
    hidden: yes
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

  # measure: count {
  #   label: "Count of Registrations"
  #   type: count
  #   drill_fields: [product_name, company_name, user_name]
  # }

  measure: count_companies {
    hidden: yes
    label: "Count of Company"
    type: count_distinct
    sql: ${company_id} ;;
  }

  measure: count_domain {
    label: "Count of Registered Email Domain"
    type: count_distinct
    sql: ${company_domain} ;;
  }

  measure: count_registered_devices {
    label: "Count of Total Registered Devices"
    type: count_distinct
    sql: ${deviceuuid} ;;
  }

  measure: avg_owls_per_company {
    label: "Avg. Owls Registered per Company"
    type: number
    value_format: "0.0"
    sql: count(distinct ${deviceuuid}) * 1.0/ count(distinct ${company_domain}) ;;
  }


  # measure: devices_per_company {
  #   sql: ${meeting_records.count_devices} / ${count_companies} ;;
  # }
}
