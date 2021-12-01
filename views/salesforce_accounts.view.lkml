view: salesforce_accounts {
  label: "Companies - IN TESTING"
  sql_table_name: public.salesforce_accounts_view ;;

  dimension: company_name {
    hidden: yes
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: company_size {
    type: string
    sql: ${TABLE}.company_size ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}.company_domain ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_group {
    # hidden: yes
    type: string
    sql: ${TABLE}.industry_group ;;
  }

  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.row_num ;;
  }

  dimension: devices_registered {
    label: "Count of Registered Devices per Company"
    description: "Number of registered devices per company"
    type: number
    sql: ${TABLE}.devices_registered ;;
  }


  dimension: devices_registered_bins {
    label: "Count of Registered Devices per Company - bins"
    description: "Number of registered devices per company, grouped into bins. 'Below 1' means the company has 0 devices regsitered, 'Undefined' means that the  "
    # label: "Count Devices Registered to Company"
    type: bin
    style: integer
    tiers: [1, 2, 5, 11, 21,]
    sql: ${devices_registered}  ;;
  }


## MEASURES
  # measure: count {
  #   hidden: yes
  #   type: count
  #   drill_fields: [company_name]
  # }

  # dimension: count_owls_per_company {
  #   type: number
  #   sql: count(distinct ${meeting_records.deviceuuid}) ;;
  #   tiers: []
  # }

}
