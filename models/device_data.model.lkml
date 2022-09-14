connection: "redshift"

include: "/views/meeting_records.view.lkml"
include: "/views/devices.view.lkml"
include: "/views/device_registrations.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/device_checkins.view.lkml"
include: "/views/shopify_orders_serial_numbers.view.lkml"
include: "/views/most_recent_update_attempt.view.lkml"
include: "/views/barn_channels.view.lkml"
include: "/views/blackboxes.view.lkml"

# include: "/views/device_meetingdates_v.view.lkml"



explore: devices {
  # hidden: yes
  label: "Devices"
  description: "Data for all devices in the Barn Devices table or that have been recorded in Shopify orders. Does not include TESTNAME products."
  # Devices is the master table in this Explore, all other tables/data are dependent on the records in Devices
  fields: [ALL_FIELDS*, -device_registrations.channel_id, -device_registrations.device_hardware_serial_number, -device_registrations.device_id, -device_registrations.product_id, -device_registrations.product_name, -most_recent_update_attempt.deviceuuid, -barn_channels.product_name, -barn_channels.productid]
  # fields: [devices*, ]
  join: device_registrations {
    type: left_outer
    relationship: one_to_many
    sql_on: ${devices.deviceuuid} = ${device_registrations.deviceuuid} ;;
  }
  join: salesforce_accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: lower(${device_registrations.sf_accounts_join_key}) = lower(${salesforce_accounts.device_registrations_join_key});;
  }
  join: shopify_orders_serial_numbers {
    type: left_outer
    relationship: one_to_one
    sql_on: lower(${devices.hardware_serial}) = lower(${shopify_orders_serial_numbers.serial_number}) ;;
  }
  join: most_recent_update_attempt {
    type: left_outer
    relationship: one_to_one
    sql_on: ${most_recent_update_attempt.deviceuuid} = ${devices.deviceuuid} ;;
  }
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
  }
  # join: device_meetingdates_v {
  #   type: left_outer
  #   relationship: one_to_one
  #   sql_on: ${devices.deviceuuid} = ${device_meetingdates_v.deviceuuid} ;;
  # }
}


explore: device_checkins {
  persist_for: "6 hours"
  # hidden: yes
  label: "Device Check-ins"
  description: "Device check-in data captured via the Barn. This table has a huge amount of rows and will take some time to load."
  join: devices {
    type: left_outer
    relationship: many_to_one
    sql_on: ${device_checkins.deviceuuid} = ${devices.deviceuuid} ;;
  }
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${barn_channels.channel_id} = ${devices.channel_id} ;;
  }
}


explore: barn_channels {
  persist_for: "6 hours"
  label: "Barn Channels"
  description: "Details for all Barn Channels whether there are devices included in the channel or not. Includes data for the devices in each channel."
  sql_always_where: ${product_name} <> 'TESTNAME' ;;
  # fields: [barn_channels*, devices.device_count]
  fields: [barn_channels*, devices*,  device_registrations.count_registered_devices]
  join: devices {
    type: left_outer
    relationship: one_to_many
    sql_on: ${devices.channel_id} = ${barn_channels.channel_id}  ;;
  }
  join: device_registrations {
    type: left_outer
    relationship: one_to_many
    sql_on: ${devices.deviceuuid} = ${device_registrations.deviceuuid} ;;
  }
}

# explore: blackboxes {
#   description: "Most recent Blackbox snapshot from device most recent check-in"
# }
