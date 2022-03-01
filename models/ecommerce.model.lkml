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
include: "/views/shopify_orders_line_items_view.view.lkml"
include: "/views/shopify_fulfillments_line_items_view.view.lkml"
include: "/views/all_orders.view.lkml"
include: "/views/all_fulfillments.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.


explore: all_orders_fulfillments {
  label: "UAT - All Orders & Fulfillments"
  view_name: dim_calendar
  sql_always_where: ${year} >= 2015 and ${date_date} <= trunc(sysdate);;
  join: all_orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${all_orders.order_date};;
  }
  join: all_fulfillments {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${all_fulfillments.fulfillment_date};;
  }
}

explore: shopify_orders_fulfillments {
  label: "UAT - Shopify Orders & Fulfillments"
  view_name: dim_calendar
  sql_always_where: ${year} >= 2015 and ${date_date} <= trunc(sysdate);;
  join: shopify_orders_line_items_view {
    type: left_outer
    relationship: one_to_many
    sql_on: ${shopify_orders_line_items_view.order_date} = ${dim_calendar.date_date} ;;
  }
  join: shopify_fulfillments_line_items_view {
    type: left_outer
    relationship: one_to_many
    sql_on: ${shopify_fulfillments_line_items_view.fulfillment_date} = ${dim_calendar.date_date} ;;
  }
}

# explore: netsuite_orders {}

# this needs to be improved!!
explore: netsuite_orders_fulfillments {
  hidden: yes
  label: "Netsuite Orders & Fulfillments"
  view_name: dim_calendar
  sql_always_where: ${year} >= 2021 and ${date_date} <= trunc(sysdate);;
  join: netsuite_orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${netsuite_orders.sales_order_date} ;;
  }
  # join: netsuite_orders_line_items {
  #   type: left_outer
  #   relationship: one_to_many
  #   sql_on:  ;;
  # }
  # join: netsuite_fulfillments {
  #   relationship: one_to_many
  #   sql_on:${dim_calendar.date_date} = ${netsuite_fulfillments.actual_ship_date} ;;
  # }
}


# explore: netsuite_orders_fulfillments {
#   hidden: yes
#   label: "Netsuite Orders & Fulfillments"
#   view_name: dim_calendar
#   sql_always_where: ${year} >= 2021 and ${date_date} <= trunc(sysdate);;
#   join: netsuite_orders {
#     relationship: one_to_many
#     sql_on: ${dim_calendar.date_date} = ${netsuite_orders.order_date} ;;
#   }
#   join: netsuite_fulfillments {
#     relationship: one_to_many
#     sql_on:${dim_calendar.date_date} = ${netsuite_fulfillments.actual_ship_date} ;;
#   }
# }

# archive
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
