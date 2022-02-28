view: all_fulfillments {
  sql_table_name: public.all_fulfillments ;;


## DIMENSIONS

  dimension: country_name {
    label: "Market Region"
    description: "Country of billed customer"
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: distribution_channel {
    hidden: yes
    type: string
    sql: ${TABLE}.distribution_channel ;;
  }

  dimension_group: fulfillment {
    label: "Ship"
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

  dimension: fulfillment_number {
    type: string
    sql: ${TABLE}.fulfillment_number ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: row_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: customer_ship_to {
    type: string
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: sku_name {
    type: string
    sql: ${TABLE}.sku_name ;;
  }

  dimension: source {
    hidden: yes
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
  measure: count {
    hidden: yes
    type: count
    drill_fields: [country_name, sku_name]
  }

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


}
