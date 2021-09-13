view: dim_calendar {
  sql_table_name: public.dim_calendar ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
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
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: day_name {
    type: string
    sql: ${TABLE}.day_name ;;
  }

  dimension: holiday_flag {
    type: yesno
    sql: ${TABLE}.holiday_flag ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
  }

  dimension: weekend_flag {
    type: yesno
    sql: ${TABLE}.weekend_flag ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [id, month_name, day_name]
  }
}
