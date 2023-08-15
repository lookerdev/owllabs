# # UNPIVOTED ALL ORDERS

view: all_orders2 {
  # label: "All Orders 2.0 - In Dev"
  drill_fields: [order_date, order_number, sales_channel, billingaddress_worldregion, sku, sum_quantity]
  # sql_table_name: sales.all_orders2 ;;
  derived_table: {
    # sql: SELECT dc."date", ao.*
    #     FROM public.dim_calendar dc
    #     LEFT JOIN sales.all_orders2 ao
    #       ON dc."date" = ao.order_date::date
    #     WHERE "date" BETWEEN '2017-01-01' AND CURRENT_DATE
    #       AND {% condition sales_channel %} ao.sales_channel {% endcondition %}
    #       AND {% condition sku_category %} ao.sku_category {% endcondition %}
    #       AND {% condition sku_product_family %} ao.sku_product_family {% endcondition %}
    #       ;;
    sql: SELECT dc."date", ao.*
        FROM public.dim_calendar dc
        LEFT JOIN sales.all_orders2 ao
          ON dc."date" = ao.order_date::date
          AND {% condition sales_channel %} ao.sales_channel {% endcondition %}
          AND {% condition billingaddress_worldregion %} ao.billingaddress_worldregion {% endcondition %}
          AND {% condition sku_category %} ao.sku_category {% endcondition %}
          AND {% condition sku_product_family %} ao.sku_product_family {% endcondition %}
          AND {% condition order_date %} ao.order_date {% endcondition %}
        WHERE dc."date" BETWEEN '2017-01-01' AND CURRENT_DATE
        ;;
  }



  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: {
      value: "date"
      label: "Date"
    }
    allowed_value: {
      value: "week"
      label: "Week"
    }
    allowed_value: {
      value: "month"
      label: "Month"
    }
    allowed_value: {
      value: "quarter"
      label: "Quarter"
    }
  }

  # https://blog.montrealanalytics.com/limit-5-create-a-dynamic-field-in-looker-d9e6b15be666
  dimension: dynamic_timeframe {
    label_from_parameter: timeframe_picker
    type: date
    sql:
      {% if timeframe_picker._parameter_value == "date" %} ${order_date}
      {% elsif timeframe_picker._parameter_value == "week" %} ${order_week}
      {% elsif timeframe_picker._parameter_value == "month" %} ${order_month}
      {% elsif timeframe_picker._parameter_value == "quarter" %} ${order_quarter}
      {% else %} ${order_date}
      {% endif %}
      ;;
  }


  dimension: row_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

# don't have these values for Amazon yet
  dimension: amount_usd {
    type: number
    sql: ${TABLE}.amount_usd ;;
  }

  dimension: asin {
    label: "Amazon ASIN"
    type: string
    sql: ${TABLE}.asin ;;
  }

  dimension: billingaddress_country {
    type: string
    sql: ${TABLE}.billingaddress_country ;;
  }

  dimension: billingaddress_worldregion {
    label: "World Region"
    type: string
    sql: ${TABLE}.billingaddress_worldregion ;;
  }

  dimension: companyname {
    type: string
    sql: ${TABLE}.companyname ;;
  }

  dimension: sku_category {
    label: "SKU Category"
    # description: "Hardware, Accessories, Subscription, etc"
    type: string
    sql: ${TABLE}.sku_category ;;
    case_sensitive: no
  }

  dimension: sku_product_family {
    label: "SKU Product Family"
    # description: "groups skus into larger device categories"
    type: string
    sql: ${TABLE}.sku_product_family ;;
    case_sensitive: no
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: custbodysalesforce_opp_id {
    label: "Salesforce Opportunity ID"
    type: string
    sql: ${TABLE}.custbodysalesforce_opp_id ;;
    # link: {
    #   label: "Salesforce Opportunity"
    #   # this is wrong - url: "https://owllabs.lightning.force.com/lightning/r/Survey_Data__c/{{ value }}/view"
    #   icon_url: "https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://salesforce.com&size=16"
    # }
  }

  # dimension: entity_internalid {
  #   type: string
  #   sql: ${TABLE}.entity_internalid ;;
  # }

  dimension: exchangerate {
    hidden: yes
    type: number
    sql: ${TABLE}.exchangerate ;;
  }

  dimension: internalid {
    label: "Netsuite Internal ID"
    type: string
    sql: ${TABLE}.internalid ;;
    # link: { add link to netsuite SO }
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    # sql: ${TABLE}.order_date ;;
    sql: ${TABLE}.date ;;
    # allow_fill: yes
  }

  dimension: order_number {
    # label: "Netsuite Sales Order Number"
    type: string
    sql: ${TABLE}.order_number ;;
    case_sensitive: no
  }

  dimension: quantity {
    type: number
    # sql: ${TABLE}.quantity ;;
    sql: coalesce(${TABLE}.quantity, 0) ;;
  }

  # dimension: quantitybilled {
  #   type: number
  #   sql: ${TABLE}.quantitybilled ;;
  # }

  # dimension: quantityfulfilled {
  #   type: number
  #   sql: ${TABLE}.quantityfulfilled ;;
  # }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
    case_sensitive: no
  }

  dimension: salesrep_name {
    type: string
    sql: ${TABLE}.salesrep_name ;;
  }

  dimension: shippingaddress_country {
    type: string
    sql: ${TABLE}.shippingaddress_country ;;
  }

  dimension: shopify_order_number {
    type: string
    sql: ${TABLE}.shopify_order_number ;;
    case_sensitive: no
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
    case_sensitive: no
  }

  dimension: sku_name {
    type: string
    sql: ${TABLE}.sku_name ;;
    case_sensitive: no
  }

  dimension: source {
    label: "System Source"
    description: "Where in the database this data comes from."
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    label: "Order Status"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: store {
    description: "Shopify or Amazon marketplace"
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: subsidiary_name {
    type: string
    sql: ${TABLE}.subsidiary_name ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }





  measure: count {
    hidden: yes
    type: count
    drill_fields: [salesrep_name, sku_name, companyname, subsidiary_name]
  }

  measure: total_amount {
    hidden: yes
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    hidden: yes
    type: average
    sql: ${amount} ;;
  }

  measure: sum_quantity {
    type: sum
    sql: ${quantity} ;;
    # sql: coalesce(${quantity}, 0) ;;
  }

}
