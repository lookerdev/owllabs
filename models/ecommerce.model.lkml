connection: "redshift"
label: "E-Commerce"
# label: "Sales Data"

include: "/views/dim_calendar.view.lkml"
include: "/views/netsuite_orders.view.lkml"
include: "/views/netsuite_orders_line_items.view.lkml"
include: "/views/netsuite_fulfillments.view.lkml"
include: "/views/netsuite_fulfillments_line_items.view.lkml"
include: "/views/dim_calendar_distinct.view.lkml"
include: "/views/monthly_hardware_goals_eom_projections.view.lkml"

include: "/views/sales/*.view.lkml"



explore: all_orders {
  description: "Order data from Shopify, Amazon, Sourcenext, and historical distributor Starin. Does not include Salesforce opportunitites. By default includes SKUs that don't count toward revenue (replacement units, Owls For Good), which can be filtered out using Revenue SKU dimension."
}


explore: all_fulfillments {
  description: "Shipment data from Shopify, Amazon, Sourcenext, and historical distributor Starin. Does not include Salesforce opportunitites. By default includes SKUs that don't count toward revenue (replacement units, Owls For Good), which can be filtered out using Revenue SKU dimension."
}


explore: shopify_orders_line_items_view {
  label: "Shopify Orders"
  description: "Shopify order data including line-item detail. By default includes SKUs that don't count toward revenue (replacement units, Owls For Good), which can be filtered out using Revenue SKU dimension. Excludes test SKUs."
  sql_always_where: ${shopify_orders_line_items_view.sku} not in ('TEST2','TEST3') ;;
}

explore: shopify_fulfillments_line_items_view {
  label: "Shopify Fulfillments"
  description: "Shopify fulfillments data including line-item detail. By default includes SKUs that don't count toward revenue (replacement units, Owls For Good), which can be filtered out using Revenue SKU dimension. Excludes test SKUs."
  sql_always_where: ${shopify_fulfillments_line_items_view.sku} not in ('TEST2','TEST3') ;;
}

explore: distributor_sellthrough {
  hidden: yes
  description: "IN DEVELOPMENT - Sellthrough fulfillment data accumulated in Salesforce from distributor reports."
}

explore: monthly_hardware_goals_eom_projections {
  label: "Monthly Sales Goals & EOM Projections"
  description: "Compare MTD fulfillments against Operating Plan goals and projects total order and fulfillment numbers for end of month. EOM projections do not factor in pipeline activity from Sales team."
}

# explore: monthly_hardware_goals {
#   view_name: dim_calendar_distinct
#   sql_always_where: ${dim_calendar_distinct.month_year_date_convert} >= '2021-01-01' and ${dim_calendar_distinct.month_year_date_convert} <= trunc(sysdate);;
#   join: monthly_hardware_goals {
#     type: inner
#     relationship: one_to_one
#     sql_on: ${dim_calendar_distinct.month} = ${monthly_hardware_goals.month_number}
#     and ${dim_calendar_distinct.year} = ${monthly_hardware_goals.year};;
#   }
# }

# explore: all_orders_fulfillments {
#   hidden: yes
#   label: "[ARCHIVED] All Orders & Fulfillments"
#   description: "Sales data from Shopify, Amazon, Sourcenext, and historical distributor Starin. By default includes SKUs that don't count toward revenue (replacement units, Owls For Good), which can be filtered out using Revenue SKU dimension. Excludes test SKUs. All Orders and All Fulfillments tables are joined on date and does not link orders and fulfillments to each other."
#   view_name: dim_calendar
#   sql_always_where: ${dim_calendar.date_date} >= '2017-05-14' and ${dim_calendar.date_date} <= trunc(sysdate) ;;
#   join: all_orders {
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${dim_calendar.date_date} = ${all_orders.order_date}
#       and ${all_orders.sku} not in ('TEST2','TEST3') ;;
#   }
#   join: all_fulfillments {
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${dim_calendar.date_date} = ${all_fulfillments.fulfillment_date}
#       and ${all_fulfillments.sku} not in ('TEST2','TEST3') ;;
#   }
# }

explore: shopify_orders_fulfillments {
  hidden: yes
  label: "[ARCHIVED] Shopify Orders & Fulfillments"
  description: "Sales data from Shopify. By default includes SKUs that don't count toward revenue (replacement units, Owls For Good), which can be filtered out using Revenue SKU dimension. Excludes test SKUs."
  view_name: dim_calendar
  sql_always_where: ${dim_calendar.date_date} >= '2017-05-14' and ${dim_calendar.date_date} <= trunc(sysdate) ;;
  join: shopify_orders_line_items_view {
    type: left_outer
    relationship: one_to_many
    sql_on: ${shopify_orders_line_items_view.order_date} = ${dim_calendar.date_date}
      and ${shopify_orders_line_items_view.sku} not in ('TEST2','TEST3') ;;
  }
  join: shopify_fulfillments_line_items_view {
    type: left_outer
    relationship: one_to_many
    sql_on: ${shopify_fulfillments_line_items_view.fulfillment_date} = ${dim_calendar.date_date}
      and ${shopify_fulfillments_line_items_view.sku} not in ('TEST2','TEST3') ;;
  }
}

explore: netsuite_fulfillments_line_items {
  hidden:  yes
}

# this needs to be improved!!
explore: netsuite_orders_fulfillments {
  hidden: yes
  label: "Netsuite Orders & Fulfillments"
  # description: ""
  view_name: dim_calendar
  sql_always_where: ${year} >= 2021 and ${date_date} <= trunc(sysdate);;
  join: netsuite_orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${netsuite_orders.order_date} ;;
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



# ARCHIVE
include: "/views/archive/orders_view.view.lkml"  # include all views in the views/ folder in this project
include: "/views/archive/orders_line_items_view.view.lkml"
include: "/views/archive/orders_fulfillments_view.view.lkml"

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
