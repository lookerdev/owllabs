view: devices_owl_connnect_usage {
  sql_table_name: owlbarn_views.devices_v ;;
  label: "Owl Connect Usage Summary"

  dimension: device_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: deviceuuid {
    hidden: yes
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: pairedasprimary {
    label: "Ever Paired as Primary Device?"
    description: "If device has ever participated in a paired meeting as the primary device"
    type: yesno
    sql: ${firstowlconnectasprimary} is not null ;;
  }

  dimension: pairedassecondary {
    label: "Ever Paired as Secondary Device?"
    description: "If device has ever participated in a paired meeting as a secondary device"
    type: yesno
    sql: ${firstowlconnectassecondary} is not null ;;
  }

  dimension: pairedasany {
    label: "Ever Paired in Any Role?"
    description: "If the device has ever participated in a paired meeting in any capacity, regardless of device role"
    type: yesno
    sql: coalesce(${firstowlconnectasprimary}, ${firstowlconnectassecondary}) is not null ;;
  }


  dimension: firstowlconnectasprimary {
    label: "1st Paired Meeting Date as Primary Device"
    description: "Device's first date in a paired meeting as the primary device, if applicable"
    type: date_time
    sql: ${TABLE}.firstowlconnectasprimary ;;
  }

  dimension: firstowlconnectassecondary {
    label: "1st Paired Meeting Date as Secondary Device"
    description: "Device's first date in a paired meeting as a secondary device, if applicable"
    type: date_time
    sql: ${TABLE}.firstowlconnectassecondary ;;
  }

  dimension: firstpairedasany {
    label: "1st Paired Meeting Date"
    description: "Device's first date in a paired meeting as primary or secondary device, if applicable"
    type: date_time
    sql: coalesce(cast(${firstowlconnectasprimary} as timestamp), cast(${firstowlconnectassecondary} as timestamp)) ;;
  }

# from reg to which date?
  dimension: days_registration_to_paired_mtg {
    hidden: yes
    label: "Days from Registration to First Paired Meeting"
    type: number
    sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
  }



  # https://community.looker.com/lookml-5/creating-a-type-count-measure-for-non-primary-keys-1163
  measure: count_firstpairedasany {
    label: "Count of Devices Ever Paired"
    description: "Total number of devices that have had at least one paired meeting as primary or secondary device"
    type: count
    filters: [firstpairedasany: "-NULL"]
  }



  measure: avg_days_registration_to_paired_mtg {
    hidden: yes
    label: "Avg. Days from Registration to First Paired Meeting"
    type: average
    # value_format: "0" # round to how many decimals?
    sql: ${days_registration_to_paired_mtg} ;;
  }


  measure: sum_daydiff {
    hidden: yes
    type: sum
    sql: ${days_registration_to_paired_mtg} ;;
  }


}
