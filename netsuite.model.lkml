connection: "redshift"

include: "/views/netsuite_revenue_report.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

explore: netsuite_revenue_report {
  label: "Netsuite Monthly Revenue Report"
  # always_filter: {
  #     filters: [actual_ship_date: "filter expression", transaction_date: "filter expression"]
  # ((( "actual_ship_date" ) >= (TIMESTAMP '2021-08-01') AND ( "actual_ship_date" ) < (TIMESTAMP '2021-09-01'))) OR ((( "transaction_date" ) >= (TIMESTAMP '2021-08-01') AND ( "transaction_date" ) < (TIMESTAMP '2021-09-01')))

#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }

#
#
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
}
