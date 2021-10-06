# The name of this view in Looker is "Revenue Report Dimensions"
view: revenue_report_dimensions {
  sql_table_name: public.revenue_report_dimensions ;;


  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
  }

  dimension: row_num {
    primary_key: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }
}
