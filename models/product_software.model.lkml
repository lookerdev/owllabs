connection: "redshift"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/views/rhapsody_sw_version_download_tracking.view.lkml"
include: "/software_version_breakdown.view.lkml"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: rhapsody_sw_version_download_tracking {
  label: "Rhapsody Software Download Tracking"
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
  }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: software_version_breakdown {
  label: "Software Version Berakdown - TEST"
}
