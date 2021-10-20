# This view includes distinct month/year combos, still from Jan 1900 to Dec 2049
view: dim_calendar_distinct {
  label: "Calendar Dates"
  sql_table_name: public.dim_calendar_distinct ;;


# DIMENSIONS
  dimension: primary_key {
    hidden: yes
    type: number
    sql: concat(${month},${year} ;;
  }

  dimension: month {
    label: "Month Number"
    # type: date
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: month_year {
    # type: date
    type: string
    sql: ${month_name} || ' ' || ${year};;
  }

  dimension: period_name{
    type: string
    sql: ${TABLE}.period_name ;;
  }

  dimension: quarter {
    label: "Quarter Number"
    type: number
    # type: date_fiscal_quarter
    sql: ${TABLE}.quarter ;;
  }

  dimension: quarter_name {
    type: string
    sql: case when ${TABLE}.quarter = 1 then 'Q1'
              when ${TABLE}.quarter = 2 then 'Q2'
              when ${TABLE}.quarter = 3 then 'Q3'
              when ${TABLE}.quarter = 4 then 'Q4'
              end;;
  }

  dimension: year {
    type: number
    # type: date
    sql: ${TABLE}.year ;;
  }



  measure: count {
    type: count
    drill_fields: [month_name]
  }
}
