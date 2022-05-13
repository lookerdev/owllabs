connection: "redshift"

include: "/views/meeting_records.view.lkml"
include: "/views/devices.view.lkml"
include: "/views/device_registrations.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/device_checkins.view.lkml"
include: "/views/shopify_orders_serial_numbers.view.lkml"
include: "/views/most_recent_update_attempt.view.lkml"
include: "/views/barn_channels.view.lkml"

# !!! CHANGE ALL DEVICE_VIEW FIELDS COPIED FROM MEETING_RECORDS EXPLORE TO DEVICES

# explore: meeting_records {
#   hidden: yes
#   description: "Data for devices that have had at least one meeting"
#   sql_always_where: ${devices.product_name} <> 'TESTNAME'
#     and ${device_registrations.registration_record_delete_date} is null;;
#   # Exludes TESTNAME product name rows and only includes devices with no record deletion date or registration deletion date
#   # always_filter: {
#   #   filters: [device_registrations.registration_record_delete_date: "NULL"] # filter defaults to remove deleted registration records
#   # }
#   join: devices {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${meeting_records.deviceuuid} = ${devices.uuid} ;;
#   }
#   join:  device_registrations {
#     type: left_outer
#     relationship: many_to_many # this will change once I remove the funky registration dupes
#     sql_on: ${meeting_records.deviceuuid} = ${device_registrations.deviceuuid} ;;
#   }
#   join: salesforce_accounts {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: lower(${device_registrations.sf_accounts_join_key}) = lower(${salesforce_accounts.device_registrations_join_key});;
#   }
# }


explore: device_checkins {
  hidden: yes
  label: "Device Check-ins"
  description: "Device check-in data captured via Barn"
}

explore: devices {
  hidden: yes
  label: "Devices"
  description: "Data for all devices in the Barn Devices table or that have been recorded in Shopify orders"
  # Devices is the master table in this Explore, all other tables/data are dependent on the records in Devices
   # Excludes TESTNAME product name rows and only includes device rows with no device record deletion date or registration deletion date
  sql_always_where: ${product_name} <> 'TESTNAME'
    and ${device_registrations.registration_record_delete_date} is null;;
  # always_filter: {
  #   filters: [device_registrations.registration_record_delete_date: "NULL"] # filter defaults to remove deleted registration records
  # }
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
}

explore: barn_channels {
  label: "Barn Channels - UAT"
  description: "Details for all Barn Channels whether there are devices included in the channel or not."
  # fields: [barn_channels*, devices.device_count]
  fields: [barn_channels*, devices*,  device_registrations.count_registered_devices, -barn_channels.current_version]
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
