connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

explore: orders_line_items_view {

  join: orders_view {
    sql_on: ${orders_line_items_view.store}=${orders_view.store}
            AND ${orders_line_items_view.name}=${orders_view.name};;
    relationship: many_to_one
    type: left_outer
  }


  join: orders_fulfillments_view {
    sql_on: ${orders_view.name}=${orders_fulfillments_view.order_number}
            AND ${orders_fulfillments_view.store}=${orders_view.store};;
    relationship: many_to_one
    type: left_outer
  }

}

explore: orders_fulfillments_view {}


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
