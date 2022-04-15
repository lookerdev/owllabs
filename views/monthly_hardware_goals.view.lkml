view: monthly_hardware_goals {
  # label: ""
  # sql_table_name: public.monthly_hardware_goals_fulfillments ;;
  # drill_fields: []

  derived_table: {
    sql: with a as (
          select
          extract(month from fulfillment_date) as fulfillment_month,
          extract(year from fulfillment_date) as fulfillment_year,
          cast(date_trunc('month', fulfillment_date) as date) as fulfillment_month_first_day,
          last_day(cast(fulfillment_date as date)) as fulfillment_month_last_day,
          sum(og_quantity_shipped) + sum(pro_quantity_shipped) as all_owls_shipped,
          sum(hq_quantity_shipped) as all_hq_shipped,
          sum(wbo_quantity_shipped) as all_wbo_shipped,
          sum(og_quantity_shipped) + sum(pro_quantity_shipped) + sum(hq_quantity_shipped) + sum(wbo_quantity_shipped) as all_hardware_shipped
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
          )

          select b.month_name, b.month_number, b.year, cast(b.month_start as date) as month_start, cast(b.month_end as date) as month_end, a.fulfillment_month_first_day, a.fulfillment_month_last_day, a.all_owls_shipped, a.all_hq_shipped, a.all_wbo_shipped, a.all_hardware_shipped, b.owls_goal, b.hq_goal, b.wbo_goal, b.total_hardware_goal
          from a
          inner join b
              on b.month_number = a.fulfillment_month
              and b."year" = a.fulfillment_year
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

  dimension: all_owls_shipped {
    hidden: yes
    type: number
    sql: ${TABLE}.all_owls_shipped ;;
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
    sql: ${TABLE}.all_hardware_shipped ;;
  }

  dimension: all_owls_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.owls_goal ;;
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
    # hidden: yes
    type: number
    sql: ${TABLE}.total_hardware_goal ;;
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

  dimension: percent_of_goal_all_owls {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${all_owls_shipped}/nullif(${all_owls_goal},0) ;;
  }

  dimension: percent_of_goal_all_hardware {
    hidden: yes
    type: number
    # value_format: "0\%"
    value_format_name: percent_0
    sql: ${all_hardware_shipped}/nullif(${all_hardware_goal},0) ;;
  }

  dimension: fulfillment_month_first_day {
    type: date
    sql: ${TABLE}.fulfillment_month_first_day ;;
  }

  dimension: fulfillment_month_last_day {
    type: date
    sql: ${TABLE}.fulfillment_month_last_day ;;
  }

  dimension: month_start {
    type: date
    sql: ${TABLE}.month_start ;;
  }

  dimension: month_end {
    type: date
    sql: ${TABLE}.month_end ;;
  }


## MEASURES
  measure: sum_all_owls_shipped {
    label: "All Owls Shipped"
    type: sum
    sql: ${all_owls_shipped} ;;
  }

  measure: sum_hq_shipped {
    label: "HQs Shipped"
    type: sum
    sql: ${hq_shipped} ;;
    html: {{ rendered_value }} | {{ percent_of_goal_hq._rendered_value }} of goal ;;  ## here we use || to concatenate the values
  }

  measure: sum_wbo_shipped {
    label: "WBOs Shipped"
    type: sum
    sql: ${wbo_shipped} ;;
    html: {{ rendered_value }} | {{ percent_of_goal_wbo._rendered_value }} of goal ;;
  }

  measure: sum_all_hardware_shipped {
    label: "All Hardware Shipped"
    type: sum
    sql: ${all_hardware_shipped} ;;
    html: {{ rendered_value }} | {{ percent_of_goal_all_hardware._rendered_value }} of goal ;;
  }

  measure: sum_all_owls_goal {
    label: "All Owls Goal"
    type: sum
    sql: ${all_owls_goal} ;;
    html: {{ rendered_value }} | {{ percent_of_goal_all_owls._rendered_value }} of goal ;;
  }

  measure: sum_hq_goal {
    label: "HQ Goal"
    type: sum
    sql: ${hq_goal} ;;
  }

  measure: sum_wbo_goal {
    label: "WBO Goal"
    type: sum
    sql: ${wbo_goal} ;;
  }

  measure: sum_all_hardware_goal {
    label: "All Hardware Goal"
    type: sum
    sql: ${all_hardware_goal} ;;
  }

  measure: all_hardware_goal_remaining {
    type: number
    sql: sum(${all_hardware_goal}) - sum(${all_hardware_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ all_hardware_goal._rendered_value }} ;;
  }

  measure: all_owls_goal_remaining {
    type: number
    sql: sum(${all_owls_goal}) - sum(${all_owls_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ all_owls_goal._rendered_value }} ;;
  }

  measure: hq_goal_remaining {
    label: "HQ Goal Remaining"
    type: number
    sql: sum(${hq_goal}) - sum(${hq_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ hq_goal._rendered_value }} ;;
  }

  measure: wbo_goal_remaining {
    label: "WBO Goal Remaining"
    type: number
    sql: sum(${wbo_goal}) - sum(${wbo_shipped}) ;;
    html: {{ rendered_value }} remaining of {{ wbo_goal._rendered_value }} ;;
  }



}
