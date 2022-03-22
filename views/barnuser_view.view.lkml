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
    description: "Names of companies to which devices have been registered"
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
    sql: ${TABLE}.createdate::timestamp ;;
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
