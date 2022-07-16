view: salesforce_accounts {
  label: "Salesforce Account Information"
  sql_table_name: public.salesforce_accounts_view ;;

  dimension: company_name {
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

  dimension: device_registrations_join_key {
    hidden: yes
    description: "this is what to use to join to device_registrations. mostly domains, but has company name for gmail.com, comcast.net, and aol.com because of all the companies that use those domains"
    type: string
    sql: ${TABLE}.device_registrations_join_key ;;
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
    hidden: yes
    label: "# Registered Devices per Company"
    description: "Number of registered devices per company"
    type: number
    sql: ${TABLE}.devices_registered ;;
  }


  dimension: devices_registered_bins {
    hidden: yes
    label: "# Registered Devices per Company - bins"
    description: "Number of registered devices per company, grouped into bins."
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
