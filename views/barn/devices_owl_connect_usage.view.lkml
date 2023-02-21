view: devices_owl_connnect_usage {
  sql_table_name: owlbarn_views.devices_v ;;

  dimension: device_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: deviceuuid {
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension_group: firstowlconnectasprimary {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.firstowlconnectasprimary ;;
  }

  dimension_group: firstowlconnectassecondary {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.firstowlconnectassecondary ;;
  }

## OWL CONNECT USAGE
  dimension: firstowlconnectasprimary {
    # hidden: yes
    label: "Date of First Paired Meeting as Primary Device"
    group_label: "Owl Connect"
    description: "Device's first date in a paired meeting as the primary device"
    type: date_time
    sql: ${TABLE}.firstowlconnectasprimary ;;
  }

  dimension: pairedasprimary {
    # hidden: yes
    label: "Ever Paired as Primary Device?"
    group_label: "Owl Connect"
    description: "If device has ever participated in a paired meeting as the primary device"
    type: yesno
    sql: ${firstowlconnectasprimary} is not null ;;
  }

  dimension: firstowlconnectassecondary {
    # hidden: yes
    label: "Date of First Paired Meeting as Secondary Device"
    group_label: "Owl Connect"
    description: "Device's first date in a paired meeting connected to the primary device, with role other than primary"
    type: date_time
    sql: ${TABLE}.firstowlconnectassecondary ;;
  }

  dimension: pairedassecondary {
    # hidden: yes
    label: "Ever Paired as Secondary Device?"
    group_label: "Owl Connect"
    description: "If device has ever participated in a paired meeting as a device connected to the primary device/as any device other than Primary"
    type: yesno
    sql: ${firstowlconnectassecondary} is not null ;;
  }

  dimension: pairedasany {
    label: "Ever Paired in Any Role?"
    group_label: "Owl Connect"
    description: "If the device has ever participated in a paired meeting in any capacity, regardless of device role"
    type: yesno
    sql: coalesce(${firstowlconnectasprimary}, ${firstowlconnectassecondary}) is not null ;;
  }

  dimension: firstpairedasany {
    label: "Date of First Paired Meeting in Any Role"
    group_label: "Owl Connect"
    # description: "If the device has ever participated in a paired meeting in any capacity, regardless of device role"
    type: date_time
    sql: coalesce(cast(${firstowlconnectasprimary} as timestamp), cast(${firstowlconnectassecondary} as timestamp)) ;;
  }

  dimension: days_registration_to_paired_mtg {
    # label: "Days from Registration to First Paired Meeting"
    type: number
    sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
    # round to how many decimals?
  }

  measure: avg_days_registration_to_paired_mtg {
    label: "Avg. Days from Registration to First Paired Meeting"
    type: average
    sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
    # round to how many decimals?
  }

  measure: avg_days_registration_to_paired_mtg2 {
    # label: "Avg. Days from Registration to First Paired Meeting"
    type: average_distinct
    sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
    # round to how many decimals?
  }

  measure: avg_days_registration_to_paired_mtg3 {
    # label: "Avg. Days from Registration to First Paired Meeting"
    type: number
    sql: sum(${days_registration_to_paired_mtg})/count(${deviceuuid})
      ;;
    # round to how many decimals?
  }


}
