view: all_fulfillments {
  sql_table_name: public.all_fulfillments ;;


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
    WHEN {% parameter timeframe_picker %} = 'date_date' THEN TO_DATE(${fulfillment_date}, 'YYYY-MM-DD')
    WHEN {% parameter timeframe_picker %} = 'date_week' THEN TO_DATE(${fulfillment_week}, 'YYYY-MM-DD')
    WHEN {% parameter timeframe_picker %} = 'date_month' THEN TO_DATE(${fulfillment_month}, 'YYYY-MM')
    END ;;
  }

  dimension: country_name {
    # label: "Market Region"
    description: "Shipment address country, previously labeled 'Market Region'"
    type: string
    sql: ${TABLE}.country_name ;;
    map_layer_name: countries
  }

  # dimension: distribution_channel {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.distribution_channel ;;
  # }

  dimension_group: fulfillment {
    label: "Ship"
    type: time
    # convert_tz: no
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    # sql: ${TABLE}.fulfillment_date::date ;;
    sql: ${TABLE}.fulfillment_date::timestamp ;;
    # sql: case when ${TABLE}.source = 'Shopify' then ${TABLE}.fulfillment_date AT TIME ZONE 'EDT' else ${TABLE}.fulfillment_date end ;;
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
    # customer
    label: "Shipping Company Name"
    type: string
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
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

  dimension: revenue_sku {
    description: "Identifies if SKU counts towards revenue. 'No' includes replacement, Owl for Good, and test SKUs."
    type: yesno
    sql: CASE WHEN ${sku} IN ('EXM100-1000-RPL','MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','MTW200-4000 - RPL','MTW200-4000-RPL','MTW300-1000-RPL','MTW300-2000-RPL','PTW100-1000-RPL','REF100-1000','REF200-1000','REF200-2000','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPLCMHQ101-1000','REPLCMHQ102-0000','REPLCMHQ103-0000','REPLCWBO100-1000','REPLCWBO101-0000','REPPS - Universal','REPPS','REPUSB - Universal','REPUSB','TEST2','TEST3','VAT','WBC100-1000-RPL') then False
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

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
    drill_fields: [country_name]
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

  dimension: softcase_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.softcase_quantity_shipped ;;
  }

  dimension: stand_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.stand_quantity_shipped ;;
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

  dimension: usbextension_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.usbextension_quantity_shipped ;;
  }

  dimension: usbconversioncable_quantity_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.usbconversioncable_quantity_shipped ;;
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

  dimension: start_of_month {
    hidden: yes
    type: date
    # sql: ${TABLE}.first_of_month ;;
    sql: cast(date_trunc('month', ${TABLE}.fulfillment_date) as date) ;;
  }

  dimension: end_of_month{
    hidden: yes
    type: date
    sql: last_day(cast(${TABLE}.fulfillment_date as date)) ;;
  }



# # MEASURES
  measure: count {
    hidden: yes
    type: count
    drill_fields: [sku_name]
  }

  measure: sum_allitems_quantity_shipped {
    hidden: yes
    label: "All Items Quantity Shipped"
    type: sum
    sql: ${allitems_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_allitems_quantity_shipped]
  }

  measure: sum_bundle_quantity_shipped {
    label: "Bundle Quantity Shipped"
    hidden: yes
    type: sum
    sql: ${bundle_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_bundle_quantity_shipped]
  }

  measure: sum_ceilingmount_quantity_shipped {
    label: "Ceiling Mount Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${ceilingmount_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_ceilingmount_quantity_shipped]
  }

  measure: sum_cuecards_quantity_shipped {
    label: "Cue Cards Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${cuecards_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_cuecards_quantity_shipped]
  }

  measure: sum_hardcase_quantity_shipped {
    label: "Hard Case Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${hardcase_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_hardcase_quantity_shipped]
  }

  measure: sum_hq_quantity_shipped {
    label: "Meeting HQ Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${hq_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_hq_quantity_shipped]
  }

  measure: sum_linecord_quantity_shipped {
    label: "Line Cord Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${linecord_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_linecord_quantity_shipped]
  }

  measure: sum_lockadapter_quantity_shipped {
    label: "Lock Adapter Quantity Shipped"
    group_label: "Accessories"
    type: sum
    # sql: ${TABLE}.lockadapter_quantity_shipped ;;
    sql: ${lockadapter_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_lockadapter_quantity_shipped]
  }

  measure: sum_markers_quantity_shipped {
    label: "Whiteboard Markers Quantity Shipped"
    group_label: "Accessories"
    type: sum
    # sql: ${TABLE}.lockadapter_quantity_shipped ;;
    sql: ${markers_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_markers_quantity_shipped]
  }

  measure: sum_mic_quantity_shipped {
    label: "Expansion Mic Quantity Shipped"
    group_label: "Hardware"
    type: sum
    # sql: ${TABLE}.lockadapter_quantity_shipped ;;
    sql: ${mic_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_mic_quantity_shipped]
  }

  measure: sum_mo3_quantity_shipped {
    label: "Meeting Owl 3 Quantity Shipped"
    group_label: "Hardware"
    type: sum
    # sql: ${TABLE}.lockadapter_quantity_shipped ;;
    sql: ${mo3_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_mo3_quantity_shipped]
  }

  measure: sum_og_quantity_shipped {
    label: "Meeting Owl Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${og_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_og_quantity_shipped]
  }

  measure: sum_owlcare_quantity_shipped {
    hidden: yes
    label: "Owl Care Quantity Shipped"
    group_label: "Digital"
    type: sum
    sql: ${owlcare_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_owlcare_quantity_shipped]
  }

  measure: sum_powersupply_quantity_shipped {
    label: "Power Supply Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${powersupply_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_powersupply_quantity_shipped]
  }

  measure: sum_pro_quantity_shipped {
    label: "Meeting Owl Pro Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${pro_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_pro_quantity_shipped]
  }

  measure: sum_raas_quantity_shipped {
    hidden: yes
    label: "RaaS Quantity Shipped"
    type: sum
    sql: ${raas_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_raas_quantity_shipped]
  }

  measure: sum_replacement_unit_shipped {
    hidden: yes
    label: "Replacement Quantity Shipped"
    type: sum
    sql: ${replacement_unit_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_raas_quantity_shipped]
  }

  measure: sum_softcase_quantity_shipped {
    label: "Soft Case Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${softcase_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_softcase_quantity_shipped]
  }

  measure: sum_stand_quantity_shipped {
    label: "Stand Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${stand_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_stand_quantity_shipped]
  }

  measure: sum_subscription_quantity_shipped {
    label: "Subscription Quantity Shipped"
    hidden: yes
    type: sum
    sql: ${subscription_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_subscription_quantity_shipped]
  }

  measure: sum_tablemount_quantity_shipped {
    label: "Table Mount Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${tablemount_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_tablemount_quantity_shipped]
  }

  measure: sum_tripod_quantity_shipped {
    label: "Tripod Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${tripod_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_tripod_quantity_shipped]
  }

  measure: sum_usbextension_quantity_shipped {
    label: "USB Extension Cable Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${usbextension_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_usbextension_quantity_shipped]
  }

  measure: sum_usbconversioncable_quantity_shipped {
    label: "USB Conversion Cable Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${usbconversioncable_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_usbconversioncable_quantity_shipped]
  }

  measure: sum_wbo_quantity_shipped {
    label: "Whiteboard Owl Quantity Shipped"
    group_label: "Hardware"
    type: sum
    sql: ${wbo_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_wbo_quantity_shipped]
  }

  measure: sum_wbtags_quantity_shipped {
    label: "Whiteboard Tags Quantity Shipped"
    group_label: "Accessories"
    type: sum
    sql: ${wbtags_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_wbtags_quantity_shipped]
  }

  measure: sum_owls_quantity_shipped {
    label: "All Owls Quantity Shipped"
    group_label: "Hardware"
    description: "Combination of OG, MOP, and MO3 units"
    type: sum
    sql: ${owls_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_owls_quantity_shipped]
  }

  measure: sum_hardware_quantity_shipped {
    label: "All Hardware Quantity Shipped"
    group_label: "Hardware"
    description: "Combination of OG, MOP, MO3, WBO, and HQ units"
    type: sum
    sql: ${hardware_quantity_shipped} ;;
    drill_fields: [sales_channel, world_region, order_number, fulfillment_number, shipping_address_company, sku, sum_hardware_quantity_shipped]
  }

  # measure: most_recent_amazon_date {}


}
