view: salesforce_accounts {
  label: "Companies - IN TESTING"
  sql_table_name: public.salesforce_accounts ;;

  # dimension: company_name {
  #   type: string
  #   sql: ${TABLE}.company_name ;;
  # }

  dimension: company_size {
    type: string
    sql: ${TABLE}.company_size ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}.email_domain ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_group {
    hidden: yes
    type: string
    sql: ${TABLE}.industry_group ;;
  }

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.row_num ;;
  }

  # measure: count {
  #   hidden: yes
  #   type: count
  #   drill_fields: [company_name]
  # }
}
