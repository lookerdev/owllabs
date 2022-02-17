# The name of this view in Looker is "Shopify Fulfillments View"
view: shopify_fulfillments_line_items_view {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.shopify_fulfillments_view ;;

# # DIMENSIONS

  dimension: contact_email {
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
    type: string
    sql: ${TABLE}.fulfillment_id ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: line_item_id {
    type: string
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: netsuite_sales_rep {
    hidden: yes
    type: string
    sql: ${TABLE}.netsuite_sales_rep ;;
  }

  dimension: pre_tax_price {
    type: number
    sql: ${TABLE}.pre_tax_price ;;
  }

  dimension: pre_tax_price_usd {
    type: number
    sql: ${TABLE}.pre_tax_price_usd ;;
  }

  dimension: product_id {
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
  }

  dimension: shipping_address_company {
    type: string
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: shipping_address_country {
    hidden: yes
    type: string
    sql: ${TABLE}.shipping_address_country ;;
  }

  dimension: shopify_fulfillment_name {
    type: string
    sql: ${TABLE}.shopify_fulfillment_name ;;
  }

  dimension: shopify_order_name {
    type: string
    sql: ${TABLE}.shopify_order_name ;;
  }

  dimension: shopify_tags_cam {
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
    sql: coalesce(${netsuite_sales_rep},${shopify_tags_sales_rep}) ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: source {
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

# # MEASURES

  measure: allitems_quantity_shipped {
    type: sum
    sql: ${TABLE}.allitems_quantity_shipped ;;
  }

  measure: bundle_quantity_shipped {
    type: sum
    sql: ${TABLE}.bundle_quantity_shipped ;;
  }

  measure: hq_quantity_shipped {
    type: sum
    sql: ${TABLE}.hq_quantity_shipped ;;
  }

  measure: linecord_quantity_shipped {
    type: sum
    sql: ${TABLE}.linecord_quantity_shipped ;;
  }

  measure: lockadapter_quantity_shipped {
    type: sum
    sql: ${TABLE}.lockadapter_quantity_shipped ;;
  }

  measure: og_quantity_shipped {
    type: sum
    sql: ${TABLE}.og_quantity_shipped ;;
  }

  measure: other_quantity_shipped {
    type: sum
    sql: ${TABLE}.other_quantity_shipped ;;
  }

  measure: owlcare_quantity_shipped {
    type: sum
    sql: ${TABLE}.owlcare_quantity_shipped ;;
  }

  measure: powersupply_quantity_shipped {
    type: sum
    sql: ${TABLE}.powersupply_quantity_shipped ;;
  }

  measure: average_pre_tax_price {
    hidden: yes
    type: average
    sql: ${pre_tax_price} ;;
  }

  measure: total_pre_tax_price {
    type: sum
    sql: ${pre_tax_price} ;;
  }

  measure: total_pre_tax_price_usd {
    type: sum
    value_format_name: usd
    sql: ${pre_tax_price_usd} ;;
  }

  measure: pro_quantity_shipped {
    type: sum
    sql: ${TABLE}.pro_quantity_shipped ;;
  }

  measure: subscription_quantity_shipped {
    type: sum
    sql: ${TABLE}.subscription_quantity_shipped ;;
  }

  measure: usbextension_quantity_shipped {
    type: sum
    sql: ${TABLE}.usbextension_quantity_shipped ;;
  }

  measure: wbo_quantity_shipped {
    type: sum
    sql: ${TABLE}.wbo_quantity_shipped ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [country_name, shopify_fulfillment_name, shopify_order_name]
  }
}
