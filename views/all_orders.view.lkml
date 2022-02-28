# The name of this view in Looker is "All Orders"
view: all_orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.all_orders ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Allitems Quantity Ordered" in Explore.

  dimension: allitems_quantity_ordered {
    type: number
    sql: ${TABLE}.allitems_quantity_ordered ;;
  }

  dimension: billing_address_company {
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: bundle_quantity_ordered {
    type: number
    sql: ${TABLE}.bundle_quantity_ordered ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: distribution_channel {
    type: string
    sql: ${TABLE}.distribution_channel ;;
  }

  dimension: hq_quantity_ordered {
    type: number
    sql: ${TABLE}.hq_quantity_ordered ;;
  }

  dimension: linecord_quantity_ordered {
    type: number
    sql: ${TABLE}.linecord_quantity_ordered ;;
  }

  dimension: lockadapter_quantity_ordered {
    type: number
    sql: ${TABLE}.lockadapter_quantity_ordered ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: og_quantity_ordered {
    type: number
    sql: ${TABLE}.og_quantity_ordered ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: order {
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
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: other_quantity_ordered {
    type: number
    sql: ${TABLE}.other_quantity_ordered ;;
  }

  dimension: owlcare_quantity_ordered {
    type: number
    sql: ${TABLE}.owlcare_quantity_ordered ;;
  }

  dimension: powersupply_quantity_ordered {
    type: number
    sql: ${TABLE}.powersupply_quantity_ordered ;;
  }

  dimension: pro_quantity_ordered {
    type: number
    sql: ${TABLE}.pro_quantity_ordered ;;
  }

  dimension: row_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_row_number {
    type: sum
    sql: ${row_number} ;;
  }

  measure: average_row_number {
    type: average
    sql: ${row_number} ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: sku_name {
    type: string
    sql: ${TABLE}.sku_name ;;
  }

  dimension: sku_quantity_ordered {
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
    type: number
    sql: ${TABLE}.subscription_quantity_ordered ;;
  }

  dimension: usbextension_quantity_ordered {
    type: number
    sql: ${TABLE}.usbextension_quantity_ordered ;;
  }

  dimension: wbo_quantity_ordered {
    type: number
    sql: ${TABLE}.wbo_quantity_ordered ;;
  }

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
  }

  measure: count {
    type: count
    drill_fields: [country_name, sku_name]
  }
}
