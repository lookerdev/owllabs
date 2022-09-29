view: shopify_orders_serial_numbers {
  label: "Shopify Orders"
  sql_table_name: public.shopify_orders_serial_numbers ;;

# DIMENSIONS

  dimension: row_num {
    primary_key:  yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: order_id {
    hidden: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: store {
    label: "Shopify Store"
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: name {
    label: "Shopify Order Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_number {
    hidden: yes
    label: "Shopify Order Number"
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension_group: order_date {
    label: "Order"
    # description: "Order date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date ;;
  }

  dimension: customer_company {
    label: "Customer Company Name"
    description: "Priority order of company name if null: 1) Billing Company, 2) Shipping Company, 3) Customer Default Company"
    sql: coalesce(${TABLE}.billing_address_company, ${TABLE}.shipping_address_company, ${TABLE}.customer_default_address_company) ;;
  }

  dimension: serial_number {
    # hidden: yes
    label: "Hardware Serial Number"
    type: string
    sql: ${TABLE}.hardware_serial_number ;;
    # sql: ${TABLE}.hardware_serial_number_validated ;;
  }

  dimension: product_name {
    hidden: yes
    label: "Device Type"
    description: "Device product type"
    type: string
    sql: ${TABLE}.device_type;;
  }


# MEASURES
  measure: count {
    hidden: yes
    type: count
    drill_fields: [name]
  }

  measure: count_serials {
    # hidden: yes
    label: "Count of Ordered Serial Numbers"
    description: "These are serial numbers included in the notes field of a Shopify order. Please note that not all serial numbers are captured this way."
    type: count_distinct
    sql: ${serial_number} ;;
  }
}
