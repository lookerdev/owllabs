view: item_fulfillments_aggregated {
  derived_table: {

# ALL FULFILLMENTS WITH NO FULFILLMENT TYPE FLAG
    # sql: SELECT
    #       period,
    #       channel,
    #       marketplace_segment,
    #       product_category,
    #       product_line,
    #       SUM(quantity) AS aggregated_quantity
    #     FROM item_fulfillments_looker
    #     GROUP BY
    #       period,
    #       product_line,
    #       product_category,
    #       marketplace_segment,
    #       channel ;;

# ALL FULFILLMENTS WITH FLAG FOR FULFILLMENT TYPE
    # sql: SELECT
    #       period,
    #       channel,
    #       marketplace_segment,
    #       product_category,
    #       product_line,
    #       CASE WHEN item IN ('ACC100-1000','ACC100-2000','ACC100-2001','PTW100-1000','PTW100-2000','MTW100-1000','MTW100-2000','MTW200-1000','MTW200-2000','MTW200-3000','MTW200-4000','PPK100-0000','PPK100-2000','PPK200-0000','PPK200-0000-UPDATE','PPK200-2000','PPK200-2000-UPDATE','PPKU200-1000','REF100-1000','REF200-1000','REF200-2000','WBC100-1000','WBC100-2000','Refund Liability - HQ','Refund Liability - Owl','Refund Liability - WBO') THEN 'Revenue Units'
    #           WHEN item IN ('REPLC - NA','REPLC100-1000','REPLC100-2000','REPLC100-2001','REPPS - Universal','REPUSB - Universal','PTW100-1000-RPL','PTW100-2000-RPL','MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-2000-RPL','WBC100-1000-RPL','WBC100-2000-RPL') THEN 'Other Units'
    #           ELSE 'N/A' END AS fulfillment_type,
    #       SUM(quantity) AS aggregated_quantity
    #     FROM item_fulfillments_looker
    #     GROUP BY
    #       period,
    #       product_line,
    #       product_category,
    #       marketplace_segment,
    #       channel ,
    #       fulfillment_type ;;

# ONLY REVENUE UNIT FULFILLMENTS
    sql: SELECT
          period,
          channel,
          marketplace_segment,
          product_category,
          product_line,
          SUM(quantity) AS aggregated_quantity
         FROM item_fulfillments_looker
         WHERE item in ('ACC100-1000','ACC100-2000','ACC100-2001','PTW100-1000','PTW100-2000','MTW100-1000','MTW100-2000','MTW200-1000','MTW200-2000','MTW200-3000','MTW200-4000','PPK100-0000','PPK100-2000','PPK200-0000','PPK200-0000-UPDATE','PPK200-2000','PPK200-2000-UPDATE','PPKU200-1000','REF100-1000','REF200-1000','REF200-2000','WBC100-1000','WBC100-2000','Refund Liability - HQ','Refund Liability - Owl','Refund Liability - WBO')
         GROUP BY
          period,
          product_line,
          product_category,
          marketplace_segment,
          channel ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql:${TABLE}.period || ${TABLE}.channel || ${TABLE}.marketplace_segment || ${TABLE}.product_category || ${TABLE}.product_line;;
    # sql:${TABLE}.period || ${TABLE}.channel || ${TABLE}.marketplace_segment || ${TABLE}.product_category || ${TABLE}.product_line || ${TABLE}.fulfillment_type;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  # dimension: fulfillment_type {
  #   type: string
  #   sql: ${TABLE}.fulfillment_type ;;
  # }

  dimension: marketplace_segment {
    type: string
    sql: ${TABLE}.marketplace_segment ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
  }

  measure: aggregated_quantity {
    type: sum
    sql: ${TABLE}.aggregated_quantity ;;
  }

}
