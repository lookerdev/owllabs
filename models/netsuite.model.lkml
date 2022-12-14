connection: "redshift"

include: "/views/dim_calendar.view.lkml"
include: "/views/dim_calendar_distinct.view.lkml"

include: "/views/netsuite_revenue_report/**.view.lkml"

include: "/views/netsuite_orders.view.lkml"
include: "/views/shopify_orders.view.lkml"



# keep hidden, doesn't need to be accessible outside of Revenue Report dashboard
# should I rename this explore...? If I do I'll have to replace everything in the dashboard using it...
  explore: dim_calendar_distinct {
    hidden: yes
    sql_always_where: ${dim_calendar_distinct.date_convert} >= '2021-08-01';;
    label: "Revenue & Fulfillments by Item"
    join: revenue_by_item_looker {
      type: inner
      relationship: one_to_many
      sql_on: ${revenue_by_item_looker.accounting_period_name} = ${dim_calendar_distinct.period_name} ;;
    }
    join: item_fulfillments_looker {
      type: inner
      relationship: one_to_many
      sql_on: ${dim_calendar_distinct.period_name} = ${item_fulfillments_looker.period} ;;
    }
    join: netsuite_orders {
      type: left_outer
      relationship: one_to_many
      # sql_on: cast(${dim_calendar_distinct.month} as char) || cast(${dim_calendar_distinct.year} as char) = cast(${netsuite_orders.sales_order_month} as char) || cast(${netsuite_orders.sales_order_year} as char);;
      sql_on: cast(${dim_calendar_distinct.month} as varchar) || cast(${dim_calendar_distinct.year} as varchar) = cast(DATE_PART(month, ${netsuite_orders.order_date}) as varchar) || cast(DATE_PART(year, ${netsuite_orders.order_date}) as varchar) ;;
    }
  }

# keep hidden, doesn't need to be accessible outside of Revenue Report dashboard
  explore: revenue_report_aggregates {
    hidden: yes
    label: "Revenue Report Aggregates"
    view_name: revenue_report_dimensions
    sql_always_where: ${dim_calendar_distinct.date_convert} >= '2021-08-01';;
    join: dim_calendar_distinct {
      relationship: many_to_one
      sql_on: ${dim_calendar_distinct.period_name} = ${revenue_report_dimensions.period} ;;
    }
    join: revenue_by_item_aggregated_net {
      type: left_outer
      relationship: one_to_one
      sql_on: ${revenue_report_dimensions.key} = ${revenue_by_item_aggregated_net.primary_key} ;;
    }
    join: revenue_by_item_aggregated_gross {
      type: left_outer
      relationship: one_to_one
      sql_on: ${revenue_report_dimensions.key} = ${revenue_by_item_aggregated_gross.primary_key} ;;
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

  # explore: billing_invoicing_netsuite_shopify{
  #   hidden: yes
  #   label: "Billing & Invoicing Validation (Netsuite vs. Shopify)"
  #   # description: ""
  #   view_name: netsuite_orders
  #   join: shopify_orders {
  #     type: inner
  #     # relationship:
  #     sql_on: ${netsuite_orders.shopify_order_name} = ${shopify_orders.name}
  #             and ${netsuite_orders.shopify_store} = ${shopify_orders.store};;
  #   }
  # }
