view: shopify_fulfillments_line_items_view {
  label: "Shopify Fulfillments"
  sql_table_name: public.shopify_fulfillments_line_items_view ;;
  drill_fields: [shipping_address_company, shopify_order_name, sum_revenue_usd]


# # DIMENSIONS

  dimension: billing_address_address1 {
    label: "Bill Address Line 1"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_address1 ;;
  }

  dimension: billing_address_address2 {
    label: "Bill Address Line 2"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_address2 ;;
  }

  dimension: billing_address_city {
    label: "Bill City"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_city ;;
  }

  dimension: billing_address_company {
    label: "Bill Company Name"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: billing_address_country_name {
    label: "Bill Country Name"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_country_name ;;
  }

  dimension: billing_address_country_code {
    label: "Bill Country Code"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_country_code ;;
  }

  dimension: billing_address_name {
    label: "Bill Addressee"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_name ;;
  }

  dimension: billing_address_phone {
    label: "Bill Phone Number"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_phone ;;
  }

  dimension: billing_address_province {
    label: "Bill State/Province Name"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_province ;;
  }

  dimension: billing_address_province_code {
    label: "Bill State/Province Code"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_province_code ;;
  }

  dimension: billing_address_zip {
    label: "Bill Zip Code"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_zip ;;
  }

  dimension: billing_world_region {
    label: "Bill World Region"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_world_region ;;
  }

  dimension: contact_email {
    label: "Customer Email"
    # group_label: "Customer Info"
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: cx_team {
    label: "CX Team"
    type:  string
    sql: ${TABLE}.cx_team ;;
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
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.fulfillment_date::timestamp ;;
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

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue ;;
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

  dimension: price_per_item {
    hidden: yes
    type: number
    sql: ${TABLE}.price_per_item ;;
  }

  dimension: revenue_usd {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue_usd ;;
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

  dimension: shipping_address_address1 {
    label: "Ship Address Line 1"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_address1 ;;
  }

  dimension: shipping_address_address2 {
    label: "Ship Address Line 2"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_address2 ;;
  }

  dimension: shipping_address_city {
    label: "Ship City"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_city ;;
  }

  dimension: shipping_address_company {
    label: "Ship Company Name"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: shipping_address_country_code {
    label: "Ship Country Code"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_country_code ;;
  }

  dimension: country_name {
    label: "Ship Country Name"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_country_name ;;
  }

  dimension: shipping_address_name {
    label: "Ship Addressee"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_name ;;
  }

  dimension: shipping_address_province {
    label: "Ship State/Province Name"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_province ;;
  }

  dimension: shipping_address_province_code {
    label: "Ship State/Province Code"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_province_code ;;
  }

  dimension: shipping_address_zip {
    label: "Ship Zip Code"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_zip ;;
  }

  dimension: world_region {
    label: "Ship World Region"
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_world_region ;;
  }

  dimension: shopify_fulfillment_name {
    label: "Fulfillment Name"
    type: string
    sql: ${TABLE}.fulfillment_name ;;
  }

  dimension: shopify_order_name {
    label: "Order Name"
    type: string
    sql: ${TABLE}.order_name ;;
  }

  dimension: cam_name {
    label: "CAM"
    type: string
    sql: ${TABLE}.cam_name ;;
  }

  dimension: sales_rep {
    type: string
    sql: ${TABLE}.sales_rep_name;;
    # drill_fields: [billing_address_company, shopify_order_name, sum_revenue_usd]
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: revenue_sku {
    description: "Identifies if SKU counts towards revenue. 'No' includes replacement, Owl for Good, and test SKUs."
    type: yesno
    sql: CASE WHEN ${sku} IN ('EXM100-1000-RPL','MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','MTW200-4000 - RPL','MTW200-4000-RPL','MTW300-1000-RPL','MTW300-2000-RPL','PTW100-1000-RPL','REF100-1000','REF200-1000','REF200-2000','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPLCMHQ101-1000','REPLCMHQ102-0000','REPLCMHQ103-0000','REPLCWBO100-1000','REPLCWBO101-0000','REPPS - Universal','REPPS','REPUSB - Universal','REPUSB','TEST2','TEST3','VAT','WBC100-1000-RPL', 'MTW300-2000-DEMO') then False
      ELSE True END ;;
    # sql: CASE WHEN ${sku} LIKE 'BND%' THEN False
    #           WHEN ${sku} LIKE 'PPKU%' THEN False
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

  dimension: ceilingmount_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.ceilingmount_quantity_shipped ;;
  }

  dimension: cuecards_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.cuecards_quantity_shipped ;;
  }

  dimension: hardcase_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.hardcase_quantity_shipped ;;
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

  dimension: markers_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.markers_quantity_shipped ;;
  }

  dimension: mic_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.mic_quantity_shipped ;;
  }

  dimension: mo3_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.mo3_quantity_shipped ;;
  }

  dimension: og_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.og_quantity_shipped ;;
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

  dimension: raas_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.raas_quantity_shipped ;;
  }

  dimension: replacement_unit_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.replacement_unit_shipped ;;
  }

  dimension: subscription_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.subscription_quantity_shipped ;;
  }

  dimension: tablemount_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.tablemount_quantity_shipped ;;
  }

  dimension: tripod_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.tripod_quantity_shipped ;;
  }

  dimension: usbconversioncable_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.usbconversioncable_quantity_shipped ;;
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

  dimension: wbtags_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.wbtags_quantity_shipped ;;
  }

  dimension: owls_quantity_shipped {
    hidden: yes
    type: number
    sql: ${og_quantity_shipped} + ${pro_quantity_shipped} + ${mo3_quantity_shipped} ;;
  }

  dimension: hardware_quantity_shipped {
    hidden: yes
    type: number
    sql: ${og_quantity_shipped} + ${pro_quantity_shipped} + ${wbo_quantity_shipped} + ${hq_quantity_shipped} + ${mo3_quantity_shipped} ;;
  }




# # MEASURES

  measure: count {
    hidden: yes
    type: count
    drill_fields: [country_name, shopify_fulfillment_name, shopify_order_name]
  }

  measure: sum_allitems_quantity_shipped {
    hidden: yes
    label: "All Items Quantity Shipped"
    type: sum
    sql: ${allitems_quantity_shipped} ;;
  }

  measure: sum_bundle_quantity_shipped {
    label: "Bundle Quantity Shipped"
    hidden: yes
    type: sum
    sql: ${bundle_quantity_shipped} ;;
  }

  measure: sum_ceilingmount_quantity_shipped {
    label: "Ceiling Mount Bundle Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${ceilingmount_quantity_shipped} ;;
  }

  measure: sum_cuecards_quantity_shipped {
    label: "Cue Cards Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${cuecards_quantity_shipped} ;;
  }

  measure: sum_hardcase_quantity_shipped {
    label: "Hard Case Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${hardcase_quantity_shipped} ;;
  }

  measure: sum_hq_quantity_shipped {
    label: "Meeting HQ Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${hq_quantity_shipped} ;;
  }

  measure: sum_linecord_quantity_shipped {
    label: "Line Cord Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${linecord_quantity_shipped} ;;
  }

  measure: sum_lockadapter_quantity_shipped {
    label: "Lock Adapter Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${lockadapter_quantity_shipped} ;;
  }

  measure: sum_markers_quantity_shipped {
    label: "Whiteboard Markers Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${markers_quantity_shipped} ;;
  }

  measure: sum_mic_quantity_shipped {
    label: "Expansion Mic Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${mic_quantity_shipped} ;;
  }

  measure: sum_mo3_quantity_shipped {
    label: "Meeting Owl 3 Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${mo3_quantity_shipped} ;;
  }

  measure: sum_og_quantity_shipped {
    label: "Meeting Owl Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${og_quantity_shipped} ;;
  }

  measure: sum_owlcare_quantity_shipped {
    hidden: yes
    label: "Owl Care Quantity Shipped"
    # group_label: "Digital"
    type: sum
    sql: ${owlcare_quantity_shipped} ;;
  }

  measure: sum_powersupply_quantity_shipped {
    label: "Power Supply Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${powersupply_quantity_shipped} ;;
  }

  measure: sum_pro_quantity_shipped {
    label: "Meeting Owl Pro Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${pro_quantity_shipped} ;;
  }

  # measure: sum_raas_quantity_shipped {
  #   hidden: yes
  #   label: "RaaS Quantity Shipped"
  #   type: sum
  #   sql: ${pro_quantity_shipped} ;;
  # }

  # measure: sum_replacement_unit_shipped {
  #   hidden: yes
  #   label: "Replacement Quantity Shipped"
  #   type: sum
  #   sql: ${replacement_unit_shipped} ;;
  # }

  measure: sum_subscription_quantity_shipped {
    hidden: yes
    label: "Subscription Quantity Shipped"
    # group_label: "Digital"
    type: sum
    sql: ${subscription_quantity_shipped} ;;
  }

  measure: sum_tablemount_quantity_shipped {
    label: "Table Mount Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${tablemount_quantity_shipped} ;;
  }

  measure: sum_tripod_quantity_shipped {
    label: "Tripod Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${tripod_quantity_shipped} ;;
  }

  measure: sum_usbconversioncable_quantity_shipped {
    label: "USB Conversion Cable Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${usbconversioncable_quantity_shipped} ;;
  }

  measure: sum_usbextension_quantity_shipped {
    label: "USB Extension Cable Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${usbextension_quantity_shipped} ;;
  }

  measure: sum_wbo_quantity_shipped {
    label: "Whiteboard Owl Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${wbo_quantity_shipped} ;;
  }

  measure: sum_wbtags_quantity_shipped {
    label: "Whiteboard Tags Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${wbtags_quantity_shipped} ;;
  }

  measure: sum_owls_quantity_shipped {
    label: "All Owls Quantity Shipped"
    description: "Combination of OG, MOP, and MO3 units"
    group_label: "Hardware"
    type: sum
    sql: ${owls_quantity_shipped} ;;
  }

  measure: sum_hardware_quantity_shipped {
    label: "All Hardware Quantity Shipped"
    description: "Combination of OG, MOP, MO3, WBO, and HQ units"
    group_label: "Hardware"
    type: sum
    sql: ${hardware_quantity_shipped} ;;
  }

  measure: sum_revenue {
    label: "Revenue"
    group_label: "Revenue"
    type: sum
    sql: ${revenue} ;;
  }

  measure: sum_revenue_usd {
    label: "Revenue - USD"
    group_label: "Revenue"
    type: sum
    value_format_name: usd
    sql: ${revenue_usd} ;;
    # drill_fields: [billing_address_company, shopify_order_name, sum_revenue_usd]
  }

}
