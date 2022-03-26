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
    # convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.fulfillment_date::timestamp ;;
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
    hidden: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
    }

  dimension: shipping_address_company {
    label: "Customer"
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
    # hidden: yes
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
    # html:
    # {% if value == 'Asia Pacific' %}
    #   # <p style="background-color: red">{{ value }}</p>
    # {% elsif value == 'Europe' %}
    #   <p style="background-color: blue">{{ value }}</p>
    # {% elsif value == 'Middle East & Africa' %}
    #   <p style="background-color: blue">{{ value }}</p>
    #   {% elsif value == 'North America' %}
    #   <p style="background-color: blue">{{ value }}</p>
    #   {% elsif value == 'South America' %}
    #   <p style="background-color: blue">{{ value }}</p>
    # {% else %}
    #   <p style="color: grey">{{ value }}</p>
    # {% endif %};;
  # html:
    # {% if value == 'Asia Pacific' %}
    #   <div style="background-color: red"> {{ value }} </div>
    # {% elsif value == 'Europe' %}
    #   <div style="background-color: red"> {{ value }} </div>
    # {% elsif value == 'Middle East & Africa' %}
    #   <div style="background-color: red"> {{ value }} </div>
    #   {% elsif value == 'North America' %}
    #   <div style="background-color: red"> {{ value }} </div>
    #   {% elsif value == 'South America' %}
    #   <div style="background-color: red"> {{ value }} </div>
    # {% else %}
    #   <div style="background-color: red"> {{ value }} </div>
    # {% endif %};;
  # html: <font color="green">{{ value }}</font> ;;
  # <div style="background-color: rgba(200,35,25,{{value}}); font-size:150%; text-align:center"><a href="{{ link }}" style="color: white" target="_new">{{ balance_foo._rendered_value }} </a></div>
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

  # dimension: start_of_month {
  #   type: date
  #   # sql: ${TABLE}.first_of_month ;;
  #   sql: cast(date_trunc('month', ${TABLE}.fulfillment_date) as date) ;;
  # }

  # dimension: end_of_month{
  #   type: date
  #   sql: last_day(cast(${TABLE}.fulfillment_date as date)) ;;
  # }





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
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, allitems_quantity_shipped]
  }

  measure: sum_bundle_quantity_shipped {
    label: "Bundle Quantity Shipped"
    type: sum
    sql: ${bundle_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, bundle_quantity_shipped]
  }

  measure: sum_hq_quantity_shipped {
    label: "Meeting HQ Quantity Shipped"
    type: sum
    sql: ${hq_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, hq_quantity_shipped]
  }

  measure: sum_linecord_quantity_shipped {
    label: "Line Cord Quantity Shipped"
    type: sum
    sql: ${linecord_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, linecord_quantity_shipped]
  }

  measure: sum_lockadapter_quantity_shipped {
    label: "Lock Adapter Quantity Shipped"
    type: sum
    # sql: ${TABLE}.lockadapter_quantity_shipped ;;
    sql: ${lockadapter_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, lockadapter_quantity_shipped]
  }

  measure: sum_og_quantity_shipped {
    label: "Meeting Owl OG Quantity Shipped"
    type: sum
    # sql: ${TABLE}.og_quantity_shipped ;;
    sql: ${og_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, og_quantity_shipped]
  }

  measure: sum_other_quantity_shipped {
    label: "Other Quantity Shipped"
    type: sum
    # sql: ${TABLE}.other_quantity_shipped ;;
    sql: ${other_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, other_quantity_shipped]
  }

  measure: sum_owlcare_quantity_shipped {
    label: "Owl Care Quantity Shipped"
    type: sum
    # sql: ${TABLE}.owlcare_quantity_shipped ;;
    sql: ${owlcare_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, owlcare_quantity_shipped]
  }

  measure: sum_powersupply_quantity_shipped {
    label: "Power Supply Quantity Shipped"
    type: sum
    # sql: ${TABLE}.powersupply_quantity_shipped ;;
    sql: ${powersupply_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, powersupply_quantity_shipped]
  }

  measure: sum_pro_quantity_shipped {
    label: "Meeting Owl Pro Quantity Shipped"
    type: sum
    sql: ${pro_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, pro_quantity_shipped]
  }

  measure: sum_subscription_quantity_shipped {
    label: "Subscription Quantity Shipped"
    hidden: yes
    type: sum
    sql: ${subscription_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, subscription_quantity_shipped]
  }

  measure: sum_usbextension_quantity_shipped {
    label: "USB Extension Quantity Shipped"
    type: sum
    sql: ${usbextension_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, usbextension_quantity_shipped]
  }

  measure: sum_wbo_quantity_shipped {
    label: "Whiteboard Owl Quantity Shipped"
    type: sum
    sql: ${wbo_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, wbo_quantity_shipped]
  }

  measure: sum_owls_quantity_shipped {
    label: "All Owls Quantity Shipped"
    description: "Combination of OG and MOP units"
    type: sum
    sql: ${owls_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, owls_quantity_shipped]
  }

  measure: sum_hardware_quantity_shipped {
    label: "All Hardware Quantity Shipped"
    description: "Combination of OG, MOP, WBO, and HQ units"
    type: sum
    sql: ${hardware_quantity_shipped} ;;
    drill_fields: [fulfillment_number, shipping_address_company, sales_channel, world_region, hardware_quantity_shipped]
  }

  # measure: most_recent_amazon_date {}


}
