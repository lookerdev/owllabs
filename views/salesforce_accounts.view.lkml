view: salesforce_accounts {
  label: "Salesforce Accounts"
  sql_table_name: salesforce.salesforce_accounts_view ;;


  dimension: accountid {
    label: "Account ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: company_name {
    # description: "Salesforce Account "
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: email_domain {
    # description: "Salesforce Account email domain. This field is used to pair appropriate Salesforce Account to device registration information."
    # These fields are pulled from Salesforce based on the registration domain for each device.
    type: string
    sql: ${TABLE}.company_domain_name_c ;;
  }

  dimension: industry {
    # description: "Granular company categorization"
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_group {
    label: "Deprecated Industry Group"
    # description: "Previou picklist field. High-level/broad grouping of Industry"
    type: string
    sql: coalesce(${TABLE}.industry_group, 'Unknown') ;;
  }

  dimension: industry_recordgroup  {
    label: "Industry Group"
    type: string
    sql: ${TABLE}.industry_recordgroup ;;

  }

  dimension: company_size {
    type: string
    sql: ${TABLE}.company_size ;;
  }

  dimension: device_registrations_join_key {
    hidden: yes
    description: "this is what to use to join to device_registrations. mostly domains, but has company name for gmail.com, comcast.net, and aol.com because of all the companies that use those domains"
    type: string
    sql: ${TABLE}.registrations_joinkey ;;
  }

  dimension: priority {
    hidden: yes
    # this is the ROW_NUMBER priority ranking based on industry, industry group, company size values. higher ranked dupe records are selected
    type: number
    sql: ${TABLE}.priority ;;
  }

# # move to Salesforce Accounts view
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

  # dimension: count_owls_per_company {
  #   type: number
  #   sql: count(distinct ${meeting_records.deviceuuid}) ;;
  #   tiers: []
  # }


## MEASURES
  # measure: count {
  #   hidden: yes
  #   type: count
  #   drill_fields: [company_name]
  # }

  measure: count_companies {
    label: "Count of Companies"
    type: count_distinct
    sql: ${accountid} ;;
    drill_fields: [accountid, company_name, industry, industry_group]
  }

  measure: count_domain {
    hidden: yes
    type: count_distinct
    sql: ${email_domain} ;;
  }


  }
