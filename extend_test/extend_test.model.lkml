connection: "redshift"
label: "TEST"

include: "/**/*.view.lkml"                # include all views in the views/ folder in this project


# explore: devices_test {
#   hidden: yes
#   view_name: devices
#   description: "Data for all devices in the Barn Devices table or that have been recorded in Shopify orders. Does not include TESTNAME products."
#   # Devices is the master table in this Explore, all other tables/data are dependent on the records in Devices
#   # fields: [ALL_FIELDS*, -device_registrations.channel_id, -device_registrations.device_hardware_serial_number, -device_registrations.device_id, -device_registrations.product_id, -device_registrations.product_name, -most_recent_update_attempt.deviceuuid, -barn_channels.product_name, -barn_channels.productid]
#   # fields: [devices*, ]
#   join: barn_channels {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
#   }
# }


explore: devices_extend_barn_channels {
  hidden: yes
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${channel_id} = ${barn_channels.channel_id} ;;
  }
}


explore: devices_base {
  hidden: yes
}
