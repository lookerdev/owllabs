view: all_orders {
  sql_table_name: public.all_orders ;;


## PARAMETERS

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

  parameter: pivot_picker {
    hidden: yes
    # label: "Slice Dimension"
    type: string
    default_value: "sales_channel"
    allowed_value: {
      value: "sales_channel"
      label: "Sales Channel"
    }
    allowed_value: {
      value: "world_region"
      label: "World Region"
    }
  }


## DIMENSIONS

  dimension: dynamic_pivot {
    hidden: yes
    # label: "Slice Dimension"
    description: "Use with Slice Dimension parameter"
    type: string
    sql:
    CASE
    WHEN {% parameter pivot_picker %} = 'sales_channel' THEN ${sales_channel}
    WHEN {% parameter pivot_picker %} = 'world_region' THEN ${world_region}
    END ;;
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
    # customer
    label: "Billing Company Name"
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: country_name {
    # label: "Market Region"
    description: "Billing address country, previously labeled 'Market Region'"
    type: string
    sql: ${TABLE}.country_name ;;
    map_layer_name: countries
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
      day_of_week,
      month,
      quarter,
      year
    ]
    # sql: ${TABLE}.order_date::date ;;
    sql: ${TABLE}.order_date::timestamp ;;
    # sql: case when ${TABLE}.source = 'Shopify' then ${TABLE}.order_date AT TIME ZONE 'EDT' else ${TABLE}.order_date end::date ;;
  }

  dimension: week_part {
    group_label: "Order Date"
    type: string
    sql: case when ${order_day_of_week} in ('Saturday','Sunday') then 'Weekend'
              else 'Weekday'
              end ;;
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

  dimension: revenue_item {
    description: "Identifies if item counts towards revenue. 'No' includes items sold for $0 (replacements, Owl for Good, etc.)"
    type: yesno
    sql: ${TABLE}.revenue_item ;;
  }

  dimension: sku_name {
    hidden: yes
    type: string
    sql: ${TABLE}.sku_name ;;
  }

  dimension: sku_name_group {
    label: "SKU Name"
    type: string
    sql: case when ${sku} = 'ACC100-1000' then 'Owl Lock Adapter'
              when ${sku} in ('ACC100-2000','ACC100-2000-CA','ACC100-2001') then 'USB Extension Cable (16 Feet/5M)'
              when ${sku} = 'ACCMTW100-0000' then 'Meeting Owl Hard Case'
              when ${sku} = 'ACCMTW300-0000' then 'Meeting Owl 3 Lock Adapter'
              when ${sku} = 'ACCMTW300-0002' then 'USB C to C Cable (16 Feet / 4.87M)'
              when ${sku} = 'EXM100-1000' then 'Expansion Mic'
              when ${sku} in ('MTW100-1000','MTW100-1000-CA','MTW100-2000') then 'Meeting Owl'
              when ${sku} in ('MTW200-1000','MTW200-2000','MTW200-3000','MTW200-4000') then 'Meeting Owl Pro'
              when ${sku} in ('MTW300-1000','MTW300-2000') then 'Meeting Owl 3'
              when ${sku} = 'OCW100-1000' then 'Owl Care - Meeting Owl'
              --when ${sku} in ('PPK100-0000','PPK100-2000') then 'Premium Pack: Meeting Owl'
              --when ${sku} in ('PPK200-0000','PPK200-0000-CAAR') then 'Premium Pack: Meeting Owl Pro'
              when ${sku} = 'PTW100-1000' then 'Meeting HQ'
              when ${sku} = 'SUB100-1000' then 'Meeting HQ Subscription'
              when ${sku} = 'SUB200-1000' then 'Whiteboard Owl Subscription'
              when ${sku} = 'WBC100-1000' then 'Whiteboard Owl'
              else ${sku_name}
        end;;
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

  dimension: softcase_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.softcase_quantity_ordered ;;
  }

  dimension: stand_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.stand_quantity_ordered ;;
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

  dimension: owlbar_quantity_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.owlbar_quantity_ordered ;;
  }

  dimension: owls_quantity_ordered {
    hidden: yes
    type: number
    sql: ${og_quantity_ordered} + ${pro_quantity_ordered} + ${mo3_quantity_ordered} ;;
  }

  dimension: hardware_quantity_ordered {
    hidden: yes
    type: number
    sql: ${og_quantity_ordered} + ${pro_quantity_ordered} + ${wbo_quantity_ordered} + ${hq_quantity_ordered} + ${mo3_quantity_ordered} + ${owlbar_quantity_ordered} ;;
  }


## MEASURES

  # measure: count {
  #   hidden: yes
  #   type: count
  #   drill_fields: [country_name, sku_name]
  # }

  measure: count_orders {
    label: "Count of Orders"
    type: count_distinct
    sql: ${order_number} ;;
    drill_fields: [order_number]
    # drill_fields: [order_number, sku, count_sku]
  }

  # measure: count_sku {
  #   label: "Count of SKU"
  #   type: count
  #   sql: ${sku} ;;
  # }


  measure: sum_sku_quantity_ordered {
    label: "SKU Quantity Ordered"
    description: "Count of orders for each SKU"
    type: sum
    sql: ${sku_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_sku_quantity_ordered]
  }

  measure: sum_allitems_quantity_ordered {
    hidden: yes
    label: "All Items Quantity Ordered"
    type: sum
    sql: ${allitems_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_allitems_quantity_ordered]
  }

  measure: sum_bundle_quantity_ordered {
    label: "Bundle Quantity Ordered"
    hidden: yes
    type: sum
    sql: ${bundle_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_bundle_quantity_ordered]
  }

  measure: sum_ceilingmount_quantity_ordered {
    label: "Ceiling Mount Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${ceilingmount_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_ceilingmount_quantity_ordered]
  }

  measure: sum_cuecards_quantity_ordered {
    label: "Cue Cards Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${cuecards_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_cuecards_quantity_ordered]
  }

  measure: sum_hardcase_quantity_ordered {
    label: "Hard Case Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${hardcase_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_hardcase_quantity_ordered]
  }

  measure: sum_hq_quantity_ordered {
    label: "Meeting HQ Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${hq_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_hq_quantity_ordered]
  }

  measure: sum_linecord_quantity_ordered {
    label: "Line Cord Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${linecord_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_linecord_quantity_ordered]
  }

  measure: sum_lockadapter_quantity_ordered {
    label: "Lock Adapter Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${lockadapter_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_lockadapter_quantity_ordered]
  }

  measure: sum_markers_quantity_ordered {
    label: "Whiteboard Markers Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${markers_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_markers_quantity_ordered]
  }

  measure: sum_mic_quantity_ordered {
    label: "Expansion Mic Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${mic_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_mic_quantity_ordered]
  }

  measure: sum_mo3_quantity_ordered {
    label: "Meeting Owl 3 Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${mo3_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_mo3_quantity_ordered]
  }

  measure: sum_og_quantity_ordered {
    label: "Meeting Owl Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${og_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_og_quantity_ordered]
  }

  measure: sum_owlcare_quantity_ordered {
    hidden: yes
    label: "Owl Care Quantity Ordered"
    type: sum
    sql: ${owlcare_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_owlcare_quantity_ordered]
  }

  measure: sum_powersupply_quantity_ordered {
    label: "Power Supply Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${powersupply_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_powersupply_quantity_ordered]
  }

  measure: sum_pro_quantity_ordered {
    label: "Meeting Owl Pro Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${pro_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_pro_quantity_ordered]
  }

  measure: sum_raas_quantity_ordered {
    hidden: yes
    label: "RaaS Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${raas_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_raas_quantity_ordered]
  }

  measure: sum_replacement_unit_ordered {
    hidden: yes
    label: "Replacement Quantity Ordered"
    type: sum
    sql: ${replacement_unit_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_replacement_unit_ordered]
  }

  measure: sum_tablemount_quantity_ordered {
    label: "Table Mount Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${tablemount_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_tablemount_quantity_ordered]
  }

  measure: sum_tripod_quantity_ordered {
    label: "Tripod Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${tripod_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_tripod_quantity_ordered]
  }

  measure: sum_subscription_quantity_ordered {
    hidden: yes
    label: "Subscription Quantity Ordered"
    type: sum
    sql: ${subscription_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_subscription_quantity_ordered]
  }

  measure: sum_softcase_quantity_ordered {
    label: "Soft Case Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${softcase_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_softcase_quantity_ordered]
  }

  measure: sum_stand_quantity_ordered {
    label: "Stand Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${stand_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_stand_quantity_ordered]
  }

  measure: sum_usbconversioncable_quantity_ordered {
    label: "USB Conversion Cable Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${usbconversioncable_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_usbconversioncable_quantity_ordered]
  }

  measure: sum_usbextension_quantity_ordered {
    label: "USB Extension Cable Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${usbextension_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_usbextension_quantity_ordered]
  }

  measure: sum_wbo_quantity_ordered {
    label: "Whiteboard Owl Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${wbo_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_wbo_quantity_ordered]
  }

  measure: sum_wbtags_quantity_ordered {
    label: "Whiteboard Tags Quantity Ordered"
    group_label: "Accessories"
    type: sum
    sql: ${wbtags_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_wbtags_quantity_ordered]
  }

  measure: sum_owlbar_quantity_ordered {
    label: "Owl Bar Quantity Ordered"
    group_label: "Hardware"
    type: sum
    sql: ${owlbar_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_owlbar_quantity_ordered]
  }

  measure: sum_owls_quantity_ordered {
    label: "All Owls Quantity Ordered"
    description: "Combination of OG, MOP, and MO3 units"
    group_label: "Hardware"
    type: sum
    sql: ${owls_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_owls_quantity_ordered]
  }

  measure: sum_hardware_quantity_ordered {
    label: "All Hardware Quantity Ordered"
    description: "Combination of OG, MOP, MO3, WBO, HQ units"
    group_label: "Hardware"
    type: sum
    sql: ${hardware_quantity_ordered} ;;
    drill_fields: [sales_channel, world_region, order_number, billing_address_company, sku, sum_hardware_quantity_ordered]
  }

  measure: max_date {
    hidden: yes
    type: date
    sql: max(${order_date}) ;;
  }


# Avg sales rates

  measure: avg_hardware_ordered_per_day {
    hidden: yes
    label: "Avg. Hardware Daily Rate"
    group_label: "Avg. Daily Rate"
    type: number
    value_format: "0.#"
    sql: sum(${hardware_quantity_ordered}) * 1.0 / count(distinct ${order_date}) ;;
  }

  measure: avg_mo3_ordered_per_day {
    hidden: yes
    label: "Avg. MO3 Daily Rate"
    group_label: "Avg. Daily Rate"
    type: number
    value_format: "0.#"
    sql: sum(${mo3_quantity_ordered}) * 1.0 / count(distinct ${order_date}) ;;
  }

  measure: avg_owlbar_ordered_per_day {
    hidden: yes
    label: "Avg. Owl Bar Daily Rate"
    group_label: "Avg. Daily Rate"
    type: number
    value_format: "0.#"
    sql: sum(${owlbar_quantity_ordered}) * 1.0 / count(distinct ${order_date}) ;;
  }

  measure: avg_mic_ordered_per_day {
    hidden: yes
    label: "Avg. Expansion Mic Daily Rate"
    group_label: "Avg. Daily Rate"
    type: number
    value_format: "0.#"
    sql: sum(${mic_quantity_ordered}) * 1.0 / count(distinct ${order_date}) ;;
  }

  measure: avg_hq_ordered_per_day {
    hidden: yes
    label: "Avg. Meeting HQ Daily Rate"
    group_label: "Avg. Daily Rate"
    type: number
    value_format: "0.#"
    sql: sum(${hq_quantity_ordered}) * 1.0 / count(distinct ${order_date}) ;;
  }

  measure: avg_wbo_ordered_per_day {
    hidden: yes
    label: "Avg. Whiteboard Owl Daily Rate"
    group_label: "Avg. Daily Rate"
    type: number
    value_format: "0.#"
    sql: sum(${wbo_quantity_ordered}) * 1.0 / count(distinct ${order_date}) ;;
  }


  # measure: avg_weekend_owl_orders {
  #   group_label: "WKND AVG"
  #   type: number
  #   # sql: CASE WHEN ${order_day_of_week_index} in (5, 6) then (sum(${owls_quantity_ordered}) * 1.0 / count(distinct ${order_date} )) / count(distinct ${order_day_of_week_index})
  #   # end ;;
  #   sql: (sum(${owls_quantity_ordered}) * 1.0 / count(distinct ${order_date} )) / count(distinct ${order_day_of_week_index}) ;;
  # }


}
