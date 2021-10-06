connection: "redshift"

include: "/views/netsuite_revenue_report.view.lkml"
include: "/views/netsuite_units_ordered.view.lkml"
include: "/views/netsuite_units_fulfilled.view.lkml"
include: "/views/dim_calendar.view.lkml"
include: "/views/item_fulfillments_looker.view.lkml"
include: "/views/revenue_by_item_looker.view.lkml"
include: "/views/revenue_by_item_aggregated.view.lkml"
include: "/views/item_fulfillments_aggregated.view.lkml"
include: "/views/revenue_report_dimensions.view.lkml"
# include: "*.dashboard.lookml"

# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


# explore: netsuite_revenue_report {
#   label: "Netsuite Revenue Report"
#   # always_filter: {
#   #     filters: [actual_ship_date: "filter expression", transaction_date: "filter expression"]
#   # sql_always_where: (${netsuite_revenue_report."Ship Date"} >= '2021-08-01' AND ${netsuite_revenue_report."Ship Date"} < '2021-09-01') OR (${netsuite_revenue_report."Transaction Date"} >= '2021-08-01' AND ${netsuite_revenue_report."Transaction Date"} < '2021-09-01');;
#   }

explore: netsuite_units_ordered {
  label: "Netsuite Units Ordered"
  join: netsuite_units_fulfilled {
    # view_label: "Devices"
    relationship: one_to_many
    sql_on: ${netsuite_units_fulfilled.created_from_internal_id} = ${netsuite_units_ordered.internal_id} and ${netsuite_units_fulfilled.item_internal_id} = ${netsuite_units_ordered.item_internal_id} ;;
    # sql_where: ${device_view.product_name} != 'TESTNAME' ;;
  }
  join:  dim_calendar {
    relationship: many_to_one
    sql_on: ${dim_calendar.date_date} = ${netsuite_units_ordered.sales_order_date} or ${dim_calendar.date_date} = ${netsuite_units_fulfilled.fullfillment_date} ;;
  }
}

explore: netsuite_units_fulfilled {
  label: "Netsuite Units Fulfilled"
}

explore: item_fulfillments_looker {
  label: "Revenue Item Fulfillments"
}

explore: revenue_by_item_looker {
  label: "Revenue by Item"
}

# revenue_report_dimensions
# key = period/accounting_period_name || channel || marketplace_segment || product_category || product_line AS key

# item_fulfillments_aggregated
# primary key = ${TABLE}.period || ${TABLE}.channel || ${TABLE}.marketplace_segment || ${TABLE}.product_category || ${TABLE}.product_line;;

# revenue_by_item_aggregated
# primary key = ${TABLE}.accounting_period_name || ${TABLE}.channel || ${TABLE}.marketplace_segment || ${TABLE}.product_category || ${TABLE}.product_line ;;

explore: revenue_report_dimensions {
  join: revenue_by_item_aggregated {
    type: left_outer
    relationship: one_to_one
    sql_on: ${revenue_report_dimensions.key} = ${revenue_by_item_aggregated.primary_key} ;;
  }
  join: item_fulfillments_aggregated {
    type: left_outer
    relationship: one_to_one
    # foreign_key: revenue_by_item_aggregated.primary_key
    # sql_on: ${item_fulfillments_aggregated.period} = ${revenue_by_item_aggregated.accounting_period_name} AND
    #         ${item_fulfillments_aggregated.channel} = ${revenue_by_item_aggregated.channel} AND
    #         ${item_fulfillments_aggregated.marketplace_segment} = ${revenue_by_item_aggregated.marketplace_segment} AND
    #         ${item_fulfillments_aggregated.product_category} = ${revenue_by_item_aggregated.product_category} AND
    #         ${item_fulfillments_aggregated.product_line} = ${revenue_by_item_aggregated.product_line};;
    sql_on: ${revenue_report_dimensions.key} = ${item_fulfillments_aggregated.primary_key} ;;
  }
}
