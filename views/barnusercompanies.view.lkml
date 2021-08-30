view: barnusercompanies {
  label: "Barn Companies"
  sql_table_name: public.barnusercompanies ;;

# Dimensions
  dimension: id {
    primary_key: yes
    label: "Company ID"
    # description: "join to user view"
    type: number
    sql: ${TABLE}.id;;
  }

  dimension_group: createdat {
    label: "Company Record Created"
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

  dimension: domains {
    label: "Company Email Domain"
    type: string
    sql: ${TABLE}.domains ;;
  }

  dimension: name {
    label: "Company Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: updatedat {
    hidden: yes
    label: "Company Record Updated"
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

# Measures
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}
