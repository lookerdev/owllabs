connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

# explore: meeting_records {
#   hidden: yes
#   description: "Data for devices that have had at least one meeting. By default filters out TESTNAME products."
#   # sql_always_where: ${devices.product_name} <> 'TESTNAME'
#   #   and ${device_registrations.registration_record_delete_date} is null;;
#   # Exludes TESTNAME product name rows and only includes devices with no record deletion date or registration deletion date
#   # always_filter: {
#   #   filters: [device_registrations.registration_record_delete_date: "NULL"] # filter defaults to remove deleted registration records
#   # }
#   always_filter: {
#     filters: [devices.product_name: "-TESTNAME"] # filter defaults to remove deleted registration records
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
# }
