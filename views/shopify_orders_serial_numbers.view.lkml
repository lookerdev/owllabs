view: shopify_orders_serial_numbers {
  label: "Shopify Orders"
  sql_table_name: public.shopify_orders_serial_numbers ;;

# DIMENSIONS
  dimension: customer_company {
    label: "Customer Company Name"
    description: "Priority order of company name if null: 1) Billing Company, 2) Shipping Company, 3) Customer Default Company"
    sql: coalesce(${TABLE}.billing_address_company, ${TABLE}.shipping_address_company, ${TABLE}.customer_default_address_company) ;;
  }

  dimension: name {
    label: "Shopify Order Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    hidden: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_number {
    hidden: yes
    label: "Shopify Order Number"
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension: row_num {
    primary_key:  yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: serial_number {
    # hidden: yes
    label: "Device Hardware Serial Number"
    type: string
    sql: ${TABLE}.hardware_serial_number ;;
  }

  dimension: store {
    label: "Shopify Store"
    type: string
    sql: ${TABLE}.store ;;
  }

  # dimension: device_type {}

  # dimension: sales_channel {}

  # dimension: order_date {}

# MEASURES
  measure: count {
    hidden: yes
    type: count
    drill_fields: [name]
  }

  measure: count_serials {
    hidden: yes
    label: "Count of Serial Numbers"
    type: count_distinct
    sql: ${serial_number} ;;
  }
}
