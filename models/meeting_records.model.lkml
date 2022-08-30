connection: "redshift"
label: "Device Data"
# label: "Usage"

include: "/views/meeting_records.view.lkml"
include: "/views/device_view.view.lkml"
include: "/views/device_registrations.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/device_checkins.view.lkml"
include: "/views/shopify_orders_serial_numbers.view.lkml"
include: "/views/most_recent_update_attempt.view.lkml"
include: "/views/barn_channels.view.lkml"
include: "/views/devices.view.lkml"
# include: "/*.explore.lkml"
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard



# explore: meeting_records2 {
#   hidden: yes
#   view_name: meeting_records
#   # meeting_records.years_owl_connect_return_after_first_mtg needs to join to devices instead of device_view
#   label: "Meeting Records"
#   description: "Data for devices that have had at least one meeting. Does not include TESTNAME products."
#   join: devices {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${meeting_records.deviceuuid} = ${devices.deviceuuid} ;;
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
#   join: barn_channels {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
#   }
# }

 explore: meeting_records {
  description: "Data for devices that have had at least one meeting. Does not include TESTNAME products."
  # fields: [meeting_records*, device_registrations*, ] # may not be needed
  join: device_view {
    # view_label: "Please replace with corresponding column from Devices subcategory"
      type: left_outer
      relationship: many_to_one
      sql_on: ${meeting_records.deviceuuid} = ${device_view.uuid} ;;
  }
  # join: devices {
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${meeting_records.deviceuuid} = ${devices.deviceuuid} ;;
  # }
  join:  device_registrations {
    type: left_outer
    relationship: many_to_many # this will change once I remove the funky registration dupes
    sql_on: ${meeting_records.deviceuuid} = ${device_registrations.deviceuuid} ;;
  }
  join: salesforce_accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: lower(${device_registrations.sf_accounts_join_key}) = lower(${salesforce_accounts.device_registrations_join_key});;
  }
  # join: barn_channels {
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
  # }
}

# MOVED TO DEVICE_DATA - DON'T USE
 explore: device_view {
  hidden: yes
  view_name: device_view
  label: "Devices [DON'T USE]"
  description: "Data for all devices in the Barn Devices table or that have been recorded in Shopify orders. By default filters out TESTNAME products and deleted registration dates."
  # sql_always_where: ${device_view.product_name} <> 'TESTNAME'
  #                   and ${device_registrations.registration_record_delete_date} is null;;
                    # Exludes TESTNAME product name rows and only includes device rows with no device record deletion date or registration deletion date
  # fields: [ALL_FIELDS*,-device_registrations.deviceuuid,-most_recent_update_attempt.deviceuuid]
  always_filter: {
    filters: [device_view.product_name: "-TESTNAME"] # filter defaults to remove deleted registration records and TESTNAME products
  }
  join: device_registrations {
    type: left_outer
    relationship: one_to_many
    sql_on: ${device_view.uuid} = ${device_registrations.deviceuuid} ;;
  }
  join: salesforce_accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: lower(${device_registrations.sf_accounts_join_key}) = lower(${salesforce_accounts.device_registrations_join_key});;
  }
  join: shopify_orders_serial_numbers {
    type: left_outer
    relationship: one_to_one
    sql_on: lower(${device_view.device_hardware_serial_number}) = lower(${shopify_orders_serial_numbers.serial_number}) ;;
  }
  join: most_recent_update_attempt {
    type: left_outer
    relationship: one_to_one
    sql_on: ${most_recent_update_attempt.deviceuuid} = ${device_view.uuid} ;;
  }
}
