view: nps_surveys_postgres {
  label: "NPS Surveys"
  sql_table_name: public.nps_surveys_postgres ;;

## DIMENSIONS

  dimension: row_num {
    primary_key: yes
    # type:
    sql: ${TABLE}."row_num" ;;
  }

  dimension: survey_source {
    type: string
    sql: ${TABLE}."survey_source" ;;
  }

  dimension_group: start {
    label: "Survey Start"
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
    sql: ${TABLE}."start_date" ;;
  }

  dimension_group: end {
    label: "Survey Submission"
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
    sql: ${TABLE}."end_date" ;;
  }

  dimension: response_type {
    hidden: yes
    type: string
    sql: ${TABLE}."response_type" ;;
  }

  dimension: ip_address {
    hidden: yes
    type: string
    sql: ${TABLE}."ip_address" ;;
  }

  dimension: progress {
    label: "Survey Progess - % Completion"
    type: number
    sql: ${TABLE}."progress" ;;
  }

  dimension: duration_seconds {
    label: "Number of Seconds to Complete Survey"
    type: number
    sql: ${TABLE}."duration_seconds" ;;
  }

  dimension: finished {
    label: "Is Survey Completed?"
    type: yesno
    sql: ${TABLE}."finished" ;;
  }

  dimension_group: recorded {
    hidden: yes
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
    sql: ${TABLE}."recorded_date" ;;
  }

  dimension: response_id {
    hidden: yes
    type: string
    sql: ${TABLE}."response_id" ;;
  }

  dimension: recipient_lastname {
    hidden: yes
    type: string
    sql: ${TABLE}."recipient_lastname" ;;
  }

  dimension: recipient_firstname {
    hidden: yes
    type: string
    sql: ${TABLE}."recipient_firstname" ;;
  }

  dimension: recipient_email {
    hidden: yes
    type: string
    sql: ${TABLE}."recipient_email" ;;
  }

  dimension: external_reference {
    hidden: yes
    type: string
    sql: ${TABLE}."external_reference" ;;
  }

  dimension: location_latitude {
    hidden: yes
    type: string
    sql: ${TABLE}."location_latitude" ;;
  }

  dimension: location_longitude {
    hidden: yes
    type: string
    sql: ${TABLE}."location_longitude" ;;
  }

  dimension: distribution_channel {
    hidden: yes
    type: string
    sql: ${TABLE}."distribution_channel" ;;
  }

  dimension: user_language {
    hidden: yes
    type: string
    sql: ${TABLE}."user_language" ;;
  }

  dimension: device {
    # label: "Which product are you providing feedback on?"
    type: string
    sql: ${TABLE}."device" ;;
  }

  dimension: recommend_score {
    label: "How likely is it that you would recommend this device to a colleague?"
    type: number
    sql: ${TABLE}."recommend_score" ;;
  }

  dimension: recommend_score_reason {
    label: "What is the top reason you gave the score you did?"
    type: string
    sql: ${TABLE}."recommend_score_reason" ;;
  }

  dimension: magic_wand {
    label: "If you could wave a magic wand and make this device do one more thing, what would it be?"
    type: string
    sql: ${TABLE}."magic_wand" ;;
  }

  dimension: product_market_fit {
    label: "How would you feel if you could no longer use the device?"
    type: string
    sql: ${TABLE}."product_market_fit" ;;
  }

  dimension: biggest_device_benefit {
    label: "What do you consider the biggest benefit of the device?"
    type: string
    sql: ${TABLE}."biggest_device_benefit" ;;
  }

  dimension: customer_support_rating {
    label: "To what extent do you agree or disagree with the following statement: Owl Labs made it easy for me to solve questions or issues with my device."
    type: string
    sql: ${TABLE}."customer_support_rating" ;;
  }

  dimension: calendaring_system_select {
    label: "What calendaring system do you use?"
    type: string
    sql: ${TABLE}."calendaring_system_select" ;;
  }

  dimension: calendaring_system_text {
    label: "What calendaring system do you use? (Other text)"
    type: string
    sql: ${TABLE}."calendaring_system_text" ;;
  }

  dimension: videoconferencing_system_select {
    label: "What videoconferencing system do you use?"
    type: string
    sql: ${TABLE}."videoconferencing_system_select" ;;
  }

  dimension: videoconferencing_system_text {
    label: "What videoconferencing system do you use? (Other text)"
    type: string
    sql: ${TABLE}."videoconferencing_system_text" ;;
  }

  dimension: device_predominant_use_select {
    label: "Our Owl is used predominantly to,"
    type: string
    sql: ${TABLE}."device_predominant_use_select" ;;
  }

  dimension: device_predominant_use_text {
    label: "Our Owl is used predominantly to, (Other text)"
    type: string
    sql: ${TABLE}."device_predominant_use_text" ;;
  }

  dimension: add_remove_wb_capture {
    label: "What would you add or remove from Whiteboard Capture?"
    type: string
    sql: ${TABLE}."add_remove_wb_capture" ;;
  }

  dimension: role_description_select {
    label: "Which best describes your role?"
    type: string
    sql: ${TABLE}."role_description_select" ;;
  }

  dimension: role_description_text {
    label: "Which best describes your role? (Other text)"
    type: string
    sql: ${TABLE}."role_description_text" ;;
  }

  dimension: employee_count {
    # label: "Number of Employees"
    label: "How many employees does your organization have?"
    type: string
    sql: ${TABLE}."employee_count" ;;
  }

  dimension: company_name {
    label: "What company do you work for?"
    type: string
    sql: ${TABLE}."company_name" ;;
  }

  dimension: thank_you_gift_email {
    type: string
    sql: ${TABLE}."thank_you_gift_email" ;;
  }

  dimension: nps_bucket_int {
    hidden: yes
    type: number
    sql: case where ${recommend_score} in (9,10) then 1
              where ${recommend_score} in (7,8) then 0
              where ${recommend_score} in (1,2,3,4,5,6) then -1
              else null end;;
  }

  dimension: nps_bucket {
    label: "Net Promoter Category"
    type: string
    sql: case where ${recommend_score} in (9,10) then 'Promoter'
              where ${recommend_score} in (7,8) then 'Passive'
              where ${recommend_score} in (1,2,3,4,5,6) then 'Detractor'
              else null end;;
  }

## MEASURES

  measure: nps_score {
    label: "NPS Score"
    type: number
    sql: sum(${nps_bucket_int}) / count(${recommend_score}) ;;
#     ((Count(distinct case when `Score Full` in ('9', '10') then `Timestamp` end)
# /
# Count(distinct case when `Score Full` in ('0','1','2','3','4','5','6','7','8','9','10') then `Timestamp` end ))
# -
# (Count(distinct case when `Score Full` in ('0','1','2','3','4','5','6')  then `Timestamp` end)
# /
# Count(distinct case when `Score Full` in ('0','1','2','3','4','5','6','7','8','9','10') then `Timestamp` end )))*100
  }

  measure: count_scores {
    label: "Number of Scores"
    type: number
    sql: count(${recommend_score} ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [recipient_lastname, recipient_firstname, company_name]
  # }

  measure: total_duration_seconds {
    type: sum
    sql: ${duration_seconds} ;;
  }

  measure: average_duration_seconds {
    type: average
    sql: ${duration_seconds} ;;
  }
}