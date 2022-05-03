include: "device_view.view"
view: device_extend_test {
  extends: [device_view]

  measure: device_count_test {
    # label: "Count of Devices"
    description: "Count of unique deviceuuid"
    type: count_distinct
    sql: ${uuid} ;;
    drill_fields: [device_id, uuid, device_name, product_name, channel_name]
  }
}
