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
    # hidden: yes
    type: string
    sql: ${TABLE}.month_name ;;
  }

  # dimension: month_name_date_convert {
  #   # this doesn't work, turns the whole date into just a month so there is a repeated month for each year
  #   label: "Month Name (date)"
  #   sql: ${date_convert} ;;
  #   html: {{ rendered_value | date: "%B" }} ;;
  # }

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

  dimension: month_year_date_convert {
    # this is a date so can sort
    label: "Month Year"
    sql: ${date_convert} ;;
    html: {{ rendered_value | date: "%B %Y" }} ;;
  }

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

  dimension: date_convert {
    hidden: yes
    description: "year-month cast as date. Use this column to filter the dates from this table that are included. This column converts year-month to date."
    sql: to_date(year || '-' || month, 'YYYY-MM') ;;
  }



  # measure: count {
  #   type: count
  #   drill_fields: [month_name]
  # }
}
