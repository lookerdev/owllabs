view: shopify_orders_serial_numbers {
  sql_table_name: public.shopify_orders_serial_numbers ;;
  label: "Shopify Order Details"


  # group_label: "Billing Address"
  # group_label: "Shipping Address"
  # group_label: "Customer Details"
  # group_label: "Order Details"

  dimension: row_num {
    primary_key: yes
    hidden:  yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: billing_address_address1 {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_address1 ;;
  }

  dimension: billing_address_address2 {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_address2 ;;
  }

  dimension: billing_address_city {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_city ;;
  }

  dimension: billing_address_company {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: billing_address_country {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_country ;;
  }

  dimension: billing_address_country_code {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_country_code ;;
  }

  # dimension: billing_address_first_name {
  #   group_label: "Billing Address"
  #   type: string
  #   sql: ${TABLE}.billing_address_first_name ;;
  # }

  # dimension: billing_address_last_name {
  #   group_label: "Billing Address"
  #   type: string
  #   sql: ${TABLE}.billing_address_last_name ;;
  # }

  dimension: billing_address_latitude {
    group_label: "Billing Address"
    type: number
    sql: ${TABLE}.billing_address_latitude ;;
  }

  dimension: billing_address_longitude {
    group_label: "Billing Address"
    type: number
    sql: ${TABLE}.billing_address_longitude ;;
  }

  dimension: billing_address_name {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_name ;;
  }

  dimension: billing_address_phone {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_phone ;;
  }

  dimension: billing_address_province {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_province ;;
  }

  dimension: billing_address_province_code {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_province_code ;;
  }

  dimension: billing_address_zip {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_zip ;;
  }

  # dimension_group: closed {
  #   group_label: "Order Details"
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.closed_at ;;
  # }

  dimension: contact_email {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: currency {
  group_label: "Order Details"
    type: string
    sql: ${TABLE}.currency ;;
  }

  # dimension_group: customer_created {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.customer_created_at ;;
  # }

  # dimension: customer_currency {
  #   type: string
  #   sql: ${TABLE}.customer_currency ;;
  # }

  # dimension: customer_default_address_address1 {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_address1 ;;
  # }

  # dimension: customer_default_address_address2 {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_address2 ;;
  # }

  # dimension: customer_default_address_city {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_city ;;
  # }

  # dimension: customer_default_address_company {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_company ;;
  # }

  # dimension: customer_default_address_country {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_country ;;
  # }

  # dimension: customer_default_address_country_code {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_country_code ;;
  # }

  # dimension: customer_default_address_country_name {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_country_name ;;
  # }

  # dimension: customer_default_address_customer_id {
  #   group_label: "Customer Details"
  #   type: number
  #   sql: ${TABLE}.customer_default_address_customer_id ;;
  # }

  # dimension: customer_default_address_default {
  #   group_label: "Customer Details"
  #   type: yesno
  #   sql: ${TABLE}.customer_default_address_default ;;
  # }

  dimension: customer_default_address_first_name {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.customer_default_address_first_name ;;
  }

  # dimension: customer_default_address_id {
  #   group_label: "Customer Details"
  #   type: number
  #   sql: ${TABLE}.customer_default_address_id ;;
  # }

  dimension: customer_default_address_last_name {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.customer_default_address_last_name ;;
  }

  # dimension: customer_default_address_name {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_name ;;
  # }

  # dimension: customer_default_address_phone {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_phone ;;
  # }

  # dimension: customer_default_address_province {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_province ;;
  # }

  # dimension: customer_default_address_province_code {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_province_code ;;
  # }

  # dimension: customer_default_address_zip {
  #   group_label: "Customer Details"
  #   type: string
  #   sql: ${TABLE}.customer_default_address_zip ;;
  # }

  dimension: customer_email {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: customer_first_name {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.customer_first_name ;;
  }

  dimension: customer_id {
    group_label: "Customer Details"
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_last_name {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.customer_last_name ;;
  }

  # dimension: customer_last_order_id {
  #   type: number
  #   sql: ${TABLE}.customer_last_order_id ;;
  # }

  # dimension: customer_last_order_name {
  #   type: string
  #   sql: ${TABLE}.customer_last_order_name ;;
  # }

  # dimension: customer_locale {
  #   type: string
  #   sql: ${TABLE}.customer_locale ;;
  # }

  # dimension: customer_note {
  #   type: string
  #   sql: ${TABLE}.customer_note ;;
  # }

  # dimension: customer_orders_count {
  #   type: number
  #   sql: ${TABLE}.customer_orders_count ;;
  # }

  dimension: customer_phone {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.customer_phone ;;
  }

  dimension: customer_state {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.customer_state ;;
  }

  # dimension: customer_tags {
  #   type: string
  #   sql: ${TABLE}.customer_tags ;;
  # }

  # dimension: customer_tax_exempt {
  #   type: yesno
  #   sql: ${TABLE}.customer_tax_exempt ;;
  # }

  # dimension: customer_total_spent {
  #   type: string
  #   sql: ${TABLE}.customer_total_spent ;;
  # }

  # dimension_group: customer_updated {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.customer_updated_at ;;
  # }

  dimension: customer_verified_email {
    group_label: "Customer Details"
    type: yesno
    sql: ${TABLE}.customer_verified_email ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: email {
    group_label: "Customer Details"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: financial_status {
  group_label: "Order Details"
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillment_status {
    group_label: "Order Details"
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: hardware_serial {
    hidden: yes
    type: string
    sql: ${TABLE}.hardware_serial_number ;;
  }

  dimension: hardware_serial_validated {
    type: string
    sql: ${TABLE}.hardware_serial_number_validated ;;
  }

  dimension: name {
    label: "Order Name"
    group_label: "Order Details"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number {
    label: "Order Number"
    group_label: "Order Details"
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension_group: order {
    # group_label: "Order Details"
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

  dimension: order_id {
    group_label: "Order Details"
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_number {
    group_label: "Order Details"
    type: number
    sql: ${TABLE}.order_number ;;
  }

  # dimension_group: processed {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.processed_at ;;
  # }

  dimension: shipping_address_address1 {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_address1 ;;
  }

  dimension: shipping_address_address2 {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_address2 ;;
  }

  dimension: shipping_address_city {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_city ;;
  }

  dimension: shipping_address_company {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: shipping_address_country {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_country ;;
  }

  dimension: shipping_address_country_code {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_country_code ;;
  }

  # dimension: shipping_address_first_name {
  #   group_label: "Shipping Address"
  #   type: string
  #   sql: ${TABLE}.shipping_address_first_name ;;
  # }

  # dimension: shipping_address_last_name {
  #   group_label: "Shipping Address"
  #   type: string
  #   sql: ${TABLE}.shipping_address_last_name ;;
  # }

  dimension: shipping_address_latitude {
    group_label: "Shipping Address"
    type: number
    sql: ${TABLE}.shipping_address_latitude ;;
  }

  dimension: shipping_address_longitude {
    group_label: "Shipping Address"
    type: number
    sql: ${TABLE}.shipping_address_longitude ;;
  }

  dimension: shipping_address_name {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_name ;;
  }

  dimension: shipping_address_phone {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_phone ;;
  }

  dimension: shipping_address_province {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_province ;;
  }

  dimension: shipping_address_province_code {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_province_code ;;
  }

  dimension: shipping_address_zip {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_zip ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
  }

  # dimension: user_id {
  #   type: string
  #   sql: ${TABLE}.user_id ;;
  # }








  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_customer_orders_count {
  #   type: sum
  #   sql: ${customer_orders_count} ;;
  # }

  # measure: average_customer_orders_count {
  #   type: average
  #   sql: ${customer_orders_count} ;;
  # }



  # measure: count {
  #   type: count
  #   drill_fields: [detail*]
  # }

  # ----- Sets of fields for drilling ------
  # set: detail {
  #   fields: [
  #     shipping_address_name,
  #     shipping_address_last_name,
  #     shipping_address_first_name,
  #     name,
  #     customer_last_order_name,
  #     customer_last_name,
  #     customer_first_name,
  #     customer_default_address_name,
  #     customer_default_address_last_name,
  #     customer_default_address_first_name,
  #     customer_default_address_country_name,
  #     billing_address_name,
  #     billing_address_last_name,
  #     billing_address_first_name
  #   ]
  # }
}
