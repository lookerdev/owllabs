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




  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: device_registration_user_company_view {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
