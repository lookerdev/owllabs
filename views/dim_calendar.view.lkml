view: dim_calendar {
  label: "Calendar Dates"
  sql_table_name: public.dim_calendar ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: day {
    label: "Day Number"
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: day_name {
    label: "Day Name"
    type: string
    sql: ${TABLE}.day_name ;;
  }

  dimension: holiday_flag {
    label: "Is Holiday?"
    type: yesno
    sql: ${TABLE}.holiday_flag ;;
  }

  dimension: month {
    label: "Month Number"
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }


  dimension: quarter {
    label: "Quarter Number"
    type: number
    sql: ${TABLE}.quarter ;;
  }

  dimension: week {
    label: "Week Number"
    type: number
    sql: ${TABLE}.week ;;
  }

  dimension: weekend_flag {
    label: "Is Weekend?"
    type: yesno
    sql: ${TABLE}.weekend_flag ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [id, month_name, day_name]
  # }

  measure: count_days {
    type: count_distinct
    sql: ${day} ;;
  }

  measure: count_weeks {
    type: count_distinct
    sql: ${week} ;;
  }

    measure: count_years {
    type: count_distinct
    sql: ${year} ;;
  }

}
