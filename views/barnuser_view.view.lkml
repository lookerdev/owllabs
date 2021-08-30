view: barnuser_view {
  label: "Barn Users"
sql_table_name: public.barnuser_view ;;

# Dimensions

  dimension: user_id {
    primary_key: yes
    hidden: yes
    label: "User ID"
    description: "Unique ID for each user that has registered a device"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: company_id {
    hidden: yes
    label: "Company ID"
    description: "Unique ID for each company"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: company_name {
    label: "Company Name"
    # description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension_group: createdate {
    hidden: yes
    # label: "User Created"
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
    sql: ${TABLE}.createdate ;;
  }

  dimension: domains {
    hidden: yes
    label: "Email Domain"
    # description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.domains ;;
  }

  dimension: email {
    label: "Email Address"
    # description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: user_name {
    label: "Name"
    # description: "Name of the user entered during registration"
    type: string
    sql: ${TABLE}.email ;;
  }

# Measures
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: barnuser_view {
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
