view: all_orders {
  sql_table_name: public.all_orders ;;

## DIMENSIONS

  parameter: timeframe_picker {
    label: "Date Granularity"
    # type: unquoted
    type: string
    default_value: "date_month"
    allowed_value: {
      value: "date_date"
      label: "Date"
    }
    allowed_value: {
      value: "date_week"
      label: "Week"
    }
    allowed_value: {
      value: "date_month"
      label: "Month"
    }
  }

  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'date_date' THEN TO_DATE(${order_date}, 'YYYY-MM-DD')
    WHEN {% parameter timeframe_picker %} = 'date_week' THEN TO_DATE(${order_week}, 'YYYY-MM-DD')
    WHEN {% parameter timeframe_picker %} = 'date_month' THEN TO_DATE(${order_month}, 'YYYY-MM')
    END ;;
  }

  dimension: row_number {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: billing_address_company {
    label: "Customer"
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: country_name {
    label: "Market Region"
    type: string
    sql: ${TABLE}.country_name ;;
  }

  # dimension: distribution_channel {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.distribution_channel ;;
  # }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

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

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: revenue_sku {
    description: "Identifies if SKU counts towards revenue. Yes = yes it does / No = nope (Replacement, Owl For Good, and Test SKUs)."
    type: yesno
    sql: case when ${sku} in ('MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','MTW200-4000 - RPL','MTW300-1000-RPL','PTW100-1000-RPL','REF100-1000','REF200-1000','REF200-2000','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPLCMHQ101-1000','REPLCMHQ102-0000','REPLCMHQ103-0000','REPLCWBO100-1000','REPLCWBO101-0000','REPPS','REPPS - Universal','REPUSB','REPUSB - Universal','TEST2','TEST3','VAT','WBC100-1000-RPL') then False
      else True end;;
  }

  dimension: sku_name {
    type: string
    sql: ${TABLE}.sku_name ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
    drill_fields: [country_name]
  }

  dimension: sku_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.sku_quantity_ordered ;;
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

  dimension: usbextension_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.usbextension_quantity_ordered ;;
  }

  dimension: usbconversioncable_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.usbconversioncable_quantity_ordered ;;
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

  measure: sum_sku_quantity_ordered {
    label: "SKU Quantity Ordered"
    description: "Count of orders for each SKU"
    type: sum
    sql: ${sku_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_sku_quantity_ordered]
  }

  measure: sum_allitems_quantity_ordered {
    label: "All Items Quantity Ordered"
    type: sum
    sql: ${allitems_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_allitems_quantity_ordered]
  }

  measure: sum_bundle_quantity_ordered {
    label: "Bundle Quantity Ordered"
    hidden: yes
    type: sum
    sql: ${bundle_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_bundle_quantity_ordered]
  }

  measure: sum_ceilingmount_quantity_ordered {
    label: "Ceiling Mount Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${ceilingmount_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_ceilingmount_quantity_ordered]
  }

  measure: sum_cuecards_quantity_ordered {
    label: "Cue Cards Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${cuecards_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_cuecards_quantity_ordered]
  }

  measure: sum_hardcase_quantity_ordered {
    label: "Hard Case Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${hardcase_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_hardcase_quantity_ordered]
  }

  measure: sum_hq_quantity_ordered {
    label: "Meeting HQ Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${hq_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_hq_quantity_ordered]
  }

  measure: sum_linecord_quantity_ordered {
    label: "Line Cord Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${linecord_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sum_linecord_quantity_ordered]
  }

  measure: sum_lockadapter_quantity_ordered {
    label: "Lock Adapter Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${lockadapter_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_lockadapter_quantity_ordered]
  }

  measure: sum_markers_quantity_ordered {
    label: "Whiteboard Markers Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${markers_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_markers_quantity_ordered]
  }

  measure: sum_mic_quantity_ordered {
    label: "Expansion Mic Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${mic_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_mic_quantity_ordered]
  }

  measure: sum_mo3_quantity_ordered {
    label: "Meeting Owl 3 Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${mo3_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_mo3_quantity_ordered]
  }

  measure: sum_og_quantity_ordered {
    label: "Meeting Owl Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${og_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_og_quantity_ordered]
  }

  measure: sum_owlcare_quantity_ordered {
    label: "Owl Care Quantity Ordered"
    type: sum
    sql: ${owlcare_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_owlcare_quantity_ordered]
  }

  measure: sum_powersupply_quantity_ordered {
    label: "Power Supply Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${powersupply_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_powersupply_quantity_ordered]
  }

  measure: sum_pro_quantity_ordered {
    label: "Meeting Owl Pro Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${pro_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_pro_quantity_ordered]
  }

  measure: sum_raas_quantity_ordered {
    label: "RaaS Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${raas_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_raas_quantity_ordered]
  }

  measure: sum_replacement_unit_ordered {
    hidden: yes
    label: "Replacement Quantity Ordered"
    type: sum
    sql: ${replacement_unit_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_replacement_unit_ordered]
  }

  measure: sum_tablemount_quantity_ordered {
    label: "Table Mount Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${tablemount_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_tablemount_quantity_ordered]
  }

  measure: sum_subscription_quantity_ordered {
    hidden: yes
    label: "Subscription Quantity Ordered"
    type: sum
    sql: ${subscription_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_subscription_quantity_ordered]
  }

  measure: sum_usbconversioncable_quantity_ordered {
    label: "USB Conversion Cable Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${usbconversioncable_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_usbconversioncable_quantity_ordered]
  }

  measure: sum_usbextension_quantity_ordered {
    label: "USB Extension Cable Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${usbextension_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_usbextension_quantity_ordered]
  }

  measure: sum_wbo_quantity_ordered {
    label: "Whiteboard Owl Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${wbo_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_wbo_quantity_ordered]
  }

  measure: sum_wbtags_quantity_ordered {
    label: "Whiteboard Tags Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${wbtags_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_wbtags_quantity_ordered]
  }

  measure: sum_owls_quantity_ordered {
    label: "All Owls Quantity Ordered"
    description: "Combination of OG, MOP, and MO3 units"
    group_label: "Hardware"
    type: sum
    sql: ${owls_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_owls_quantity_ordered]
  }

  measure: sum_hardware_quantity_ordered {
    label: "All Hardware Quantity Ordered"
    description: "Combination of OG, MOP, MO3, WBO, HQ units"
    group_label: "Hardware"
    type: sum
    sql: ${hardware_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, country_name, sku, sum_hardware_quantity_ordered]
  }


  measure: max_date {
    hidden: yes
    type: date
    sql: max(${order_date}) ;;
  }

}
