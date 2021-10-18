connection: "redshift"

include: "/views/device_checkins.view.lkml"                # include all views in the views/ folder in this project
include: "/views/device_registrations.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: device_checkins {
  label: "Device Check-Ins"
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
  }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }

explore: device_registrations {}
# }
