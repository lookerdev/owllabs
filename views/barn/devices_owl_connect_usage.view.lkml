view: devices_owl_connnect_usage {
  sql_table_name: owlbarn_views.devices_v ;;
  label: "Owl Connect Usage"

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

  # dimension_group: firstowlconnectasprimary {
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
  #   sql: ${TABLE}.firstowlconnectasprimary ;;
  # }

  # dimension_group: firstowlconnectassecondary {
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
  #   sql: ${TABLE}.firstowlconnectassecondary ;;
  # }

## OWL CONNECT USAGE
  dimension: firstowlconnectasprimary {
    # hidden: yes
    label: "First Paired Meeting Date as Primary Device"
    description: "Device's first date in a paired meeting as the primary device"
    type: date_time
    sql: ${TABLE}.firstowlconnectasprimary ;;
  }

  dimension: pairedasprimary {
    # hidden: yes
    label: "Ever Paired as Primary Device?"
    description: "If device has ever participated in a paired meeting as the primary device"
    type: yesno
    sql: ${firstowlconnectasprimary} is not null ;;
  }

  dimension: firstowlconnectassecondary {
    # hidden: yes
    label: "First Paired Meeting Date as Secondary Device"
    description: "Device's first date in a paired meeting connected to the primary device/with role other than primary"
    type: date_time
    sql: ${TABLE}.firstowlconnectassecondary ;;
  }

  dimension: pairedassecondary {
    # hidden: yes
    label: "Ever Paired as Secondary Device?"
    description: "If device has ever participated in a paired meeting as a device connected to the primary device/as any device other than Primary"
    type: yesno
    sql: ${firstowlconnectassecondary} is not null ;;
  }

  dimension: firstpairedasany {
    label: "First Paired Meeting Date in Any Role"
    description: "If the device has ever participated in a paired meeting in any capacity, regardless of device role"
    type: date_time
    sql: coalesce(cast(${firstowlconnectasprimary} as timestamp), cast(${firstowlconnectassecondary} as timestamp)) ;;
  }

  dimension: pairedasany {
    label: "Ever Paired in Any Role?"
    description: "If the device has ever participated in a paired meeting in any capacity, regardless of device role"
    type: yesno
    sql: coalesce(${firstowlconnectasprimary}, ${firstowlconnectassecondary}) is not null ;;
  }

  dimension: days_registration_to_paired_mtg {
    hidden: yes
    # label: "Days from Registration to First Paired Meeting"
    type: number
    sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
    # round to how many decimals?
  }

  measure: avg_days_registration_to_paired_mtg {
    hidden: yes
    label: "Avg. Days from Registration to First Paired Meeting"
    type: average
    sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
    # round to how many decimals?
  }

  measure: avg_days_registration_to_paired_mtg2 {
    hidden: yes
    # label: "Avg. Days from Registration to First Paired Meeting"
    type: average_distinct
    sql: DATEDIFF(days, cast(${device_registrations.registration_date} as timestamp),cast(${firstpairedasany} as timestamp)) ;;
    # round to how many decimals?
  }

  measure: avg_days_registration_to_paired_mtg3 {
    hidden: yes
    # label: "Avg. Days from Registration to First Paired Meeting"
    type: number
    sql: sum(${days_registration_to_paired_mtg}) * 1.0 / count(${deviceuuid})
      ;;
    # round to how many decimals?
  }

measure: sum_daydiff {
  hidden: yes
  type: sum
  sql: ${days_registration_to_paired_mtg} ;;
}

}
