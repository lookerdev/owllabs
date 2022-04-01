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
# include: "/views/shopify_direct_hardware_orders_count.view.lkml"
include: "/views/monthly_hardware_goals.view.lkml"
include: "/views/dim_calendar_distinct.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/views/google_analytics_traffic_conversion.view.lkml"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.


explore: monthly_hardware_goals {
  hidden: yes
  view_name: dim_calendar_distinct
  join: monthly_hardware_goals {
    type: inner
    relationship: one_to_one
    sql_on: ${dim_calendar_distinct.month} = ${monthly_hardware_goals.month_number}
    and ${dim_calendar_distinct.year} = ${monthly_hardware_goals.year};;
  }
}


explore: all_orders_fulfillments {
  label: "All Orders & Fulfillments"
  view_name: dim_calendar
  # sql_always_where: ${year} >= 2015
  #                   and ${date_date} <= trunc(sysdate)
  #                   and ${all_fulfillments.sku} not in ('MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','PTW100-1000-RPL','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPPS','REPPS - Universal','REPUSB','REPUSB - Universal','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','WBC100-1000-RPL','TEST2','TEST3');;
  sql_always_where: ${all_fulfillments.sku} not in ('MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','PTW100-1000-RPL','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPPS','REPPS - Universal','REPUSB','REPUSB - Universal','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','WBC100-1000-RPL','TEST2','TEST3') ;;
  join: all_orders {
    type: inner
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${all_orders.order_date};;
  }
  join: all_fulfillments {
    type: inner
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${all_fulfillments.fulfillment_date};;
  }
}


explore: shopify_orders_fulfillments {
  label: "Shopify Orders & Fulfillments"
  view_name: dim_calendar
  sql_always_where: ${year} >= 2015
                    and ${date_date} <= trunc(sysdate)
                    and ${shopify_fulfillments_line_items_view.sku} not in ('MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','PTW100-1000-RPL','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPPS','REPPS - Universal','REPUSB','REPUSB - Universal','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','WBC100-1000-RPL')
                    ;;
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

explore: traffic_conversion {
  # label: "Traffic Conversion"
  view_name: dim_calendar
  sql_always_where: ${year} >= 2016 and ${date_date} <= trunc(sysdate)
  ;;
  join: google_analytics_traffic_conversion {
    type: left_outer
    relationship: one_to_one
    sql_on: ${dim_calendar.id} = ${google_analytics_traffic_conversion.id} ;;
  }
}



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
