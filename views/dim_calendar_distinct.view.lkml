# This view includes distinct month/year combos, still from Jan 1900 to Dec 2049
view: dim_calendar_distinct {
  label: "Calendar Dates"
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
    # hidden: yes
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: month_year {
    # not a date, can't sort properly
    hidden: yes
    type: string
    sql: ${month_name} || ' ' || ${year};;
  }

  dimension: month_num_year {
    hidden: yes
    type: string
    sql: ${month} || ' ' || ${year} ;;
  }

  dimension: date_convert {
    hidden: yes
    description: "Year-Month cast as date. Use this column to filter the dates from this table that are included. This column converts year-month to date."
    type: date_month
    sql: to_date(${TABLE}.year || '-' || ${TABLE}.month, 'YYYY-MM') ;;
    # value_format: "%b %Y"
    html: {{ rendered_value }} ;;
  }

  dimension: month_year_date_convert {
    # this is a date so can sort
    label: "Month-Year"
    type: date_month
    sql: to_date(${TABLE}.year || '-' || ${TABLE}.month, 'YYYY-MM') ;;
    # html: {{ rendered_value | date: "%b %Y" }} ;;
  }

# CREATE A QUARTER-YEAR DATE DIMENSION - NEITHER OF THESE OPTIONS WORK

  # dimension: quarter_year_date_convert {
  #   # this is a date so can sort
  #   label: "Quarter-Year"
  #   type: date_quarter
  #   # sql: to_date(${TABLE}.year || '-' || ${TABLE}.quarter, 'YYYY-Q') ;;
  #   sql: ${month_year_date_convert} ;;
  #   # html: {{ rendered_value | date: "%b %Y" }} ;;
  # }

  # dimension: quarter_year {
  #   label: "Quarter-Year"
  #   # type: string
  #   sql: ${year} || '-' || ${quarter_name} ;;
  #   # html: {{ rendered_value | date: "%b %Y" }} ;;
  # }

  dimension: period_name{
    hidden: yes
    label: "Accounting Period"
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
    label: "Quarter"
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



  # measure: count {
  #   type: count
  #   drill_fields: [month_name]
  # }
}
