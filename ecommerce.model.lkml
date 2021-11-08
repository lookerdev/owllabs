connection: "redshift"

include: "/views/orders_view.view.lkml"                # include all views in the views/ folder in this project
include: "/views/orders_line_items_view.view.lkml"
include: "/views/orders_fulfillments_view.view.lkml"
include: "/views/dim_calendar.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

explore: orders_view {
  label: "Orders Explore (orig)"
  join: orders_line_items_view {
    sql_on: ${orders_line_items_view.store}=${orders_view.store}
      AND ${orders_line_items_view.name}=${orders_view.shopify_order_number};;
    relationship: many_to_one
    type: left_outer
  }
  join: orders_fulfillments_view {
    sql_on: ${orders_view.shopify_order_number}=${orders_fulfillments_view.order_number}
            AND ${orders_fulfillments_view.store}=${orders_view.store}
            AND ${orders_fulfillments_view.product_id}=${orders_fulfillments_view.product_id};; #these are the same!
    relationship: many_to_one
    type: left_outer
  }

}

explore: dim_calendar {
  label: "Orders Explore (test)"
  join: orders_line_items_view {
    sql_on: ${dim_calendar.date_date} = ${orders_line_items_view.order_created_date} ;;
    relationship: one_to_many
  }
  join: orders_fulfillments_view {
    sql_on: ${dim_calendar.date_date} = ${orders_fulfillments_view.created_date} ;;
    relationship: one_to_many
  }
}
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
