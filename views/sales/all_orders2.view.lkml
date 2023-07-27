# # UNPIVOTED ALL ORDERS


view: all_orders2 {
  # label: "All Orders 2.0 - In Dev"
  sql_table_name: sales.all_orders2 ;;


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

  # dimension: asin {
  #   type: string
  #   sql: ${TABLE}.asin ;;
  # }

  dimension: billingaddress_country {
    type: string
    sql: ${TABLE}.billingaddress_country ;;
  }

  dimension: billingaddress_worldregion {
    type: string
    sql: ${TABLE}.billingaddress_worldregion ;;
  }

  dimension: companyname {
    type: string
    sql: ${TABLE}.companyname ;;
  }

  # dimension: cseg_owlproductline {
  #   type: string
  #   sql: ${TABLE}.cseg_owlproductline ;;
  # }

  # dimension: cseg_owlrevcategory {
  #   type: string
  #   sql: ${TABLE}.cseg_owlrevcategory ;;
  # }

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

  dimension: entity_internalid {
    type: string
    sql: ${TABLE}.entity_internalid ;;
  }

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

  # dimension: order_date {
  #   type: string
  #   sql: ${TABLE}. ;;
  # }

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
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: quantitybilled {
    type: number
    sql: ${TABLE}.quantitybilled ;;
  }

  dimension: quantityfulfilled {
    type: number
    sql: ${TABLE}.quantityfulfilled ;;
  }

  dimension: sales_channel {
    type: string
    sql: ${TABLE}.sales_channel ;;
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
  }

}
