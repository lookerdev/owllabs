# The name of this view in Looker is "Shopify Fulfillments View"
view: shopify_fulfillments_line_items_view {
  label: "Shopify Fulfillments"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.shopify_fulfillments_view ;;

# # DIMENSIONS

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

  dimension_group: fulfillment {
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
    sql: ${TABLE}.fulfillment_date ;;
  }

  dimension: fulfillment_id {
    hidden: yes
    type: string
    sql: ${TABLE}.fulfillment_id ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: line_item_id {
    hidden: yes
    type: string
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: netsuite_sales_rep {
    hidden: yes
    type: string
    sql: ${TABLE}.netsuite_sales_rep ;;
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

  dimension: product_id {
    hidden: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_title {
    type: string
    sql: ${TABLE}.product_title ;;
  }

  dimension: quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: row_number {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
    # drill_fields: [fulfillment_id]
  }

  dimension: shipping_address_company {
    label: "Shipping Company"
    type: string
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: shipping_address_country {
    hidden: yes
    type: string
    sql: ${TABLE}.shipping_address_country ;;
  }

  dimension: shopify_fulfillment_name {
    label: "Fulfillment Name"
    type: string
    sql: ${TABLE}.shopify_fulfillment_name ;;
  }

  dimension: shopify_order_name {
    label: "Order Name"
    type: string
    sql: ${TABLE}.shopify_order_name ;;
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

  dimension: sales_rep {
    type: string
    sql: ${TABLE}.sales_rep;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: source {
    # hidden: yes
    type: string
    sql: ${TABLE}.source ;;
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
    type: string
    sql: ${TABLE}.variant_id ;;
  }

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
  }

  dimension: allitems_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.allitems_quantity_shipped ;;
  }

  dimension: bundle_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.bundle_quantity_shipped ;;
  }

  dimension: hq_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.hq_quantity_shipped ;;
  }

  dimension: linecord_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.linecord_quantity_shipped ;;
  }

  dimension: lockadapter_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.lockadapter_quantity_shipped ;;
  }

  dimension: og_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.og_quantity_shipped ;;
  }

  dimension: other_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.other_quantity_shipped ;;
  }

  dimension: owlcare_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.owlcare_quantity_shipped ;;
  }

  dimension: powersupply_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.powersupply_quantity_shipped ;;
  }

  dimension: pro_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.pro_quantity_shipped ;;
  }

  dimension: subscription_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.subscription_quantity_shipped ;;
  }

  dimension: usbextension_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.usbextension_quantity_shipped ;;
  }

  dimension: wbo_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.wbo_quantity_shipped ;;
  }

  dimension: owls_quantity_shipped {
    hidden: yes
    type: number
    sql: ${og_quantity_shipped} + ${pro_quantity_shipped} ;;
  }

  dimension: hardware_quantity_shipped {
    hidden: yes
    type: number
    sql: ${og_quantity_shipped} + ${pro_quantity_shipped} + ${wbo_quantity_shipped} + ${hq_quantity_shipped} ;;
  }




# # MEASURES

  measure: sum_allitems_quantity_shipped {
    label: "All Items Quantity Shipped"
    type: sum
    sql: ${allitems_quantity_shipped} ;;
  }

  measure: sum_bundle_quantity_shipped {
    label: "Bundle Quantity Shipped"
    type: sum
    sql: ${bundle_quantity_shipped} ;;
  }

  measure: sum_hq_quantity_shipped {
    label: "Meeting HQ Quantity Shipped"
    type: sum
    sql: ${hq_quantity_shipped} ;;
  }

  measure: sum_linecord_quantity_shipped {
    label: "Line Cord Quantity Shipped"
    type: sum
    sql: ${linecord_quantity_shipped} ;;
  }

  measure: sum_lockadapter_quantity_shipped {
    label: "Lock Adapter Quantity Shipped"
    type: sum
    # sql: ${TABLE}.lockadapter_quantity_shipped ;;
    sql: ${lockadapter_quantity_shipped} ;;
  }

  measure: sum_og_quantity_shipped {
    label: "Meeting Owl OG Quantity Shipped"
    type: sum
    # sql: ${TABLE}.og_quantity_shipped ;;
    sql: ${og_quantity_shipped} ;;
  }

  measure: sum_other_quantity_shipped {
    label: "Other Quantity Shipped"
    type: sum
    # sql: ${TABLE}.other_quantity_shipped ;;
    sql: ${other_quantity_shipped} ;;
  }

  measure: sum_owlcare_quantity_shipped {
    label: "Owl Care Quantity Shipped"
    type: sum
    # sql: ${TABLE}.owlcare_quantity_shipped ;;
    sql: ${owlcare_quantity_shipped} ;;
  }

  measure: sum_powersupply_quantity_shipped {
    label: "Power Supply Quantity Shipped"
    type: sum
    # sql: ${TABLE}.powersupply_quantity_shipped ;;
    sql: ${powersupply_quantity_shipped} ;;
  }

  measure: average_pre_tax_price {
    hidden: yes
    type: average
    sql: ${pre_tax_price} ;;
  }

  measure: sum_pre_tax_price {
    label: "Subtotal Price"
    type: sum
    sql: ${pre_tax_price} ;;
  }

  measure: sum_pre_tax_price_usd {
    label: "Subtotal Price - USD"
    type: sum
    value_format_name: usd
    sql: ${pre_tax_price_usd} ;;
  }

  measure: sum_pro_quantity_shipped {
    label: "Meeting Owl Pro Quantity Shipped"
    type: sum
    sql: ${pro_quantity_shipped} ;;
  }

  measure: sum_subscription_quantity_shipped {
    label: "Subscription Quantity Shipped"
    hidden: yes
    type: sum
    sql: ${subscription_quantity_shipped} ;;
  }

  measure: sum_usbextension_quantity_shipped {
    label: "USB Extension Quantity Shipped"
    type: sum
    sql: ${usbextension_quantity_shipped} ;;
  }

  measure: sum_wbo_quantity_shipped {
    label: "Whiteboard Owl Quantity Shipped"
    type: sum
    sql: ${wbo_quantity_shipped} ;;
  }

  measure: sum_owls_quantity_shipped {
    label: "All Owls Quantity Shipped"
    description: "Combination of OG and MOP units"
    type: sum
    sql: ${owls_quantity_shipped} ;;
  }

  measure: sum_hardware_quantity_shipped {
    label: "All Hardware Quantity Shipped"
    description: "Combination of OG, MOP, WBO, and HQ units"
    type: sum
    sql: ${hardware_quantity_shipped} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [country_name, shopify_fulfillment_name, shopify_order_name]
  }
}
