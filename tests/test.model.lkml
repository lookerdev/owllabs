connection: "redshift"
# label: "Testing Explore"

include: "/meeting_records-test.view.lkml"
include: "/views/device_view.view.lkml"
include: "/views/device_registrations.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/barn_channels.view.lkml"
include: "/views/devices.view.lkml"





# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: meeting_records_test {}

# explore: meeting_records_test {
#   # hidden: yes
#   description: "Data for devices that have had at least one meeting. Does not include TESTNAME products."
#   # fields: [meeting_records*, device_registrations*, ] # may not be needed
#   join: device_view {
#     view_label: "This data is on its way out, please don't use"
#     type: left_outer
#     relationship: many_to_one
#     sql_on: meeting = ${device_view.uuid} ;;
#   }
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


# explore: meeting_records {
#   description: "Data for devices that have had at least one meeting. Does not include TESTNAME products."
#   # fields: [meeting_records*, device_registrations*, ] # may not be needed
#   join: device_view {
#     # view_label: "This data is on its way out, please don't use"
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${meeting_records.deviceuuid} = ${device_view.uuid} ;;
#   }
#   # join: devices {
#   #   type: left_outer
#   #   relationship: many_to_one
#   #   sql_on: ${meeting_records.deviceuuid} = ${devices.deviceuuid} ;;
#   # }
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
#   # join: barn_channels {
#   #   type: left_outer
#   #   relationship: many_to_one
#   #   sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
#   # }
# }
