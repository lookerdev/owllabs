view: shopify_orders_line_items_view {
  label: "Shopify Orders"
  sql_table_name: public.shopify_orders_line_items_view ;;


  dimension: billing_address_company {
    label: "Bill Company Name"
    group_label: "Billing Address"
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
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.closed_at::timestamp ;;
  }

  dimension: contact_email {
    label: "Email"
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: country_name {
    # label: "Market Region"
    label: "Bill Country Name"
    description: "Billing address country, previously labeled 'Market Region'"
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.country_name ;;
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

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  # dimension: netsuite_customer_internalid {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.netsuite_customer_internalid ;;
  # }

  # dimension: netsuite_customer_name {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.netsuite_customer_name ;;
  # }

  # dimension: netsuite_sales_order_number {
  #   type: string
  #   sql: ${TABLE}.netsuite_sales_order_number ;;
  # }

  # dimension: netsuite_sales_rep {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.netsuite_sales_rep ;;
  # }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date::timestamp ;;
  }

  dimension: order_id {
    hidden: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_name {
    # label: "Shopify Order Name"
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
    label: "SKU Quantity Ordered"
    type: number
    sql: ${TABLE}.quantity_ordered ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }

  # dimension: sales_order_internalid {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.sales_order_internalid ;;
  # }


  dimension: cam_name {
    label: "CAM"
    type: string
    sql: ${TABLE}.cam_name ;;
  }

  dimension: sales_rep {
    type: string
    sql: ${TABLE}.sales_rep_name ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: revenue_sku {
    description: "Identifies if SKU counts towards revenue. 'No' includes replacement, Owl for Good, and test SKUs."
    type: yesno
    sql: CASE WHEN ${sku} IN ('EXM100-1000-RPL','EXM100-1000-DEMO','MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','MTW200-4000 - RPL','MTW200-4000-RPL','MTW300-1000-RPL','MTW300-2000-RPL','PTW100-1000-RPL','REF100-1000','REF200-1000','REF200-2000','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPLCMHQ101-1000','REPLCMHQ102-0000','REPLCMHQ103-0000','REPLCWBO100-1000','REPLCWBO101-0000','REPPS - Universal','REPPS','REPUSB - Universal','REPUSB','TEST2','TEST3','VAT','WBC100-1000-RPL','MTW300-2000-DEMO') then False
      ELSE True END ;;
    # sql: CASE WHEN ${sku} LIKE 'BND%' THEN False
    #           WHEN ${sku} LIKE 'PPKU%' THEN False
  }

  # dimension: bundle_sku {
  #   description: "Identifies whether SKU is a bundle parent SKU"
  #   # hidden: yes
  #   type: yesno
  #   sql: CASE WHEN ${sku} LIKE 'BND%' THEN True
  #             WHEN ${sku} LIKE 'PPKU%' THEN True
  #             ELSE False End ;;
  # }

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

  dimension: ceilingmount_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.ceilingmount_quantity_ordered ;;
  }

  dimension: cuecards_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.cuecards_quantity_ordered ;;
  }

  dimension: hardcase_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.hardcase_quantity_ordered ;;
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

  dimension: markers_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.markers_quantity_ordered ;;
  }

  dimension: mic_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.mic_quantity_ordered ;;
  }

  dimension: mo3_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.mo3_quantity_ordered ;;
  }

  dimension: og_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.og_quantity_ordered ;;
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

  dimension: raas_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.raas_quantity_ordered ;;
  }

  dimension: replacement_unit_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.replacement_unit_ordered ;;
  }

  dimension: subscription_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.subscription_quantity_ordered ;;
  }

  dimension: tablemount_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.tablemount_quantity_ordered ;;
  }

  dimension: tripod_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.tripod_quantity_ordered ;;
  }

  dimension: usbconversioncable_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.usbconversioncable_quantity_ordered ;;
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

  dimension: wbtags_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.wbtags_quantity_ordered ;;
  }

  dimension: owls_quantity_ordered {
    hidden: yes
    type: number
    sql: ${og_quantity_ordered} + ${pro_quantity_ordered} + ${mo3_quantity_ordered} ;;
  }

  dimension: hardware_quantity_ordered {
    hidden: yes
    type: number
    sql: ${og_quantity_ordered} + ${pro_quantity_ordered} + ${wbo_quantity_ordered} + ${hq_quantity_ordered} + ${mo3_quantity_ordered} ;;
  }



# # MEASURES

  measure: count {
    hidden: yes
    type: count
    drill_fields: [country_name, billing_address_company, order_name]
  }

  measure: count_orders {
    label: "Count of Orders"
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: sum_allitems_quantity_ordered {
    hidden: yes
    label: "All Items Quantity Ordered"
    type: sum
    sql: ${allitems_quantity_ordered} ;;
  }

  measure: sum_bundle_quantity_ordered {
    hidden: yes
    label: "Bundle Quantity Ordered"
    type: sum
    sql: ${bundle_quantity_ordered} ;;
  }

  measure: sum_ceilingmount_quantity_ordered {
    label: "Ceiling Mount Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${ceilingmount_quantity_ordered} ;;
  }

  measure: sum_cuecards_quantity_ordered {
    label: "Cue Cards Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${cuecards_quantity_ordered} ;;
  }

  measure: sum_hardcase_quantity_ordered {
    label: "Hard Case Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${hardcase_quantity_ordered} ;;
  }

  measure: sum_hq_quantity_ordered {
    label: "Meeting HQ Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${hq_quantity_ordered} ;;
  }

  measure: sum_linecord_quantity_ordered {
    label: "Line Cord Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${linecord_quantity_ordered} ;;
  }

  measure: sum_lockadapter_quantity_ordered {
    label: "Lock Adapter Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${lockadapter_quantity_ordered} ;;
  }

  measure: sum_markers_quantity_ordered {
    label: "Whiteboard Markers Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${markers_quantity_ordered} ;;
  }

  measure: sum_mic_quantity_ordered {
    label: "Expansion Mic Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${mic_quantity_ordered} ;;
  }

  measure: sum_mo3_quantity_ordered {
    label: "Meeting Owl 3 Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${mo3_quantity_ordered} ;;
  }

  measure: sum_og_quantity_ordered {
    label: "Meeting Owl Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${og_quantity_ordered} ;;
  }

  measure: sum_owlcare_quantity_ordered {
    label: "Owl Care Quantity Ordered"
    group_label: "Digital"
    type: sum
    sql: ${owlcare_quantity_ordered} ;;
  }

  measure: sum_powersupply_quantity_ordered {
    label: "Power Supply Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${powersupply_quantity_ordered} ;;
  }

  measure: sum_pro_quantity_ordered {
    label: "Meeting Owl Pro Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${pro_quantity_ordered} ;;
  }

  measure: sum_raas_quantity_ordered {
    hidden: yes
    label: "RaaS Quantity Ordered"
    type: sum
    sql: ${raas_quantity_ordered} ;;
  }

  measure: sum_replacement_unit_ordered {
    hidden: yes
    type: sum
    sql: ${replacement_unit_ordered} ;;
  }

  measure: sum_subscription_quantity_ordered {
    label: "Subscription Quantity Ordered"
    group_label: "Digital"
    type: sum
    sql: ${subscription_quantity_ordered} ;;
  }

  measure: sum_tablemount_quantity_ordered {
    label: "Table Mount Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${tablemount_quantity_ordered} ;;
  }

  measure: sum_tripod_quantity_ordered {
    label: "Tripod Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${tripod_quantity_ordered} ;;
  }

  measure: sum_usbconversioncable_quantity_ordered {
    label: "USB Conversion Cable Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${usbconversioncable_quantity_ordered} ;;
  }

  measure: sum_usbextension_quantity_ordered {
    label: "USB Extension Cable Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${usbextension_quantity_ordered} ;;
  }

  measure: sum_wbo_quantity_ordered {
    label: "Whiteboard Owl Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${wbo_quantity_ordered} ;;
  }

  measure: sum_wbtags_quantity_ordered {
    label: "Whiteboard Tags Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${wbtags_quantity_ordered} ;;
  }

  measure: sum_pre_tax_price {
    label: "Subtotal Price"
    group_label: "Subtotal"
    type: sum
    sql: ${pre_tax_price} ;;
  }

  measure: sum_pre_tax_price_usd {
    label: "Subtotal Price - USD"
    group_label: "Subtotal"
    type: sum
    value_format_name: usd
    sql: ${pre_tax_price_usd} ;;
  }

  measure: sum_owls_quantity_ordered {
    label: "All Owls Quantity Ordered"
    description: "Combination of OG, MOP, and MO3 units"
    group_label: "Hardware"
    type: sum
    sql: ${owls_quantity_ordered} ;;
  }

  measure: sum_hardware_quantity_ordered {
    label: "All Hardware Quantity Ordered"
    description: "Combination of OG, MOP, MO3, WBO, and HQ units"
    group_label: "Hardware"
    type: sum
    sql: ${hardware_quantity_ordered} ;;
  }

  measure: sum_quantity_ordered {
    label: "SKU Quantity Ordered"
    description: "Count of orders for each SKU"
    type: sum
    sql: ${quantity_ordered} ;;
  }

}
