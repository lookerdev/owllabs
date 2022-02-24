view: rhapsody_sw_version_download_tracking {
  label: "Rhapsody Software Download Tracking"
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: with a as (
        --last download for all devices before Rhapsody sw versions
        select
        RANK () over (partition by dd.deviceuuid ORDER BY dd.software_release_version_number desc, createdat desc) as rnk,
        dd.deviceuuid,
        dd.software_release_version_number,
        dd.software_release_version,
        dd.createdat
        from public.deviceupdatesdownloads_view dd
        where dd.software_release_version_number < 4000000 /*sw rev we care about*/
        and dd.software_release_version_number > 1000000 /*filters out uat versions*/
        ),
        b as (
        --first download for all devices into Rhapsody sw versions
        select
        RANK () over (partition by dd.deviceuuid ORDER BY dd.software_release_version_number asc, createdat desc) as rnk,
        dd.deviceuuid,
        dd.software_release_version_number,
        dd.software_release_version,
        dd.createdat
        from public.deviceupdatesdownloads_view dd
        where dd.software_release_version_number >= 4000000 /*sw rev we care about (rhapsody)*/--4.8.x.x
        and dd.software_release_version_number < 8888888 /*filters out uat versions*/
        )
        select
        a.deviceuuid,
        a.software_release_version_number as pre_last_software_version_num,
        a.software_release_version as pre_last_software_version,
        a.createdat as pre_last_software_version_download_date,
        b.software_release_version_number as post_first_software_version_num,
        b.software_release_version as post_first_software_version,
        b.createdat as post_first_software_version_download_date,
        dv.product_name,
        dv.channel_category,
        dv.channel_name
        from a
        left join b
          on a.deviceuuid = b.deviceuuid
          and b.rnk = 1
        left join public.devices_view dv
          on a.deviceuuid = dv.deviceuuid
        where a.rnk = 1
          and b.deviceuuid is not null
          --and dv.product_name in ('Meeting Owl 3','Meeting Owl Pro','Source Next Owl Pro')
          --and dv.channel_category = 'Public'
        ;;
  }


#   # Define your dimensions and measures here, like this:
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${deviceuuid},${post_first_software_version_num})  ;;
  }

  dimension: deviceuuid {
    label: "Device UUID"
    # description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: post_first_software_version_num {
    hidden: yes
    label: "First Rhapsody Version Number (Integer)"
    description: "First Rhapsody version (integer) downloaded for each device"
    type: number
    sql: ${TABLE}.post_first_software_version_num ;;
  }

  dimension: post_first_software_version {
    label: "First Rhapsody Version Number (Decimal Expansion)"
    description: "First Rhapsody version (decimal expansion) downloaded for each device"
    type: string
    sql: ${TABLE}.post_first_software_version ;;
    drill_fields: [deviceuuid]
  }

  dimension_group: post_first_software_version_download_date {
    label: "Download"
    description: "The date of the first successful Rhapsody software version download"
    type: time
    timeframes: [date, week, month, year, hour]
    # hour_of_day = 1-24, no date
    # time_of_day = hour:minute, no date
    # time = sepecific datetime (yyyy-mm-dd hour:minute:second)
    sql: ${TABLE}.post_first_software_version_download_date ;;
    drill_fields: [deviceuuid]
  }

  # dimension: pre_last_software_version_num {
  #   description: "Last software version (integer) downloaded before Rhapsody version for each device"
  #   type: number
  #   sql: ${TABLE}.pre_last_software_version_num ;;
  # }

  # dimension: pre_last_software_version {
  #   description: "Last software version (decimal expansion) downloaded before Rhapsody version for each device"
  #   type: string
  #   sql: ${TABLE}.pre_last_software_version ;;
  # }

  # dimension_group: pre_last_software_version_download_date {
  #   label: "Download"
  #   description: "The date of the last successful software version download before any Rhapsody versions"
  #   type: time
  #   timeframes: [date, week, month, year, time_of_day, time]
  #   sql: ${TABLE}.pre_last_software_version_download_date ;;
  # }

  dimension: product_name {
    label: "Device Type"
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: channel_category {
    type: string
    sql: ${TABLE}.channel_category ;;
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
  }


  measure: count_deviceuuid {
    label: "Count of Devices"
    description: "Number of devices that have downloaded"
    type: count_distinct
    sql: ${deviceuuid} ;;
  }

}
