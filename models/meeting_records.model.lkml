connection: "redshift"
label: "Device Data"

include: "/views/meeting_records.view.lkml"
include: "/views/device_view.view.lkml"
include: "/views/device_registrations.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/device_checkins.view.lkml"
include: "/views/shopify_orders_serial_numbers.view.lkml"
# include: "/*.explore.lkml"
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


 explore: meeting_records {
  sql_always_where: ${device_view.product_name} <> 'TESTNAME'
                    and ${device_registrations.registration_record_delete_date} is null;;
                    # Exludes TESTNAME product name rows and only includes devices with no record deletion date or registration deletion date
  # always_filter: {
  #   filters: [device_registrations.registration_record_delete_date: "NULL"] # filter defaults to remove deleted registration records
  # }
  join: device_view {
    # view_label: "Devices"
      type: left_outer
      relationship: many_to_one
      sql_on: ${meeting_records.deviceuuid} = ${device_view.uuid} ;;
  }
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
}

 explore: device_checkins {
  label: "Device Check-Ins"
}

# explore: device_registrations {
# }

 explore: device_view {
  view_name: device_view
  label: "Devices"
  sql_always_where: ${device_view.product_name} <> 'TESTNAME'
                    and ${device_registrations.registration_record_delete_date} is null;;
                    # Exludes TESTNAME product name rows and only includes device rows with no device record deletion date or registration deletion date
  # always_filter: {
  #   filters: [device_registrations.registration_record_delete_date: "NULL"] # filter defaults to remove deleted registration records
  # }
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
}

# # why is this erroring?
# explore: device_view_extend_vbj {
#   label: "extend test"
#   extends: [device_view]
#   # fields: [device_registrations.registration_date, device_view.uuid, device_view.device_hardware_serial_number]
#   # sql_always_were: ${device_view.product_name} = 'Meeting Owl Pro' ;;
# }
