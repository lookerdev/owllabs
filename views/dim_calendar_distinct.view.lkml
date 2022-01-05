# This view includes distinct month/year combos, still from Jan 1900 to Dec 2049
view: dim_calendar_distinct {
  label: "Accounting Period"
  sql_table_name: public.dim_calendar_distinct ;;


# DIMENSIONS
  dimension: primary_key {
    hidden: yes
    type: number
    sql: concat(${month},${year}) ;;
  }

  dimension: month {
    label: "Month Number"
    # type: date
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: month_name {
    # label: "Month"
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: month_year {
    # type: date
    type: string
    sql: ${month_name} || ' ' || ${year};;
  }

  dimension: period_name{
    # hidden: yes
    type: string
    sql: ${TABLE}.period_name ;;
  }

  dimension: quarter {
    hidden: yes
    label: "Quarter Number"
    type: number
    # type: date_fiscal_quarter
    sql: ${TABLE}.quarter ;;
  }

  dimension: quarter_name {
    # label: "Quarter"
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

  dimension: date_convert {
    hidden: yes
    description: "Use this column to filter the dates from this table that are included. This column converts year-month to date."
    sql: to_date(year || '-' || month, 'YYYY-MM') ;;
  }


  # measure: count {
  #   type: count
  #   drill_fields: [month_name]
  # }
}
