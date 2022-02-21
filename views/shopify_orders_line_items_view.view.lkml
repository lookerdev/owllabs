# The name of this view in Looker is "Shopify Orders View"
view: shopify_orders_line_items_view {
  label: "Shopify Orders"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.shopify_orders_view ;;


  dimension: billing_address_company {
    label: "Billing Company"
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: billing_address_country {
    hidden: yes
    type: string
    sql: ${TABLE}.billing_address_country ;;
  }

  dimension_group: closed {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.closed_at ;;
  }

  dimension: contact_email {
    label: "Email"
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: country_name {
    label: "Market Region"
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: distribution_channel {
    hidden: yes
    type: string
    sql: ${TABLE}.distribution_channel ;;
  }

  dimension: financial_status {
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillable_quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.fulfillable_quantity ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

# this should be the primary key but there are 54 orders that have dupe netsuite orders so there are some dupes from Jul, Aug, Sept 2021
  dimension: line_item_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: netsuite_customer_internalid {
    hidden: yes
    type: string
    sql: ${TABLE}.netsuite_customer_internalid ;;
  }

  dimension: netsuite_customer_name {
    hidden: yes
    type: string
    sql: ${TABLE}.netsuite_customer_name ;;
  }

  dimension: netsuite_sales_order_number {
    type: string
    sql: ${TABLE}.netsuite_sales_order_number ;;
  }

  dimension: netsuite_sales_rep {
    hidden: yes
    type: string
    sql: ${TABLE}.netsuite_sales_rep ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_id {
    hidden: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_name {
    label: "Shopify Order Name"
    type: string
    sql: ${TABLE}.order_name ;;
  }

  dimension: pre_tax_price {
    hidden: yes
    type: number
    sql: ${TABLE}.pre_tax_price ;;
  }

  dimension: pre_tax_price_usd {
    hidden: yes
    type: number
    sql: ${TABLE}.pre_tax_price_usd ;;
  }

  dimension: product_exists {
    hidden: yes
    type: yesno
    sql: ${TABLE}.product_exists ;;
  }

  dimension: product_id {
    hidden: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_title {
    type: string
    sql: ${TABLE}.product_title ;;
  }

  dimension: quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.quantity_ordered ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: sales_rep {
    type: string
    sql: coalesce(${netsuite_sales_rep},${shopify_tags_sales_rep}) ;;
  }

  dimension: sales_order_internalid {
    hidden: yes
    type: string
    sql: ${TABLE}.sales_order_internalid ;;
  }

  dimension: shopify_tags_cam {
    label: "CAM"
    type: string
    sql: ${TABLE}.shopify_tags_cam ;;
  }

  dimension: shopify_tags_sales_rep {
    hidden: yes
    type: string
    sql: ${TABLE}.shopify_tags_sales_rep ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: tags {
    hidden: yes
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: variant_id {
    hidden: yes
    type: number
    sql: ${TABLE}.variant_id ;;
  }

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
  }

  dimension: allitems_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.allitems_quantity_ordered ;;
  }

  dimension: bundle_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.bundle_quantity_ordered ;;
  }

  dimension: hq_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.hq_quantity_ordered ;;
  }

  dimension: linecord_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.linecord_quantity_ordered ;;
  }

  dimension: lockadapter_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.lockadapter_quantity_ordered ;;
  }

  dimension: og_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.og_quantity_ordered ;;
  }

  dimension: other_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.other_quantity_ordered ;;
  }

  dimension: owlcare_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.owlcare_quantity_ordered ;;
  }

  dimension: powersupply_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.powersupply_quantity_ordered ;;
  }

  dimension: pro_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.pro_quantity_ordered ;;
  }

  dimension: subscription_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.subscription_quantity_ordered ;;
  }

  dimension: usbextension_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.usbextension_quantity_ordered ;;
  }

  dimension: wbo_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.wbo_quantity_ordered ;;
  }

  dimension: owls_quantity_ordered {
    hidden: yes
    type: number
    sql: ${og_quantity_ordered} + ${pro_quantity_ordered} ;;
  }

  dimension: hardware_quantity_ordered {
    hidden: yes
    type: number
    sql: ${og_quantity_ordered} + ${pro_quantity_ordered} + ${wbo_quantity_ordered} + ${hq_quantity_ordered} ;;
  }



# # MEASURES

  measure: count {
    hidden: yes
    type: count
    drill_fields: [country_name, netsuite_customer_name, order_name]
  }

  measure: count_orders {
    label: "Number of Orders"
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: sum_allitems_quantity_ordered {
    label: "All Items Quantity Ordered"
    type: sum
    sql: ${TABLE}.allitems_quantity_ordered ;;
  }

  measure: sum_bundle_quantity_ordered {
    label: "Bundle Quantity Ordered"
    type: sum
    sql: ${TABLE}.bundle_quantity_ordered ;;
  }

  measure: sum_hq_quantity_ordered {
    label: "Meeting HQ Quantity Ordered"
    type: sum
    sql: ${TABLE}.hq_quantity_ordered ;;
  }

  measure: sum_linecord_quantity_ordered {
    label: "Line Cord Quantity Ordered"
    type: sum
    sql: ${TABLE}.linecord_quantity_ordered ;;
  }

  measure: sum_lockadapter_quantity_ordered {
    label: "Lock Adapter Quantity Ordered"
    type: sum
    sql: ${TABLE}.lockadapter_quantity_ordered ;;
  }

  measure: sum_og_quantity_ordered {
    label: "Meeting Owl OG Quantity Ordered"
    type: sum
    sql: ${TABLE}.og_quantity_ordered ;;
  }

  measure: sum_other_quantity_ordered {
    label: "Other Quantity Ordered"
    type: sum
    sql: ${TABLE}.other_quantity_ordered ;;
  }

  measure: sum_owlcare_quantity_ordered {
    label: "Owl Care Quantity Ordered"
    type: sum
    sql: ${TABLE}.owlcare_quantity_ordered ;;
  }

  measure: sum_powersupply_quantity_ordered {
    label: "Power Supply Quantity Ordered"
    type: sum
    sql: ${TABLE}.powersupply_quantity_ordered ;;
  }

  measure: sum_pro_quantity_ordered {
    label: "Meeting Owl Pro Quantity Ordered"
    type: sum
    sql: ${TABLE}.pro_quantity_ordered ;;
  }

  measure: sum_subscription_quantity_ordered {
    label: "Subscription Quantity Ordered"
    type: sum
    sql: ${TABLE}.subscription_quantity_ordered ;;
  }

  measure: sum_usbextension_quantity_ordered {
    label: "USB Extension Quantity Ordered"
    type: sum
    sql: ${TABLE}.usbextension_quantity_ordered ;;
  }

  measure: sum_wbo_quantity_ordered {
    label: "Whiteboard Owl Quantity Ordered"
    type: sum
    sql: ${TABLE}.wbo_quantity_ordered ;;
  }

  measure: total_pre_tax_price {
    type: sum
    sql: ${pre_tax_price} ;;
  }

  measure: average_pre_tax_price {
    hidden: yes
    type: average
    sql: ${pre_tax_price} ;;
  }


}
