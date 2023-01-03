connection: "redshift"
label: "Device Data"
# label: "Usage"


include: "/views/barn/*.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/shopify_orders_serial_numbers.view.lkml"



explore: meeting_records {
  from: meeting_records_extend_devices
  description: "Data for devices that have had at least one meeting. Does not include TESTNAME products."
  join: devices {
    type: left_outer
    relationship: many_to_one
    sql_on: ${meeting_records.deviceuuid} = ${devices.deviceuuid} ;;
  }
  join: device_registrations {
    type: left_outer
    relationship: many_to_many # this will change once I remove the funky registration dupes
    sql_on: ${meeting_records.deviceuuid} = ${device_registrations.deviceuuid} ;;
  }
  join: salesforce_accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: lower(${device_registrations.sf_accounts_join_key}) = lower(${salesforce_accounts.device_registrations_join_key});;
  }
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
  }
  join: device_meeting_cohorts_v {
    type: left_outer
    relationship: one_to_one
    sql_on: ${meeting_records.deviceuuid} = ${device_meeting_cohorts_v.deviceuuid} ;;
  }
}
