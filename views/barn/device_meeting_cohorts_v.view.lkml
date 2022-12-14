view: device_meeting_cohorts_v {
  label: "Meeting Cohorts"
  sql_table_name: owlbarn_views.device_meeting_cohorts_v ;;

  dimension: deviceuuid {
    primary_key: yes
    label: "DeviceUUID"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: mtg_cohort {
    label: "Meeting Cohort"
    description: "Based on a device's meeting date(s): A) before August 2020, B) between August 2020 and June 2021, C) after June 2021. It is possible for a device to belong to more than one cohort. A device without a cohort does not fall into these categories.
    "
    type: string
    sql: ${TABLE}.mtg_cohort ;;
  }

  measure: count_deviceuuid {
    type: count_distinct
    sql: ${deviceuuid} ;;
    # drill_fields: []
  }
}
