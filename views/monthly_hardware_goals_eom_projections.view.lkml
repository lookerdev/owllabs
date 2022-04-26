view: monthly_hardware_goals_eom_projections {
  label: "Monthly Sales Goals & EOM Projections"
  # sql_table_name: public.monthly_hardware_goals_fulfillments ;;
  # drill_fields: []

  derived_table: {
    sql: with a as (
          select
          extract(month from fulfillment_date) as fulfillment_month,
          extract(year from fulfillment_date) as fulfillment_year,
          cast(date_trunc('month', fulfillment_date) as date) as fulfillment_month_first_day,
          last_day(cast(fulfillment_date as date)) as fulfillment_month_last_day,
          /*remove*/ sum(og_quantity_shipped) + sum(pro_quantity_shipped) as all_owls_shipped,
          sum(pro_quantity_shipped) as all_pro_shipped,
          sum(hq_quantity_shipped) as all_hq_shipped,
          sum(wbo_quantity_shipped) as all_wbo_shipped,
          /*remove*/ sum(pro_quantity_shipped) + sum(hq_quantity_shipped) + sum(wbo_quantity_shipped) as all_hardware_shipped
          from all_fulfillments
          where sku not in ('MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','PTW100-1000-RPL','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPPS','REPPS - Universal','REPUSB','REPUSB - Universal','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','WBC100-1000-RPL','TEST2','TEST3') /*exclude replacements skus*/
          group by
          extract(month from fulfillment_date),
          extract(year from fulfillment_date),
          cast(date_trunc('month', fulfillment_date) as date),
          last_day(cast(fulfillment_date as date))
          ),

          b as (
            select * from public.monthly_hardware_goals
          ),

          c as (
          select
          extract(month from order_date) as order_month,
          extract(year from order_date) as order_year,
          cast(date_trunc('month', order_date) as date) as order_month_first_day,
          last_day(cast(order_date as date)) as order_month_last_day,
          /*remove*/ sum(og_quantity_ordered) + sum(pro_quantity_ordered) as all_owls_ordered,
          sum(pro_quantity_ordered) as all_pro_ordered,
          sum(hq_quantity_ordered) as all_hq_ordered,
          sum(wbo_quantity_ordered) as all_wbo_ordered,
          /*remove*/ sum(pro_quantity_ordered) + sum(hq_quantity_ordered) + sum(wbo_quantity_ordered) as all_hardware_ordered
          from all_orders
          where sku not in ('MTW100-1000-RPL','MTW100-2000 - Replacement','MTW100-2000-RPL','MTW200-1000-RPL','MTW200-1000-RPL-CA','MTW200-2000 - Replacement','MTW200-2000-RPL','PTW100-1000-RPL','REPLC - NA','REPLC - UK','REPLC - US/CA','REPLC100-1000','REPLC100-1000-NA','REPLC100-2000','REPLC100-2001','REPPS','REPPS - Universal','REPUSB','REPUSB - Universal','Replacement AC Line Cord','Replacement Power Supply','Replacement USB Cable (6.5-Foot)','WBC100-1000-RPL','TEST2','TEST3') /*exclude replacements skus*/
          group by
          extract(month from order_date),
          extract(year from order_date),
          cast(date_trunc('month', order_date) as date),
          last_day(cast(order_date as date))
          )

          select
          b.month_name,
          b.month_number,
          b.year,
          cast(b.month_start as date) as month_start,
          cast(b.month_end as date) as month_end,
          a.fulfillment_month_first_day,
          a.fulfillment_month_last_day,
          /*remove*/ a.all_owls_shipped,
          a.all_pro_shipped,
          a.all_hq_shipped,
          a.all_wbo_shipped,
          /*remove*/ a.all_hardware_shipped,
          b.owls_goal as mop_goal,
          b.hq_goal,
          b.wbo_goal,
          b.total_hardware_goal,
--          c.order_month,
--          c.order_year,
          c.order_month_first_day,
          c.order_month_last_day,
          /*remove*/ c.all_owls_ordered,
          c.all_pro_ordered,
          c.all_hq_ordered,
          c.all_wbo_ordered,
          /*remove*/ c.all_hardware_ordered
          --,(a.all_owls_shipped / (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,a.fulfillment_month_first_day) - 1))/*days in month so far*/) * ((DATE_PART(DAYOFYEAR,a.fulfillment_month_last_day) - DATE_PART(DAYOFYEAR,a.fulfillment_month_first_day)) + 1) /*total days in month*/ as eom_projection_all_owls
          --,((a.all_owls_shipped / (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,a.fulfillment_month_first_day) - 1))/*days in month so far*/) * ((DATE_PART(DAYOFYEAR,a.fulfillment_month_last_day) - DATE_PART(DAYOFYEAR,a.fulfillment_month_first_day)) + 1) /*total days in month*/) / b.owls_goal as eom_proj_to_monthly_goal_all_owls
          --,a.all_owls_shipped / b.owls_goal as sold_to_goal_all_owls
--          ,(DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,a.fulfillment_month_first_day) - 1)) /*days in month so far*/
--          ,((DATE_PART(DAYOFYEAR,a.fulfillment_month_last_day) - DATE_PART(DAYOFYEAR,a.fulfillment_month_first_day)) + 1) /*total days in month*/
          from a
          inner join b
             on a.fulfillment_month = b.month_number
             and a.fulfillment_year = b."year"
          inner join c
            on c.order_month = b.month_number
            and c.order_year = b."year"
          order by month_start desc
 ;;
  }



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

  dimension: fulfillment_month_first_day {
    hidden: yes
    type: date
    sql: ${TABLE}.fulfillment_month_first_day ;;
  }

  dimension: fulfillment_month_last_day {
    hidden: yes
    type: date
    sql: ${TABLE}.fulfillment_month_last_day ;;
  }

# REMOVE
  dimension: all_owls_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.all_owls_shipped ;;
  }

  dimension: mop_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.all_pro_shipped ;;
  }

  dimension: hq_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.all_hq_shipped ;;
  }

  dimension: wbo_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.all_wbo_shipped ;;
  }

  dimension: all_hardware_shipped {
    hidden: yes
    type: number
    # sql: ${TABLE}.all_hardware_shipped ;;
    sql: ${mop_shipped} + ${hq_shipped} + ${wbo_shipped} ;;
  }

  dimension: order_month_first_day {
    hidden: yes
    type: date
    sql: ${TABLE}.order_month_first_day ;;
  }

  dimension: order_month_last_day {
    hidden: yes
    type: date
    sql: ${TABLE}.order_month_last_day ;;
  }

# REMOVE
  dimension: all_owls_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.all_owls_ordered ;;
  }

  dimension: mop_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.all_pro_ordered ;;
  }

  dimension: hq_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.all_hq_ordered ;;
  }

  dimension: wbo_ordered {
    hidden: yes
    type: number
    sql: ${TABLE}.all_wbo_ordered ;;
  }

  dimension: all_hardware_ordered {
    hidden: yes
    type: number
    # sql: ${TABLE}.all_hardware_ordered ;;
    sql: ${mop_ordered} + ${hq_ordered} + ${wbo_ordered} ;;
  }

# REMOVE
  dimension: all_owls_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.mop_goal ;;
  }

  dimension: mop_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.mop_goal ;;
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

  dimension: all_hardware_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.total_hardware_goal ;;
  }

# REMOVE
  dimension: percent_of_goal_all_owls {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${all_owls_shipped}/nullif(${mop_goal},0) ;;
  }

  dimension: percent_of_goal_mop {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${mop_shipped}/nullif(${mop_goal},0) ;;
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

# REMOVE
  measure: sum_all_owls_shipped {
    hidden: yes
    label: "All Owls Fulfilled MTD"
    description: "Number of Owls shipped this month to date"
    type: sum
    group_label: "MTD Fulfillments"
    sql: ${all_owls_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_all_owls._rendered_value }} of goal ;;
  }

  measure: sum_mop_shipped {
    label: "MOPs Fulfilled MTD"
    description: "Number of MOPs shipped this month to date"
    type: sum
    group_label: "MTD Fulfillments"
    sql: ${mop_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_mop._rendered_value }} of goal ;;
  }

  measure: sum_hq_shipped {
    label: "HQs Fulfilled MTD"
    description: "Number of HQs shipped this month to date"
    type: sum
    group_label: "MTD Fulfillments"
    sql: ${hq_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_hq._rendered_value }} of goal ;;  ## here we use || to concatenate the values
  }

  measure: sum_wbo_shipped {
    label: "WBOs Fulfilled MTD"
    description: "Number of WBOs shipped this month to date"
    type: sum
    group_label: "MTD Fulfillments"
    sql: ${wbo_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_wbo._rendered_value }} of goal ;;
  }

  measure: sum_all_hardware_shipped {
    label: "All Hardware Fulfilled MTD"
    description: "Number of total hardware shipped this month to date"
    type: sum
    group_label: "MTD Fulfillments"
    # group_label: "All Hardware Sales Goals & EOM Projections"
    # group_label: "All Hardware Sales Goal"
    sql: ${all_hardware_shipped} ;;
    html: {{ rendered_value }} || {{ percent_of_goal_all_hardware._rendered_value }} of goal ;;
  }


# ORDERS

# REMOVE
  measure: sum_all_owls_ordered {
    hidden: yes
    label: "All Owls Ordered MTD"
    description: "Number of Owls ordered this month to date"
    type: sum
    group_label: "MTD Orders"
    sql: ${all_owls_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_all_owls._rendered_value }} of goal ;;
  }

  measure: sum_mop_ordered {
    label: "All MOPs Ordered MTD"
    description: "Number of MOPs ordered this month to date"
    type: sum
    group_label: "MTD Orders"
    sql: ${mop_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_all_owls._rendered_value }} of goal ;;
  }

  measure: sum_hq_ordered {
    label: "HQs Ordered MTD"
    description: "Number of HQs ordered this month to date"
    type: sum
    group_label: "MTD Orders"
    sql: ${hq_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_hq._rendered_value }} of goal ;;
  }

  measure: sum_wbo_ordered {
    label: "WBOs Ordered MTD"
    description: "Number of WBOs ordered this month to date"
    type: sum
    group_label: "MTD Orders"
    sql: ${wbo_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_wbo._rendered_value }} of goal ;;
  }

  measure: sum_all_hardware_ordered {
    label: "All Hardware Ordered MTD"
    description: "Number of total hardware ordered this month to date"
    type: sum
    group_label: "MTD Orders"
    # group_label: "All Hardware Sales Goals & EOM Projections"
    # group_label: "All Hardware Sales Goal"
    sql: ${all_hardware_ordered} ;;
    # html: {{ rendered_value }} || {{ percent_of_goal_all_hardware._rendered_value }} of goal ;;
  }


# FULFILLMENT OPERATING GOALS

# REMOVE
  measure: sum_all_owls_goal {
    hidden: yes
    label: "All Owls Fulfillment Goal"
    type: sum
    group_label: "Sales Goals"
    sql: ${all_owls_goal} ;;
  }

  measure: sum_mop_goal {
    label: "MOP Fulfillment Goal"
    type: sum
    group_label: "Sales Goals"
    sql: ${mop_goal} ;;
  }

  measure: sum_hq_goal {
    label: "HQ Fulfillment Goal"
    type: sum
    group_label: "Sales Goals"
    sql: ${hq_goal} ;;
  }

  measure: sum_wbo_goal {
    label: "WBO Fulfillment Goal"
    type: sum
    group_label: "Sales Goals"
    sql: ${wbo_goal} ;;
  }

  measure: sum_all_hardware_goal {
    label: "All Hardware Fulfillment Goal"
    type: sum
    group_label: "Sales Goals"
    # group_label: "All Hardware Sales Goals & EOM Projections"
    # group_label: "All Hardware Sales Goal"
    sql: ${all_hardware_goal} ;;
  }


# FULFILLMENT GOAL REMAINING

# REMOVE
  measure: all_owls_goal_remaining {
    hidden: yes
    description: "Number of Owls that need to be shipped to meet this month's goal"
    type: number
    group_label: "Goal Remaining"
    sql: sum(${all_owls_goal}) - sum(${all_owls_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ all_owls_goal._rendered_value }} ;;
  }

  measure: mop_goal_remaining {
    label: "MOP Goal Remaining"
    description: "Number of MOPs that need to be shipped to meet this month's goal"
    type: number
    group_label: "Goal Remaining"
    sql: sum(${mop_goal}) - sum(${mop_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ mop_goal._rendered_value }} ;;
  }

  measure: hq_goal_remaining {
    label: "HQ Goal Remaining"
    description: "Number of HQs that need to be shipped to meet this month's goal"
    type: number
    group_label: "Goal Remaining"
    sql: sum(${hq_goal}) - sum(${hq_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ hq_goal._rendered_value }} ;;
  }

  measure: wbo_goal_remaining {
    label: "WBO Goal Remaining"
    description: "Number of WBOs that need to be shipped to meet this month's goal"
    type: number
    group_label: "Goal Remaining"
    sql: sum(${wbo_goal}) - sum(${wbo_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ wbo_goal._rendered_value }} ;;
  }

  measure: all_hardware_goal_remaining {
    description: "Number of total hardware that need to be shipped to meet this month's goal"
    type: number
    group_label: "Goal Remaining"
    # group_label: "All Hardware Sales Goals & EOM Projections"
    # group_label: "All Hardware Sales Goal"
    sql: sum(${all_hardware_goal}) - sum(${all_hardware_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ all_hardware_goal._rendered_value }} ;;
  }

# EOM FULFILLMENT PROJECTIONS

# REMOVE
  measure: eom_fulfillment_projection_all_owls {
    hidden: yes
    label: "All Owls EOM Fulfillment Projection"
    description: "Predicted number of Owls fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${all_owls_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1) ;;
    sql: (sum(${all_owls_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_fulfillment_projection_mop {
    label: "All Owls EOM Fulfillment Projection"
    description: "Predicted number of Owls fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${all_owls_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1) ;;
    sql: (sum(${mop_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_fulfillment_projection_hq {
    label: "HQ EOM Fulfillment Projection"
    description: "Predicted number of HQs fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${hq_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1) ;;
    sql: (sum(${hq_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_fulfillment_projection_wbo {
    label: "WBO EOM Fulfillment Projection"
    description: "Predicted number of WBOs fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${wbo_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1) ;;
    sql: (sum(${wbo_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_fulfillment_projection_all_hardware {
    label: "All Hardware EOM Fulfillment Projection"
    description: "Predicted number of total hardware fulfilled by end of month"
    group_label: "EOM Fulfillment Projections"
    # group_label: "All Hardware Sales Goals & EOM Projections"
    # group_label: "All Hardware EOM Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${all_hardware_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1) ;;
    sql: (sum(${all_hardware_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }


# EOM ORDER PROJECTIONS

# REMOVE
  measure: eom_order_projection_all_owls {
    hidden: yes
    label: "All Owls EOM Order Projection"
    description: "Predicted number of Owls ordered by end of month"
    group_label: "EOM Order Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${all_owls_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${order_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${order_month_last_day}) - DATE_PART(DAYOFYEAR,${order_month_first_day})) + 1) ;;
    sql: (sum(${all_owls_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_order_projection_mop {
    label: "All Owls EOM Order Projection"
    description: "Predicted number of Owls ordered by end of month"
    group_label: "EOM Order Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${all_owls_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${order_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${order_month_last_day}) - DATE_PART(DAYOFYEAR,${order_month_first_day})) + 1) ;;
    sql: (sum(${mop_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_order_projection_hq {
    label: "HQ EOM Order Projection"
    description: "Predicted number of HQs ordered by end of month"
    group_label: "EOM Order Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${hq_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${order_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${order_month_last_day}) - DATE_PART(DAYOFYEAR,${order_month_first_day})) + 1) ;;
    sql: (sum(${hq_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/  ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_order_projection_wbo {
    label: "WBO EOM Order Projection"
    description: "Predicted number of WBOs ordered by end of month"
    group_label: "EOM Order Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${wbo_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${order_month_first_day}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${order_month_last_day}) - DATE_PART(DAYOFYEAR,${order_month_first_day})) + 1) ;;
    sql: (sum(${wbo_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1) ;;
  }

  measure: eom_order_projection_all_hardware {
    label: "All Hardware EOM Order Projection"
    description: "Predicted number of total hardware ordered by end of month"
    group_label: "EOM Order Projections"
    # group_label: "All Hardware Sales Goals & EOM Projections"
    # group_label: "All Hardware EOM Projections"
    type: number
    value_format: "#,##0"
    # sql: (sum(${all_hardware_ordered}) / (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${order_month_first_day}) - 1))/*days in month so far*/) * ((DATE_PART(DAYOFYEAR,${order_month_last_day}) - DATE_PART(DAYOFYEAR,${order_month_first_day})) + 1) /*total days in month*/ ;;
    sql: (sum(${all_hardware_ordered}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)  ;;
  }


# PERCENT EOM TO GOAL

# REMOVE
  measure: percent_eom_to_goal_all_owls {
    hidden: yes
    label: "All Owls EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    # sql: ((sum(${all_owls_shipped}) / (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))/*days in month so far*/) * ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1)) / sum(${all_owls_goal}) ;;
    sql: ((sum(${all_owls_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${all_owls_goal}) ;;
  }

  measure: percent_eom_to_goal_mop {
    label: "MOP EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    # sql: ((sum(${all_owls_shipped}) / (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))/*days in month so far*/) * ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1)) / sum(${all_owls_goal}) ;;
    sql: ((sum(${mop_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${mop_goal}) ;;
  }


  measure: percent_eom_to_goal_hq {
    label: "HQ EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    # sql: ((sum(${all_owls_shipped}) / (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))/*days in month so far*/) * ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1)) / sum(${all_owls_goal}) ;;
    sql: ((sum(${hq_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${hq_goal}) ;;
  }

  measure: percent_eom_to_goal_wbo {
    label: "WBO EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    # sql: ((sum(${all_owls_shipped}) / (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))/*days in month so far*/) * ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1)) / sum(${all_owls_goal}) ;;
    sql: ((sum(${wbo_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${wbo_goal}) ;;
  }

  measure: percent_eom_to_goal_all_hardware {
    label: "All Hardware EOM Fulfillment Projection % of Goal"
    group_label: "EOM Fulfillment Projections % of Goal"
    type: number
    value_format_name: percent_0
    # sql: ((sum(${all_owls_shipped}) / (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${fulfillment_month_first_day}) - 1))/*days in month so far*/) * ((DATE_PART(DAYOFYEAR,${fulfillment_month_last_day}) - DATE_PART(DAYOFYEAR,${fulfillment_month_first_day})) + 1)) / sum(${all_owls_goal}) ;;
    sql: ((sum(${all_hardware_shipped}) / /*days in month so far*/ (DATE_PART(DAYOFYEAR,CURRENT_DATE) - (DATE_PART(DAYOFYEAR,${month_start}) - 1))) * /*total days in month*/ ((DATE_PART(DAYOFYEAR,${month_end}) - DATE_PART(DAYOFYEAR,${month_start})) + 1)) / sum(${all_hardware_goal}) ;;
  }

}
