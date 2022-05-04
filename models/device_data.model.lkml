connection: "redshift"

include: "/views/meeting_records.view.lkml"
include: "/views/devices.view.lkml"
include: "/views/device_registrations.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/device_checkins.view.lkml"
include: "/views/shopify_orders_serial_numbers.view.lkml"


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
   # Exludes TESTNAME product name rows and only includes device rows with no device record deletion date or registration deletion date
  sql_always_where: ${product_name} <> 'TESTNAME'
    and ${device_registrations.registration_record_delete_date} is null;;
  # always_filter: {
  #   filters: [device_registrations.registration_record_delete_date: "NULL"] # filter defaults to remove deleted registration records
  # }
  join: device_registrations {
    type: left_outer
    relationship: one_to_many
    sql_on: ${devices.uuid} = ${device_registrations.deviceuuid} ;;
  }
  join: salesforce_accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: lower(${device_registrations.sf_accounts_join_key}) = lower(${salesforce_accounts.device_registrations_join_key});;
  }
  join: shopify_orders_serial_numbers {
    type: left_outer
    relationship: one_to_one
    sql_on: lower(${devices.device_hardware_serial_number}) = lower(${shopify_orders_serial_numbers.serial_number}) ;;
  }
}
