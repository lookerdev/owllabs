view: device_registrations {
  sql_table_name: public.device_registrations_view ;;

  dimension: channel_id {
    label: "Channel ID"
    # hidden: yes
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: company_domain {
    label: "Registered Email Domain"
    description: "Email domain that devices is registered to"
    type: string
    sql: ${TABLE}.company_domain ;;
  }

  dimension: company_id {
    label: "Company ID"
    # hidden: yes
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: sf_accounts_join_key {
    hidden: yes
    description: "this is what to use to join to salesforce_accounts. mostly domains, but has company name for gmail.com, comcast.net, and aol.com because of all the companies that use those domains"
    type: string
    sql: ${TABLE}.sf_accounts_join_key ;;
  }

  dimension: company_name {
    label: "Registered Company Name"
    description: "Name of company that device is registered to"
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: device_hardware_serial_number {
    type: string
    sql: ${TABLE}.device_hardware_serial_number ;;
  }

  dimension: device_id {
    label: "Device ID"
    # hidden: yes
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: deviceuuid {
    label: "DeviceUUID"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: email {
    label: "Registered Email Address"
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: product_id {
    label: "Product ID"
    # hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    hidden: yes
    description: "Type of product registered"
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension_group: registration {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.registration_date::timestamp ;;
  }

  # dimension: registration_id {
  #   primary_key: yes
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.registration_id ;;
  # }

  dimension: registration_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.registration_id ;;
  }


  # dimension_group: registration_record_delete {
  #   hidden: yes
  #   description: "Deletion date of registration record"
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.registration_record_delete_date::timestamp ;;
  # }

  dimension_group: registration_record_lastupdate {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.registration_record_lastupdate_date::timestamp ;;
  }

  dimension: source {
    hidden: yes
    description: "per Weihai - column needs to be vetted
    UNKNOWN: 0,
    USER_MOBILEAPP: 1,
    SHOPIFY: 2 = not working for now,
    BARN: 3 =  when we add the registration in barn,
    BARN_TRANSFER: 4 = user claim an owl that's already own by someone in a different organization,
    USER_FLAMINGO: 5 = mhq i believe"
    type: number
    sql: ${TABLE}.source ;;
  }

  dimension: source_value {
    hidden: yes
    type: string
    sql: ${TABLE}.source_value ;;
  }

  dimension: user_id {
    label: "User ID"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name {
    description: "Name of user device is registered to"
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: warranty_status {
    description: "Warranty status is Active if within 2 years of registration date"
    type: string
    sql: case when dateadd(year,2,${registration_date}) <= sysdate then 'Warranty Inactive'
         when ${registration_date} is null then 'Not Registered'
         else 'Warranty Active'
         end ;;
  }




  # MEASURES

  # measure: count {
  #   label: "Count of Registrations"
  #   type: count
  #   drill_fields: [product_name, company_name, user_name]
  # }

  measure: count_companies {
    hidden: yes
    label: "Count of Registered Companies"
    type: count_distinct
    sql: ${company_id} ;;
  }

  measure: count_domain {
    label: "Count of Registered Email Domains"
    type: count_distinct
    sql: ${company_domain} ;;
  }

  measure: count_registered_devices {
    label: "Count of Registered Devices"
    type: count_distinct
    sql: ${deviceuuid} ;;
  }

  measure: avg_owls_per_company {
    label: "Avg. Owls Registered per Company"
    type: number
    value_format: "0.0"
    sql: count(distinct ${deviceuuid}) * 1.0/ count(distinct ${company_domain}) ;;
  }

  measure: count_registrations {
    label: "Count of Registrations"
    description: "It is possible for a single deviceuuid to have more than one registration record associated."
    type: count
  }


  # measure: devices_per_company {
  #   sql: ${meeting_records.count_devices} / ${count_companies} ;;
  # }
}
