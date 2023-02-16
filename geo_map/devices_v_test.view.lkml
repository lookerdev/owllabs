# The name of this view in Looker is "Devices V Test"
view: devices_v_test {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: test.devices_v_test ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.


  dimension: bootloaderversion {
    type: string
    sql: ${TABLE}.bootloaderversion ;;
  }

  dimension: bruinlastconnectto {
    type: string
    sql: ${TABLE}.bruinlastconnectto ;;
  }

  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
  }


  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: device_activation {
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
    sql: ${TABLE}.device_activation_date ;;
  }

  dimension: device_alias {
    type: string
    sql: ${TABLE}.device_alias ;;
  }

  dimension: device_hardware_serial_number {
    type: string
    sql: ${TABLE}.device_hardware_serial_number ;;
  }

  dimension: device_hardware_version {
    type: string
    sql: ${TABLE}.device_hardware_version ;;
  }

  dimension: device_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension_group: device_last_checkin {
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
    sql: ${TABLE}.device_last_checkin_date ;;
  }

  dimension: device_last_ip_address {
    type: string
    sql: ${TABLE}.device_last_ip_address ;;
  }

  dimension: device_last_location {
    type: string
    sql: ${TABLE}.device_last_location ;;
  }

  dimension: device_name {
    type: string
    sql: ${TABLE}.device_name ;;
  }

  dimension: device_parent_settings {
    type: string
    sql: ${TABLE}.device_parent_settings ;;
  }

  dimension: device_pcb_version {
    type: number
    sql: ${TABLE}.device_pcb_version ;;
  }

  dimension_group: device_record_create {
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
    sql: ${TABLE}.device_record_create_date ;;
  }

  dimension: device_serial_number {
    type: string
    sql: ${TABLE}.device_serial_number ;;
  }

  dimension: device_settings {
    type: string
    sql: ${TABLE}.device_settings ;;
  }

  dimension: device_software_version {
    type: string
    sql: ${TABLE}.device_software_version ;;
  }

  dimension: device_software_version_number {
    type: number
    sql: ${TABLE}.device_software_version_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_device_software_version_number {
    type: sum
    sql: ${device_software_version_number} ;;
  }

  measure: average_device_software_version_number {
    type: average
    sql: ${device_software_version_number} ;;
  }

  dimension: device_status {
    type: number
    sql: ${TABLE}.device_status ;;
  }

  dimension: device_status_text {
    type: string
    sql: ${TABLE}.device_status_text ;;
  }

  dimension: deviceuuid {
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension_group: first_owl_connect_meeting_date_longer_than_5_mins {
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
    sql: ${TABLE}.first_owl_connect_meeting_date_longer_than_5_mins ;;
  }

  dimension: lastconnectedbruinstatus {
    type: yesno
    sql: ${TABLE}.lastconnectedbruinstatus ;;
  }

  dimension_group: lastconnectedbruintime {
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
    sql: ${TABLE}.lastconnectedbruintime ;;
  }

  dimension: lastgeo {
    group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo ;;
  }

  dimension: lastgeo_city {
    group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_city ;;
  }

  dimension: lastgeo_country {
    group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_country ;;
  }

  dimension: lastgeo_latitude {
    group_label: "Last Geo"
    type: number
    sql: ${TABLE}.lastgeo_latitude ;;
  }

  dimension: lastgeo_longitude {
    group_label: "Last Geo"
    type: number
    sql: ${TABLE}.lastgeo_longitude ;;
  }

  dimension: lastgeo_region {
    group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_region ;;
  }

  dimension: lastgeo_timezone {
    group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_timezone ;;
  }

  dimension: location {
    group_label: "Last Geo"
    type: location
    # sql_latitude:round(${lastgeo_latitude},2) ;;
    # sql_longitude:round(${lastgeo_longitude},2) ;;
    sql_latitude:${lastgeo_latitude} ;;
    sql_longitude:${lastgeo_longitude} ;;
  }

  dimension: macaddress {
    type: string
    sql: ${TABLE}.macaddress ;;
  }

  dimension_group: most_recent_meeting {
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
    sql: ${TABLE}.most_recent_meeting_date ;;
  }

  dimension: most_recent_meeting_length_seconds {
    type: number
    sql: ${TABLE}.most_recent_meeting_length_seconds ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: record_source {
    type: string
    sql: ${TABLE}.record_source ;;
  }

  dimension_group: retiredat {
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
    sql: ${TABLE}.retiredat ;;
  }

  dimension: settings_timestamp {
    type: number
    sql: ${TABLE}.settings_timestamp ;;
  }

  dimension: settings_version {
    type: number
    sql: ${TABLE}.settings_version ;;
  }

  dimension: software_version_family {
    type: number
    sql: ${TABLE}.software_version_family ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }

  dimension: country_shortname {
    type: string
    sql: ${TABLE}.country_shortname ;;
  }

  dimension: iso2 {
    type: string
    sql: ${TABLE}.iso2 ;;
  }

  dimension: iso3 {
    type: string
    sql: ${TABLE}.iso3 ;;
    map_layer_name: world_countries_layer
  }


  measure: count {
    type: count
    drill_fields: [product_name, device_name]
  }
}
