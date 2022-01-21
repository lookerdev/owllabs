connection: "redshift"
label: "E-Commerce"

include: "/views/orders_view.view.lkml"                # include all views in the views/ folder in this project
include: "/views/orders_line_items_view.view.lkml"
include: "/views/orders_fulfillments_view.view.lkml"
include: "/views/dim_calendar.view.lkml"
include: "/views/netsuite_orders.view.lkml"
include: "/views/netsuite_orders_line_items.view.lkml"
include: "/views/netsuite_fulfillments.view.lkml"
include: "/views/netsuite_fulfillments_line_items.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

explore: orders_view {
  hidden: yes
  label: "Orders Explore (orig)"
  join: orders_line_items_view {
    sql_on: ${orders_line_items_view.store}=${orders_view.store}
      AND ${orders_line_items_view.name}=${orders_view.order_number};;
    relationship: many_to_one
    type: left_outer
  }
  join: orders_fulfillments_view {
    sql_on: ${orders_view.order_number}=${orders_fulfillments_view.order_number}
            AND ${orders_fulfillments_view.store}=${orders_view.store}
            AND ${orders_fulfillments_view.product_id}=${orders_fulfillments_view.product_id};; #these are the same!
    relationship: many_to_one
    type: left_outer
  }

}

explore: dim_calendar {
  hidden: yes
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


explore: netsuite_orders_fulfillments {
  hidden: yes
  label: "Netsuite Orders & Fulfillments"
  view_name: dim_calendar
  sql_always_where: ${year} >= 2021 and ${date_date} <= trunc(sysdate);;

  join: netsuite_orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${netsuite_orders.order_date} ;;
  }
  join: netsuite_orders_line_items {
    type: left_outer
    relationship: one_to_many
    sql_on:  ;;
  }

  join: netsuite_fulfillments {
    relationship: one_to_many
    sql_on:${dim_calendar.date_date} = ${netsuite_fulfillments.actual_ship_date} ;;
  }
}
