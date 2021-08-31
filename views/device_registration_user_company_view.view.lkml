view: device_registration_user_company_view {
  label: "Device Registrations, Users, Comp"
  sql_table_name: public.device_registration_user_company_view ;;

  # # Dimensions
  dimension: registration_id {
    primary_key: yes
    label: "Registration ID"
    description: "Unique ID for device registration"
    type: number
    sql: ${TABLE}.registration_id ;;
  }

  dimension: device_id {
    label: "Device ID"
    hidden: yes
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: deviceuuid {
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: devicehardwareserial {
    label: "Device Hardware Serial Number"
    type: string
    sql: ${TABLE}.devicehardwareserial ;;
  }

  dimension_group: registration_date {
    label: "Device Registration Date"
    description: "Device registration date"
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

  dimension_group: deletedat {
    # hidden:  yes
    label: "Record Deletion Date"
    description: "Record deletion date"
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

  dimension: user_id {
    hidden: yes
    # label: "User ID"
  #   description: "Unique identifier for each user"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: company_id {
    hidden: yes
  #   label: "Company ID"
  #   description: "Unique identifier for each company"
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: user_name {
    label: "User Name"
    description: "Name of user"
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: company_name {
    label: "Company Name"
    # description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: email {
    label: "User Email"
    description: "User email address"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: domains {
    label: "User Email Domain"
    type: string
    sql: ${TABLE}.domains ;;
  }


  dimension_group: user_createdate {
    hidden:  yes
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
    sql: ${TABLE}.user_createdate ;;
  }


# Measures
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
}
