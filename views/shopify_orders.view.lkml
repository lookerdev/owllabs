view: shopify_orders {
 sql_table_name: public.shopify_orders ;;
  drill_fields: [id]


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  # dimension_group: _sdc_batched {
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
  #   sql: ${TABLE}._sdc_batched_at ;;
  # }

  # dimension_group: _sdc_extracted {
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
  #   sql: ${TABLE}._sdc_extracted_at ;;
  # }

  # dimension_group: _sdc_received {
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
  #   sql: ${TABLE}._sdc_received_at ;;
  # }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Sdc Sequence" in Explore.

  # dimension: _sdc_sequence {
  #   type: number
  #   sql: ${TABLE}._sdc_sequence ;;
  # }

  # dimension: _sdc_table_version {
  #   type: number
  #   sql: ${TABLE}._sdc_table_version ;;
  # }

  # dimension: admin_graphql_api_id {
  #   type: string
  #   sql: ${TABLE}.admin_graphql_api_id ;;
  # }

  # dimension: app_id {
  #   type: number
  #   sql: ${TABLE}.app_id ;;
  # }

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

  dimension: billing_address_first_name {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_first_name ;;
  }

  dimension: billing_address_last_name {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}.billing_address_last_name ;;
  }

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

  # dimension: browser_ip {
  #   type: string
  #   sql: ${TABLE}.browser_ip ;;
  # }

  dimension: buyer_accepts_marketing {
    type: yesno
    sql: ${TABLE}.buyer_accepts_marketing ;;
  }

  dimension: cam_name {
    label: "CAM Name"
    type: string
    sql: ${TABLE}.cam_name ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension: cart_token {
    type: string
    sql: ${TABLE}.cart_token ;;
  }

  dimension: checkout_id {
    type: number
    sql: ${TABLE}.checkout_id ;;
  }

  dimension: checkout_token {
    type: string
    sql: ${TABLE}.checkout_token ;;
  }

  dimension: client_details_accept_language {
    type: string
    sql: ${TABLE}.client_details_accept_language ;;
  }

  dimension: client_details_browser_height {
    type: number
    sql: ${TABLE}.client_details_browser_height ;;
  }

  dimension: client_details_browser_ip {
    type: string
    sql: ${TABLE}.client_details_browser_ip ;;
  }

  dimension: client_details_browser_width {
    type: number
    sql: ${TABLE}.client_details_browser_width ;;
  }

  dimension: client_details_user_agent {
    type: string
    sql: ${TABLE}.client_details_user_agent ;;
  }

  dimension_group: closed {
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
    sql: ${TABLE}.closed_at ;;
  }

  dimension: confirmed {
    type: yesno
    sql: ${TABLE}.confirmed ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension_group: created_at {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_accepts_marketing {
    type: string
    sql: ${TABLE}.customer_accepts_marketing ;;
  }

  dimension_group: customer_accepts_marketing_updated {
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
    sql: ${TABLE}.customer_accepts_marketing_updated_at ;;
  }

  dimension: customer_admin_graphql_api_id {
    type: string
    sql: ${TABLE}.customer_admin_graphql_api_id ;;
  }

  dimension_group: customer_created {
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
    sql: ${TABLE}.customer_created_at ;;
  }

  dimension: customer_currency {
    type: string
    sql: ${TABLE}.customer_currency ;;
  }

  dimension: customer_default_address_address1 {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_address1 ;;
  }

  dimension: customer_default_address_address2 {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_address2 ;;
  }

  dimension: customer_default_address_city {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_city ;;
  }

  dimension: customer_default_address_company {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_company ;;
  }

  dimension: customer_default_address_country {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_country ;;
  }

  dimension: customer_default_address_country_code {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_country_code ;;
  }

  dimension: customer_default_address_country_name {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_country_name ;;
  }

  dimension: customer_default_address_customer_id {
    group_label: "Customer Info"
    type: number
    sql: ${TABLE}.customer_default_address_customer_id ;;
  }

  dimension: customer_default_address_default {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_default ;;
  }

  dimension: customer_default_address_first_name {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_first_name ;;
  }

  dimension: customer_default_address_id {
    group_label: "Customer Info"
    type: number
    sql: ${TABLE}.customer_default_address_id ;;
  }

  dimension: customer_default_address_last_name {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_last_name ;;
  }

  dimension: customer_default_address_name {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_name ;;
  }

  dimension: customer_default_address_phone {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_phone ;;
  }

  dimension: customer_default_address_province {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_province ;;
  }

  dimension: customer_default_address_province_code {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_province_code ;;
  }

  dimension: customer_default_address_zip {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_default_address_zip ;;
  }

  dimension: customer_email {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: customer_first_name {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_first_name ;;
  }

  dimension: customer_id {
    group_label: "Customer Info"
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_last_name {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.customer_last_name ;;
  }

  dimension: customer_last_order_id {
    type: number
    sql: ${TABLE}.customer_last_order_id ;;
  }

  dimension: customer_last_order_name {
    type: string
    sql: ${TABLE}.customer_last_order_name ;;
  }

  dimension: customer_locale {
    type: string
    sql: ${TABLE}.customer_locale ;;
  }

  dimension: customer_note {
    type: string
    sql: ${TABLE}.customer_note ;;
  }

  dimension: customer_orders_count {
    type: number
    sql: ${TABLE}.customer_orders_count ;;
  }

  dimension: customer_phone {
    type: string
    sql: ${TABLE}.customer_phone ;;
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}.customer_state ;;
  }

  dimension: customer_tags {
    type: string
    sql: ${TABLE}.customer_tags ;;
  }

  dimension: customer_tax_exempt {
    type: string
    sql: ${TABLE}.customer_tax_exempt ;;
  }

  dimension: customer_total_spent {
    type: string
    sql: ${TABLE}.customer_total_spent ;;
  }

  dimension_group: customer_updated {
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
    sql: ${TABLE}.customer_updated_at ;;
  }

  dimension: customer_verified_email {
    type: string
    sql: ${TABLE}.customer_verified_email ;;
  }

  dimension: cx_team {
    type: string
    sql: ${TABLE}.cx_team ;;
  }

  dimension: email {
    group_label: "Customer Info"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: financial_status {
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: gateway {
    type: string
    sql: ${TABLE}.gateway ;;
  }

  dimension: landing_site {
    type: string
    sql: ${TABLE}.landing_site ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: name {
    label: "Order Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension: order_status_url {
    type: string
    sql: ${TABLE}.order_status_url ;;
  }

  dimension: payment_details_avs_result_code {
    type: string
    sql: ${TABLE}.payment_details_avs_result_code ;;
  }

  dimension: payment_details_credit_card_bin {
    type: string
    sql: ${TABLE}.payment_details_credit_card_bin ;;
  }

  dimension: payment_details_credit_card_company {
    type: string
    sql: ${TABLE}.payment_details_credit_card_company ;;
  }

  dimension: payment_details_credit_card_number {
    type: string
    sql: ${TABLE}.payment_details_credit_card_number ;;
  }

  dimension: payment_details_cvv_result_code {
    type: string
    sql: ${TABLE}.payment_details_cvv_result_code ;;
  }

  dimension: presentment_currency {
    type: string
    sql: ${TABLE}.presentment_currency ;;
  }

  dimension_group: processed {
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
    sql: ${TABLE}.processed_at ;;
  }

  dimension: processing_method {
    type: string
    sql: ${TABLE}.processing_method ;;
  }

  dimension: referring_site {
    type: string
    sql: ${TABLE}.referring_site ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: sales_rep_name {
    type: string
    sql: ${TABLE}.sales_rep_name ;;
  }

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

  dimension: shipping_address_first_name {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_first_name ;;
  }

  dimension: shipping_address_last_name {
    group_label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_last_name ;;
  }

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

  dimension: source_name {
    type: string
    sql: ${TABLE}.source_name ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: subtotal_price {
    type: number
    sql: ${TABLE}.subtotal_price ;;
  }

  dimension: subtotal_price_set_presentment_money_amount {
    type: string
    sql: ${TABLE}.subtotal_price_set_presentment_money_amount ;;
  }

  dimension: subtotal_price_set_presentment_money_currency_code {
    type: string
    sql: ${TABLE}.subtotal_price_set_presentment_money_currency_code ;;
  }

  dimension: subtotal_price_set_shop_money_amount {
    type: string
    sql: ${TABLE}.subtotal_price_set_shop_money_amount ;;
  }

  dimension: subtotal_price_set_shop_money_currency_code {
    type: string
    sql: ${TABLE}.subtotal_price_set_shop_money_currency_code ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: taxes_included {
    type: yesno
    sql: ${TABLE}.taxes_included ;;
  }

  dimension: test {
    hidden: yes
    type: yesno
    sql: ${TABLE}.test ;;
  }

  dimension: token {
    type: string
    sql: ${TABLE}.token ;;
  }

  dimension: total_discounts {
    type: number
    sql: ${TABLE}.total_discounts ;;
  }

  dimension: total_discounts_set_presentment_money_amount {
    type: string
    sql: ${TABLE}.total_discounts_set_presentment_money_amount ;;
  }

  dimension: total_discounts_set_presentment_money_currency_code {
    type: string
    sql: ${TABLE}.total_discounts_set_presentment_money_currency_code ;;
  }

  dimension: total_discounts_set_shop_money_amount {
    type: string
    sql: ${TABLE}.total_discounts_set_shop_money_amount ;;
  }

  dimension: total_discounts_set_shop_money_currency_code {
    type: string
    sql: ${TABLE}.total_discounts_set_shop_money_currency_code ;;
  }

  dimension: total_line_items_price {
    type: number
    sql: ${TABLE}.total_line_items_price ;;
  }

  dimension: total_line_items_price_set_presentment_money_amount {
    type: string
    sql: ${TABLE}.total_line_items_price_set_presentment_money_amount ;;
  }

  dimension: total_line_items_price_set_shop_money_amount {
    type: string
    sql: ${TABLE}.total_line_items_price_set_shop_money_amount ;;
  }

  dimension: total_line_items_price_set_shop_money_currency_code {
    type: string
    sql: ${TABLE}.total_line_items_price_set_shop_money_currency_code ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  dimension: total_price_set_presentment_money_amount {
    type: string
    sql: ${TABLE}.total_price_set_presentment_money_amount ;;
  }

  dimension: total_price_set_presentment_money_currency_code {
    type: string
    sql: ${TABLE}.total_price_set_presentment_money_currency_code ;;
  }

  dimension: total_price_set_shop_money_amount {
    type: string
    sql: ${TABLE}.total_price_set_shop_money_amount ;;
  }

  dimension: total_price_set_shop_money_currency_code {
    type: string
    sql: ${TABLE}.total_price_set_shop_money_currency_code ;;
  }

  dimension: total_price_usd {
    type: number
    sql: ${TABLE}.total_price_usd ;;
  }

  dimension: total_shipping_price_set_presentment_money_amount {
    type: string
    sql: ${TABLE}.total_shipping_price_set_presentment_money_amount ;;
  }

  dimension: total_shipping_price_set_presentment_money_currency_code {
    type: string
    sql: ${TABLE}.total_shipping_price_set_presentment_money_currency_code ;;
  }

  dimension: total_shipping_price_set_shop_money_amount {
    type: string
    sql: ${TABLE}.total_shipping_price_set_shop_money_amount ;;
  }

  dimension: total_shipping_price_set_shop_money_currency_code {
    type: string
    sql: ${TABLE}.total_shipping_price_set_shop_money_currency_code ;;
  }

  dimension: total_tax {
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: total_tax_set_presentment_money_amount {
    type: string
    sql: ${TABLE}.total_tax_set_presentment_money_amount ;;
  }

  dimension: total_tax_set_presentment_money_currency_code {
    type: string
    sql: ${TABLE}.total_tax_set_presentment_money_currency_code ;;
  }

  dimension: total_tax_set_shop_money_amount {
    type: string
    sql: ${TABLE}.total_tax_set_shop_money_amount ;;
  }

  dimension: total_tax_set_shop_money_currency_code {
    type: string
    sql: ${TABLE}.total_tax_set_shop_money_currency_code ;;
  }

  dimension: total_tip_received {
    type: string
    sql: ${TABLE}.total_tip_received ;;
  }

  dimension: total_weight {
    type: number
    sql: ${TABLE}.total_weight ;;
  }

  dimension_group: updated_at {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

## MEASURES
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_customer_orders_count {
    type: sum
    sql: ${customer_orders_count} ;;
  }

  measure: average_customer_orders_count {
    type: average
    sql: ${customer_orders_count} ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      cam_name,
      sales_rep_name,
      source_name,
      shipping_address_name,
      shipping_address_last_name,
      shipping_address_first_name,
      name,
      customer_last_order_name,
      customer_last_name,
      customer_first_name,
      customer_default_address_name,
      customer_default_address_last_name,
      customer_default_address_first_name,
      customer_default_address_country_name,
      billing_address_name,
      billing_address_last_name,
      billing_address_first_name
    ]
  }
}
