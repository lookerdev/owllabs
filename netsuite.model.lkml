connection: "redshift"

include: "/views/netsuite_units_ordered.view.lkml"
include: "/views/netsuite_units_fulfilled.view.lkml"
include: "/views/dim_calendar.view.lkml"
include: "/views/item_fulfillments_looker.view.lkml"
include: "/views/revenue_by_item_looker.view.lkml"
include: "/views/revenue_by_item_aggregated.view.lkml"
include: "/views/item_fulfillments_aggregated.view.lkml"
include: "/views/revenue_report_dimensions.view.lkml"
include: "/views/dim_calendar_distinct.view.lkml"
# include: "*.dashboard.lookml"

# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: dim_calendar {
  label: "Netsuite Orders/Fulfillment"
  join: netsuite_units_fulfilled {
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${netsuite_units_fulfilled.fullfillment_date} ;;
  }
  join: netsuite_units_ordered {
    relationship: one_to_many
    sql_on:${dim_calendar.date_date} = ${netsuite_units_ordered.sales_order_date} ;;
  }
}

explore: dim_calendar_distinct {
  sql_always_where: ${dim_calendar_distinct.year} >= 2014 ;;
  label: "Revenue & Fulfillments by Item"
  join: revenue_by_item_looker {
    type: inner
    # type: left_outer
    relationship: one_to_many
    sql_on: ${revenue_by_item_looker.accounting_period_name} = ${dim_calendar_distinct.period_name} ;;
  }
  join: item_fulfillments_looker {
    # type: left_outer
    type: inner
    relationship: one_to_many
    sql_on: ${dim_calendar_distinct.period_name} = ${item_fulfillments_looker.period} ;;
  }
}

explore: revenue_report_dimensions {
  label: "Revenue Aggregates"
  join: dim_calendar_distinct {
    relationship: many_to_one
    sql_on: ${dim_calendar_distinct.period_name} = ${revenue_report_dimensions.period} ;;
  }
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
