view: all_orders {
  sql_table_name: public.all_orders ;;

## DIMENSIONS

  dimension: allitems_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.allitems_quantity_ordered ;;
  }

  dimension: billing_address_company {
    label: "Customer"
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: bundle_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.bundle_quantity_ordered ;;
  }

  dimension: country_name {
    label: "Market Region"
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: distribution_channel {
    hidden: yes
    type: string
    sql: ${TABLE}.distribution_channel ;;
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

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: og_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.og_quantity_ordered ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    # sql: ${TABLE}.order_date::date ;;
    sql: ${TABLE}.order_date::timestamp ;;
    # sql: case when ${TABLE}.source = 'Shopify' then ${TABLE}.order_date AT TIME ZONE 'EDT' else ${TABLE}.order_date end::date ;;

  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
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

  dimension: row_number {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  # dimension: revenue_sku {
  #   description: "This is a SKU that counts towards revenue. Excludes Replacement, Owl For Good, and Test units."
  #   type: yesno
  #   sql: case when ${sku} in ('MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-NI','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','MTW200-4000 - RPL','MTW300-1000-RPL','PTW100-1000-RPL','REF100-1000','REF200-1000','REF200-2000','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPLCMHQ101-1000','REPLCMHQ102-0000','REPLCMHQ103-0000','REPLCWBO100-1000','REPLCWBO101-0000','REPPS','REPPS - Universal','REPUSB','REPUSB - Universal','TEST2','TEST3','WBC100-1000-RPL') then False
  #     else True end;;
  # }

  dimension: sku_name {
    type: string
    sql: ${TABLE}.sku_name ;;
  }

  dimension: sku_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.sku_quantity_ordered ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
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

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
    drill_fields: [country_name]
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


## MEASURES

  # measure: count {
  #   hidden: yes
  #   type: count
  #   drill_fields: [country_name, sku_name]
  # }

  # measure: count_orders {
  #   hidden: yes
  #   label: "Count of Orders"
  #   type: count_distinct
  #   sql: ${order_id} ;;
  # }

  measure: sum_allitems_quantity_ordered {
    label: "All Items Quantity Ordered"
    type: sum
    sql: ${allitems_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_allitems_quantity_ordered]
  }

  measure: sum_bundle_quantity_ordered {
    label: "Bundle Quantity Ordered"
    type: sum
    sql: ${bundle_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_bundle_quantity_ordered]
  }

  measure: sum_hq_quantity_ordered {
    label: "Meeting HQ Quantity Ordered"
    type: sum
    sql: ${hq_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_hq_quantity_ordered]
  }

  measure: sum_linecord_quantity_ordered {
    label: "Line Cord Quantity Ordered"
    type: sum
    sql: ${linecord_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_linecord_quantity_ordered]
  }

  measure: sum_lockadapter_quantity_ordered {
    label: "Lock Adapter Quantity Ordered"
    type: sum
    sql: ${lockadapter_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_lockadapter_quantity_ordered]
  }

  measure: sum_og_quantity_ordered {
    label: "Meeting Owl OG Quantity Ordered"
    type: sum
    sql: ${og_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_og_quantity_ordered]
  }

  measure: sum_other_quantity_ordered {
    label: "Other Quantity Ordered"
    type: sum
    sql: ${other_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_other_quantity_ordered]
  }

  measure: sum_owlcare_quantity_ordered {
    label: "Owl Care Quantity Ordered"
    type: sum
    sql: ${owlcare_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_owlcare_quantity_ordered]
  }

  measure: sum_powersupply_quantity_ordered {
    label: "Power Supply Quantity Ordered"
    type: sum
    sql: ${powersupply_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_powersupply_quantity_ordered]
  }

  measure: sum_pro_quantity_ordered {
    label: "Meeting Owl Pro Quantity Ordered"
    type: sum
    sql: ${pro_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_pro_quantity_ordered]
  }

  measure: sum_subscription_quantity_ordered {
    hidden: yes
    label: "Subscription Quantity Ordered"
    type: sum
    sql: ${subscription_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku]
  }

  measure: sum_usbextension_quantity_ordered {
    label: "USB Extension Quantity Ordered"
    type: sum
    sql: ${usbextension_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_usbextension_quantity_ordered]
  }

  measure: sum_wbo_quantity_ordered {
    label: "Whiteboard Owl Quantity Ordered"
    type: sum
    sql: ${wbo_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_wbo_quantity_ordered]
  }

  measure: sum_owls_quantity_ordered {
    label: "All Owls Quantity Ordered"
    description: "Combination of OG and MOP units"
    type: sum
    sql: ${owls_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_owls_quantity_ordered]
  }

  measure: sum_hardware_quantity_ordered {
    label: "All Hardware Quantity Ordered"
    description: "Combination of OG, MOP, WBO, and HQ units"
    type: sum
    sql: ${hardware_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_hardware_quantity_ordered]
  }

  measure: sum_sku_quantity_ordered {
    label: "SKU Quantity Ordered"
    description: "Count of orders for each SKU"
    type: sum
    sql: ${sku_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_sku_quantity_ordered]
  }

  measure: max_date {
    hidden: yes
    type: date
    sql: max(${order_date}) ;;
  }

}
