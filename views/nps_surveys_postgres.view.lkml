# view: nps_surveys_postgres {
#   sql_table_name: public.nps_surveys_postgres ;;

# ## DIMENSIONS

#   dimension: survey_source {
#     type: string
#     sql: ${TABLE}."survey_source" ;;
#   }

#   dimension_group: start {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}."start_date" ;;
#   }

#   dimension_group: end {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}."end_date" ;;
#   }

#   dimension: response_type {
#     type: string
#     sql: ${TABLE}."response_type" ;;
#   }

#   dimension: ip_address {
#     type: string
#     sql: ${TABLE}."ip_address" ;;
#   }

#   dimension: progress {
#     type: number
#     sql: ${TABLE}."progress" ;;
#   }

#   dimension: duration_seconds {
#     type: number
#     sql: ${TABLE}."duration_seconds" ;;
#   }

#   dimension: finished {
#     type: yesno
#     sql: ${TABLE}."finished" ;;
#   }

#   dimension_group: recorded {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}."recorded_date" ;;
#   }

#   dimension: response_id {
#     primary_key: yes
#     type: string
#     sql: ${TABLE}."response_id" ;;
#   }

#   dimension: recipient_lastname {
#     hidden: yes
#     type: string
#     sql: ${TABLE}."recipient_lastname" ;;
#   }

#   dimension: recipient_firstname {
#     hidden: yes
#     type: string
#     sql: ${TABLE}."recipient_firstname" ;;
#   }

#   dimension: recipient_email {
#     hidden: yes
#     type: string
#     sql: ${TABLE}."recipient_email" ;;
#   }

#   dimension: external_reference {
#     hidden: yes
#     type: string
#     sql: ${TABLE}."external_reference" ;;
#   }

#   dimension: location_latitude {
#     hidden: yes
#     type: string
#     sql: ${TABLE}."location_latitude" ;;
#   }

#   dimension: location_longitude {
#     hidden: yes
#     type: string
#     sql: ${TABLE}."location_longitude" ;;
#   }

#   dimension: distribution_channel {
#     type: string
#     sql: ${TABLE}."distribution_channel" ;;
#   }

#   dimension: user_language {
#     hidden: yes
#     type: string
#     sql: ${TABLE}."user_language" ;;
#   }

#   dimension: device {
#     type: string
#     sql: ${TABLE}."device" ;;
#   }

#   dimension: recommend_score {
#     type: number
#     sql: ${TABLE}."recommend_score" ;;
#   }

#   dimension: recommend_score_reason {
#     type: string
#     sql: ${TABLE}."recommend_score_reason" ;;
#   }

#   dimension: magic_wand {
#     type: string
#     sql: ${TABLE}."magic_wand" ;;
#   }

#   dimension: product_market_fit {
#     type: string
#     sql: ${TABLE}."product_market_fit" ;;
#   }

#   dimension: biggest_device_benefit {
#     type: string
#     sql: ${TABLE}."biggest_device_benefit" ;;
#   }

#   dimension: customer_support_rating {
#     type: string
#     sql: ${TABLE}."customer_support_rating" ;;
#   }

#   dimension: calendaring_system_select {
#     type: string
#     sql: ${TABLE}."calendaring_system_select" ;;
#   }

#   dimension: calendaring_system_text {
#     type: string
#     sql: ${TABLE}."calendaring_system_text" ;;
#   }

#   dimension: videoconferencing_system_select {
#     type: string
#     sql: ${TABLE}."videoconferencing_system_select" ;;
#   }

#   dimension: videoconferencing_system_text {
#     type: string
#     sql: ${TABLE}."videoconferencing_system_text" ;;
#   }

#   dimension: device_predominant_use_select {
#     type: string
#     sql: ${TABLE}."device_predominant_use_select" ;;
#   }

#   dimension: device_predominant_use_text {
#     label: "Owl Predominant Use"
#     type: string
#     sql: ${TABLE}."device_predominant_use_text" ;;
#   }

#   dimension: add_remove_wb_capture {
#     type: string
#     sql: ${TABLE}."add_remove_wb_capture" ;;
#   }

#   dimension: role_description_select {
#     type: string
#     sql: ${TABLE}."role_description_select" ;;
#   }

#   dimension: role_description_text {
#     type: string
#     sql: ${TABLE}."role_description_text" ;;
#   }

#   dimension: employee_count {
#     label: "Number of Employees"
#     type: string
#     sql: ${TABLE}."employee_count" ;;
#   }

#   dimension: company_name {
#     type: string
#     sql: ${TABLE}."company_name" ;;
#   }

#   dimension: thank_you_gift_email {
#     type: string
#     sql: ${TABLE}."thank_you_gift_email" ;;
#   }

# ## MEASURES

# #   measure: nps_score {
# #     type: number
# #     ((Count(distinct case when `Score Full` in ('9', '10') then `Timestamp` end)
# # /
# # Count(distinct case when `Score Full` in ('0','1','2','3','4','5','6','7','8','9','10') then `Timestamp` end ))
# # -
# # (Count(distinct case when `Score Full` in ('0','1','2','3','4','5','6')  then `Timestamp` end)
# # /
# # Count(distinct case when `Score Full` in ('0','1','2','3','4','5','6','7','8','9','10') then `Timestamp` end )))*100


# #     }

#   measure: count {
#     type: count
#     drill_fields: [recipient_lastname, recipient_firstname, company_name]
#   }

#   measure: total_duration_seconds {
#     type: sum
#     sql: ${duration_seconds} ;;
#   }

#   measure: average_duration_seconds {
#     type: average
#     sql: ${duration_seconds} ;;
#   }
# }
