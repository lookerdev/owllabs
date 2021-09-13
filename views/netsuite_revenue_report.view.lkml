view: netsuite_revenue_report {
  label: "Netsuite Monthly Revenue Report"
  sql_table_name: public.revenue_rpt ;;


# Dimensions
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension_group: actual_ship_date {
    label: "Ship Date"
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
    sql: ${TABLE}.actual_ship_date ;;
  }

  dimension: amount {
    label: "Order Amount"
    description: "Price of order for the selected items in the original currency of the order"
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_usd_conversion {
    label: "Order Amount - USD Conversion"
    description: "Price of order for the selected items, converted to USD"
    type: number
    # value_format: "#,##0.00"
    value_format_name: usd
    sql: ${TABLE}.amount_usd_conversion ;;
  }

  dimension: asp {
    label: "ASP"
    description: "Average Selling Price"
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.asp ;;
  }

  dimension: billing_country {
    label: "Order Billing Country"
    # description: ""
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: class {
    label: "Channel"
  #   description: ""
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: cogs_per_item {
    label: "COGS per Item"
    description: "Cost of Goods Sold per item"
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.cogs_total ;;
  }

  dimension: cogs_total {
    label: "COGS Total"
    description: "Cost of Goods Sold per Item multiplied by the total number of items ordered"
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.cogs_total ;;
  }

  dimension: currency_name {
    label: "Currency"
    description: "Currency used to pay for the order"
    type: string
    sql: ${TABLE}.currency_name ;;
  }

  dimension: customer {
    label: "Customer Name"
    # description: ""
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: description {
    label: "Product Description"
    # description: ""
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_item_name {
    hidden: yes
    # label: ""
  #   description: ""
  #   type: number
  #   sql: ${TABLE}.discount_item_name ;;
  }

  dimension: discount_rate {
    hidden: yes
  #   label: "Discount Rate"
  #   # description: ""
  #   type: number
  #   value_format: "#,##0.00"
  #   sql: ${TABLE}.discount_rate ;;
  }

  dimension: discount_total {
    hidden: yes
  #   label: ""
  #   # description: ""
  #   type: number
  #   value_format: "#,##0.00"
  #   sql: ${TABLE}.discount_total ;;
  }

  dimension: document_number {
    label: "Document Number"
    # description: ""
    type: string
    sql: ${TABLE}.document_number ;;
  }

  dimension: invoice_approval_status {
    label: "Invoice Approval Status"
  #   description: ""
    type: string
    sql: ${TABLE}.invoice_approval_status ;;
  }

  dimension: invoice_status {
    label: "Invoice Status"
    # description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.invoice_status ;;
  }

  dimension: listprice {
    hidden: yes
  #   label: ""
  #   # description: ""
  #   type: number
  #   value_format: "#,##0.00"
  #   sql: ${TABLE}.listprice ;;
  }

  dimension: marketplace_segment {
    label: "Marketplace Segment"
  #   description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: memo {
    hidden: yes
    label: "Journal Entry Memo"
    # description: ""
    type: string
    sql: ${TABLE}.memo ;;
  }

  # dimension: product_category {
  #   label: "Product Category"
  #   description: "General product groupings"
  #   type: string
  #   sql: ${TABLE}.product_category ;;
  # }

  # dimension: product_revenue_usd {
  #   label: "Product Revenue - USD Conversion"
  #   description: "Total revenue captured from this line item based on item fulfillments or return status in USD"
  #   type: number
  #   # value_format: "#,##0.00"
  #   value_format_name: usd
  #   sql: ${TABLE}.product_revenue_usd ;;
  # }

  dimension: quantity {
    label: "Quantity Ordered"
    description: "The number of items ordered"
    type: number
    sql: ${TABLE}.quantity ;;
  }

  # dimension: quantityfulfilled {
  #   label: "Quantity Fulfilled"
  #   description: "The number of items that have been shipped"
  #   type: number
  #   sql: ${TABLE}.quantity_fulfilled ;;
  # }

  dimension: rate {
    label: "Rate" # add better dimension name
      description: "List price in original order currency"
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.rate ;;
  }

  dimension: revenue_account {
    label: "Revenue Account"
    # description: ""
    type: string
    sql: ${TABLE}.revenue_account ;;
  }

  dimension: sales_order_status {
    label: "Sales Order Status"
    description: "Status of the Sales Order"
    type: string
    sql: ${TABLE}.sales_order_status ;;
  }

  dimension: ship_status {
    label: "Shipping Status"
    description: "Status of shippinh"
    type: string
    sql: ${TABLE}.ship_status ;;
  }

  dimension: shipping_country {
    label: "Order Shipping Country"
    # description: ""
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: shipping_cost {
    label: "Shipping Cost"
  #   # description: ""
    type: number
    value_format: "#,##0.00"
    sql: ${TABLE}.shipping_cost ;;
  }

  dimension: shopify_order_number {
    label: "Shopify Order Number"
    type: string
    sql: ${TABLE}.shopify_order_number ;;
  }

  dimension: sku {
    label: "Product SKU"
    #   description: ""
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: status {
  label: "Document Status"
    description: "The status of the document listed in Document Number. If this document is a Sales Order, this value will match the Sales Order Status value. If this document is an Invoice, this value will match the Invoice Status value."
    type: string
    sql: ${TABLE}.transaction_status ;;
  }

  dimension_group: transaction_date {
    label: "Transaction Date"
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
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: document_type {
    label: "Document Type"
    # description: ""
    type: string
    sql: ${TABLE}.document_type ;;
  }

  dimension: product_revenue_usd {
    label: "Product Revenue - USD"
    # description: ""
    type: number
    value_format: "#,##0.00"
    sql: coalesce(${TABLE}.item_list_quantity_fulfilled::float * ${TABLE}.rate::float * ${TABLE}.exchange_rate::float, case when ${TABLE}.ship_status is not null then ${TABLE}.item_list_amount::float end * ${TABLE}.exchange_rate::float, ${TABLE}.debit::float * -1 * ${TABLE}.exchange_rate::float, (case when ${TABLE}.document_type = 'CreditMemo' then ${TABLE}.item_list_amount::float * -1 end) * ${TABLE}.exchange_rate::float) ;;
  }


  # Measures
  measure: total_ordered_quantity {
    label: "Total Ordered Quantity"
    # description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${quantity} ;;
  }

  # measure: total_fulfilled_quantity {
  #   label: "Total Fulfilled Quantity"
  #   # description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${quantityfulfilled} ;;
  # }

  measure: total_product_revenue {
    label: "Total Product Revenue - USD"
    # description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${product_revenue_usd} ;;
  }

  # measure: amount {
  #   label: "Order Amount"
  #   description: "Price of order for the selected items in the original currency of the order"
  #   type: number
  #   value_format: "#,##0.00"
  #   sql: ${TABLE}.amount ;;
  # }

  # measure: amount_usd_conversion {
  #   label: "Order Amount - USD Conversion"
  #   description: "Price of order for the selected items, converted to USD"
  #   type: number
  #   # value_format: "#,##0.00"
  #   value_format_name: usd
  #   sql: ${TABLE}.amount_usd_conversion ;;
  # }

  # measure: asp {
  #   label: "Average Selling Price (ASP)"
  #   # description: ""
  #   type: number
  #   value_format: "#,##0.00"
  #   sql: ${TABLE}.asp ;;
  # }


# Filter
  filter: date_filter {
    type: date
    sql: {% condition date_filter %} ${TABLE}.actual_ship_date {% endcondition %} OR {% condition date_filter %} ${TABLE}.transaction_date {% endcondition %} ;;
  }
  }
