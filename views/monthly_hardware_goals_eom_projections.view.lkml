view: monthly_hardware_goals_eom_projections {
  label: "Monthly Sales Goals & EOM Projections"
  sql_table_name: public.monthly_hardware_goals_v ;;
  # drill_fields: []

#   derived_table: {
#     sql: WITH goals AS (SELECT * FROM public.monthly_hardware_goals_gsheet
#                       ),
#               ordered AS (SELECT
#                           EXTRACT(month FROM order_date) AS order_month,
#                           EXTRACT(year FROM order_date) AS order_year,
#                           --CAST(date_trunc('month', order_date) AS date) AS order_month_first_day,
#                           --last_day(CAST(order_date AS date)) AS order_month_last_day,
#                           sum(pro_quantity_ordered) AS all_pro_ordered,
#                           sum(hq_quantity_ordered) AS all_hq_ordered,
#                           sum(wbo_quantity_ordered) AS all_wbo_ordered,
#                           sum(mo3_quantity_ordered) AS all_mo3_ordered
#                           FROM all_orders
#                           WHERE sku NOT IN ('EXM100-1000-RPL','MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','MTW200-4000 - RPL','MTW200-4000-RPL','MTW300-1000-RPL','MTW300-2000-RPL','PTW100-1000-RPL','REF100-1000','REF200-1000','REF200-2000','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPLCMHQ101-1000','REPLCMHQ102-0000','REPLCMHQ103-0000','REPLCWBO100-1000','REPLCWBO101-0000','REPPS - Universal','REPPS','REPUSB - Universal','REPUSB','TEST2','TEST3','VAT','WBC100-1000-RPL') /*exclude replacements skus*/
#                           GROUP BY EXTRACT(month FROM order_date),
#                                   EXTRACT(year FROM order_date),
#                                   CAST(date_trunc('month', order_date) AS date),
#                                   last_day(CAST(order_date AS date))
#                           ),
#               shipped AS (SELECT
#                           EXTRACT(month FROM fulfillment_date) AS fulfillment_month,
#                           EXTRACT(year FROM fulfillment_date) AS fulfillment_year,
#                           --CAST(date_trunc('month', fulfillment_date) AS date) AS fulfillment_month_first_day,
#                           --last_day(CAST(fulfillment_date AS date)) AS fulfillment_month_last_day,
#                           sum(pro_quantity_shipped) AS all_pro_shipped,
#                           sum(hq_quantity_shipped) AS all_hq_shipped,
#                           sum(wbo_quantity_shipped) AS all_wbo_shipped,
#                           sum(mo3_quantity_shipped) AS all_mo3_shipped
#                           FROM all_fulfillments
#                           WHERE sku NOT IN ('EXM100-1000-RPL','MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','MTW200-4000 - RPL','MTW200-4000-RPL','MTW300-1000-RPL','MTW300-2000-RPL','PTW100-1000-RPL','REF100-1000','REF200-1000','REF200-2000','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPLCMHQ101-1000','REPLCMHQ102-0000','REPLCMHQ103-0000','REPLCWBO100-1000','REPLCWBO101-0000','REPPS - Universal','REPPS','REPUSB - Universal','REPUSB','TEST2','TEST3','VAT','WBC100-1000-RPL') /*exclude replacements skus*/
#                           GROUP BY EXTRACT(month FROM fulfillment_date),
#                                   EXTRACT(year FROM fulfillment_date),
#                                   CAST(date_trunc('month', fulfillment_date) AS date),
#                                   last_day(CAST(fulfillment_date AS date))
#                           )
#           SELECT
#           goals.month_name,
#           goals.month_number,
#           goals.year,
#           CAST(goals.month_start AS date) AS month_start,
#           CAST(goals.month_end AS date) AS month_end,
#           goals.owls_goal AS mop_goal,
#           goals.hq_goal,
#           goals.wbo_goal,
#           goals.total_hardware_goal,
#           --ordered.order_month_first_day,
#           --ordered.order_month_last_day,
#           ordered.all_pro_ordered,
#           ordered.all_hq_ordered,
#           ordered.all_wbo_ordered,
#           ordered.all_mo3_ordered,
#           --shipped.fulfillment_month_first_day,
#           --shipped.fulfillment_month_last_day,
#           shipped.all_pro_shipped,
#           shipped.all_hq_shipped,
#           shipped.all_wbo_shipped,
#           shipped.all_mo3_shipped
#           FROM goals
#           inner join shipped
#             on shipped.fulfillment_month = goals.month_number
#             and shipped.fulfillment_year = goals."year"
#           inner join ordered
#             on ordered.order_month = goals.month_number
#             and ordered.order_year = goals."year"
#           order by month_start desc
# ;;
#   }


## DIMENSIONS
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.month_name || ${TABLE}.year ;;
  }

  dimension: month_name {
    hidden: yes
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: month_number {
    hidden: yes
    type: number
    sql: ${TABLE}.month_number ;;
  }

  dimension: year {
    hidden: yes
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month_start {
    label: "Month"
    type: date
    sql: ${TABLE}.month_start ;;
    html: {{ rendered_value | date: "%B %Y" }};;
    # html: {{ rendered_value | append: "-01" | date: "%B %Y" }};;
  }

  dimension: month_end {
    type: date
    sql: ${TABLE}.month_end ;;
  }

  # dimension: fulfillment_month_first_day {
  #   hidden: yes
  #   type: date
  #   sql: ${TABLE}.fulfillment_month_first_day ;;
  # }

  # dimension: fulfillment_month_last_day {
  #   hidden: yes
  #   type: date
  #   sql: ${TABLE}.fulfillment_month_last_day ;;
  # }

  dimension: mop_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.pro_shipped ;;
  }

  dimension: hq_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.hq_shipped ;;
  }

  dimension: wbo_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.wbo_shipped ;;
  }

  dimension: mo3_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.mo3_shipped ;;
  }

  dimension: all_owls_shipped {
    hidden: yes
    type: number
    sql: ${mop_shipped} + ${mo3_shipped} ;;
  }

  dimension: all_hardware_shipped {
    hidden: yes
    type: number
    sql: ${mop_shipped} + ${hq_shipped} + ${wbo_shipped} + ${mo3_shipped} ;;
  }

  # dimension: order_month_first_day {
  #   hidden: yes
  #   type: date
  #   sql: ${TABLE}.order_month_first_day ;;
  # }

  # dimension: order_month_last_day {
  #   hidden: yes
  #   type: date
  #   sql: ${TABLE}.order_month_last_day ;;
  # }

  dimension: mop_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.pro_ordered ;;
  }

  dimension: hq_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.hq_ordered ;;
  }

  dimension: wbo_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.wbo_ordered ;;
  }

  dimension: mo3_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.mo3_ordered ;;
  }

  dimension: all_owls_ordered {
    hidden: yes
    type: number
    sql: ${mop_ordered} + ${mo3_ordered} ;;
  }

  dimension: all_hardware_ordered {
    hidden: yes
    type: number
    sql: ${mop_ordered} + ${hq_ordered} + ${wbo_ordered} + ${mo3_ordered} ;;
  }

  dimension: hq_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.hq_goal ;;
  }

  dimension: wbo_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.wbo_goal ;;
  }

  dimension: all_owls_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.owls_goal ;;
  }

  dimension: all_hardware_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.total_hardware_goal ;;
  }

  dimension: percent_of_goal_all_owls {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${all_owls_shipped}/nullif(${all_owls_goal},0) ;;
  }

  dimension: percent_of_goal_hq {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${hq_shipped}/nullif(${hq_goal},0) ;;
  }

  dimension: percent_of_goal_wbo {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${wbo_shipped}/nullif(${wbo_goal},0) ;;
  }

  dimension: percent_of_goal_all_hardware {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${all_hardware_shipped}/nullif(${all_hardware_goal},0) ;;
  }


## MEASURES

# SHIPMENTS

  measure: sum_hq_shipped {
    label: "HQs Fulfilled MTD"
    description: "Number of HQs shipped this month to date"
    group_label: "MTD Fulfillments"
    type: sum
    sql: ${hq_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_hq._rendered_value }} of goal ;;  ## here we use || to concatenate the values
  }

  measure: sum_wbo_shipped {
    label: "WBOs Fulfilled MTD"
    description: "Number of WBOs shipped this month to date"
    group_label: "MTD Fulfillments"
    type: sum
    sql: ${wbo_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_wbo._rendered_value }} of goal ;;
  }

  measure: sum_all_owls_shipped {
    label: "All Owls Fulfilled MTD"
    description: "Number of Owls shipped this month to date"
    group_label: "MTD Fulfillments"
    type: sum
    sql: ${all_owls_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_all_owls._rendered_value }} of goal ;;
  }

  measure: sum_all_hardware_shipped {
    label: "All Hardware Fulfilled MTD"
    description: "Number of total hardware shipped this month to date"
    group_label: "MTD Fulfillments"
    type: sum
    sql: ${all_hardware_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_all_hardware._rendered_value }} of goal ;;
  }


# ORDERS

  measure: sum_hq_ordered {
    label: "HQs Ordered MTD"
    description: "Number of HQs ordered this month to date"
    group_label: "MTD Orders"
    type: sum
    sql: ${hq_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_hq._rendered_value }} of goal ;;
  }

  measure: sum_wbo_ordered {
    label: "WBOs Ordered MTD"
    description: "Number of WBOs ordered this month to date"
    group_label: "MTD Orders"
    type: sum
    sql: ${wbo_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_wbo._rendered_value }} of goal ;;
  }

  measure: sum_all_owls_ordered {
    # hidden: yes
    label: "All Owls Ordered MTD"
    description: "Number of Owls ordered this month to date"
    group_label: "MTD Orders"
    type: sum
    sql: ${all_owls_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_all_owls._rendered_value }} of goal ;;
  }

  measure: sum_all_hardware_ordered {
    label: "All Hardware Ordered MTD"
    description: "Number of total hardware ordered this month to date"
    group_label: "MTD Orders"
    type: sum
    sql: ${all_hardware_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_all_hardware._rendered_value }} of goal ;;
  }


# FULFILLMENT OPERATING GOALS

  measure: sum_hq_goal {
    label: "HQ Fulfillment Goal"
    group_label: "Sales Goals"
    type: sum
    sql: ${hq_goal} ;;
  }

  measure: sum_wbo_goal {
    label: "WBO Fulfillment Goal"
    group_label: "Sales Goals"
    type: sum
    sql: ${wbo_goal} ;;
  }

  measure: sum_all_owls_goal {
    # hidden: yes
    label: "All Owls Fulfillment Goal"
    group_label: "Sales Goals"
    type: sum
    sql: ${all_owls_goal} ;;
  }

  measure: sum_all_hardware_goal {
    label: "All Hardware Fulfillment Goal"
    group_label: "Sales Goals"
    type: sum
    sql: ${all_hardware_goal} ;;
  }


# FULFILLMENT GOAL REMAINING

  measure: hq_goal_remaining {
    label: "HQ Goal Remaining"
    description: "Number of HQs that need to be shipped to meet this month's goal"
    group_label: "Goal Remaining"
    type: number
    sql: sum(${hq_goal}) - sum(${hq_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ hq_goal._rendered_value }} ;;
  }

  measure: wbo_goal_remaining {
    label: "WBO Goal Remaining"
    description: "Number of WBOs that need to be shipped to meet this month's goal"
    group_label: "Goal Remaining"
    type: number
    sql: sum(${wbo_goal}) - sum(${wbo_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ wbo_goal._rendered_value }} ;;
  }

  measure: all_owls_goal_remaining {
    # hidden: yes
    description: "Number of Owls that need to be shipped to meet this month's goal"
    group_label: "Goal Remaining"
    type: number
    sql: sum(${all_owls_goal}) - sum(${all_owls_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ all_owls_goal._rendered_value }} ;;
  }

  measure: all_hardware_goal_remaining {
    description: "Number of total hardware that need to be shipped to meet this month's goal"
    group_label: "Goal Remaining"
    type: number
    sql: sum(${all_hardware_goal}) - sum(${all_hardware_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ all_hardware_goal._rendered_value }} ;;
  }


# EOM FULFILLMENT PROJECTIONS

  measure: eom_fulfillment_projection_hq {
    label: "HQ EOM Fulfillment Projection"
    description: "Predicted number of HQs fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${hq_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_fulfillment_projection_wbo {
    label: "WBO EOM Fulfillment Projection"
    description: "Predicted number of WBOs fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${wbo_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_fulfillment_projection_all_owls {
    # hidden: yes
    label: "All Owls EOM Fulfillment Projection"
    description: "Predicted number of Owls fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${all_owls_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_fulfillment_projection_all_hardware {
    label: "All Hardware EOM Fulfillment Projection"
    description: "Predicted number of total hardware fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${all_hardware_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }


# EOM ORDER PROJECTIONS

  measure: eom_order_projection_hq {
    label: "HQ EOM Order Projection"
    description: "Predicted number of HQs ordered by end of month"
    group_label: "EOM Order Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${hq_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/  ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_order_projection_wbo {
    label: "WBO EOM Order Projection"
    description: "Predicted number of WBOs ordered by end of month"
    group_label: "EOM Order Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${wbo_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_order_projection_all_owls {
    # hidden: yes
    label: "All Owls EOM Order Projection"
    description: "Predicted number of Owls ordered by end of month"
    group_label: "EOM Order Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${all_owls_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_order_projection_all_hardware {
    label: "All Hardware EOM Order Projection"
    description: "Predicted number of total hardware ordered by end of month"
    group_label: "EOM Order Projections"
    # group_label: "All Hardware Sales Goals & EOM Projections"
    # group_label: "All Hardware EOM Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${all_hardware_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)  ;;
  }


# PERCENT EOM TO GOAL

  measure: percent_eom_to_goal_hq {
    label: "HQ EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    sql: ((sum(${hq_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${hq_goal}) ;;
  }

  measure: percent_eom_to_goal_wbo {
    label: "WBO EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    sql: ((sum(${wbo_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${wbo_goal}) ;;
  }

  measure: percent_eom_to_goal_all_owls {
    # hidden: yes
    label: "All Owls EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    sql: ((sum(${all_owls_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${all_owls_goal}) ;;
  }

  measure: percent_eom_to_goal_all_hardware {
    label: "All Hardware EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    sql: ((sum(${all_hardware_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${all_hardware_goal}) ;;
  }




# DELETE

  dimension: mop_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.owls_goal ;;
  }

  dimension: percent_of_goal_mop {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${mop_shipped}/nullif(${mop_goal},0) ;;
  }

  # measure: percent_eom_to_goal_mop {
  #   label: "MOP EOM Fulfillment Projection % of Goal"
  #   group_label: "EOM Fulfillment Projections % of Goal"
  #   type: number
  #   value_format_name: percent_0
  #   sql: ((sum(${mop_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${mop_goal}) ;;
  # }

  # measure: sum_mop_goal {
  #   label: "MOP Fulfillment Goal"
  #   group_label: "Sales Goals"
  #   type: sum
  #   sql: ${mop_goal} ;;
  # }

# remove
  measure: mop_goal_remaining {
    hidden: yes
    label: "MOP Goal Remaining"
    description: "Number of MOPs that need to be shipped to meet this month's goal"
    group_label: "Goal Remaining"
    type: number
    sql: sum(${all_owls_goal}) - sum(${mop_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ mop_goal._rendered_value }} ;;
  }

  measure: sum_mop_ordered {
    hidden: yes
    label: "MOPs Ordered MTD"
    description: "Number of MOPs ordered this month to date"
    group_label: "MTD Orders"
    type: sum
    sql: ${mop_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_all_owls._rendered_value }} of goal ;;
  }

  measure: eom_fulfillment_projection_mop {
    hidden: yes
    label: "MOP EOM Fulfillment Projection"
    description: "Predicted number of MOPs fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${mop_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_order_projection_mop {
    hidden: yes
    label: "MOP EOM Order Projection"
    description: "Predicted number of MOPs ordered by end of month"
    group_label: "EOM Order Projections"
    type: number
    value_format: "#,##0"
    sql: (sum(${mop_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: sum_mop_shipped {
    hidden: yes
    label: "MOPs Fulfilled MTD"
    description: "Number of MOPs shipped this month to date"
    group_label: "MTD Fulfillments"
    type: sum
    sql: ${mop_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_mop._rendered_value }} of goal ;;
  }

  measure: sum_mo3_shipped {
    hidden: yes
    label: "MO3 Fulfilled MTD"
    description: "Number of WBOs shipped this month to date"
    group_label: "MTD Fulfillments"
    type: sum
    sql: ${mo3_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_wbo._rendered_value }} of goal ;;
  }




}
