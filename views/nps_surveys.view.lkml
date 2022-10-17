view: nps_surveys {
  label: "NPS Surveys"
  sql_table_name: nps.nps_surveys ;;

## DIMENSIONS

  dimension: row_num {
    # label: "Survey ID"
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.row_num ;;
  }


  dimension_group: start {
    # hidden: yes
    group_label: "Qualtrics Metadata"
    label: "Survey Start"
    type: time
    timeframes: [
      raw,
      date
    ]
    sql: ${TABLE}.start_date ;;
    allow_fill: yes
  }

  dimension_group: end {
    label: "Survey Submission"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
    allow_fill: yes
  }

  dimension: response_type {
    description: "IP Address: A normal response, Survey Preview: A preview response, Survey Test: A test response, Imported: An imported response, Spam: A possible spam response, Preview Spam: A possible spam response submitted through the preview link, Imported Spam: A possible spam response that was imported, Offline: A Qualtrics Offline App response, Offline Preview: Previews submitted through the Qualtrics Offline App. This feature is deprecated in latest versions of the app"
    # hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.response_type ;;
  }

  dimension: ip_address {
    # hidden: yes
    group_label: "Qualtrics Metadata"
    description: "Responder's IP address"
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: progress {
    label: "Survey Progess - % Completed"
    group_label: "Qualtrics Metadata"
    type: number
    value_format: "0\%"
    sql: ${TABLE}.progress ;;
  }

  dimension: duration_seconds {
    label: "Survey Completion Duration (seconds)"
    description: "Number of seconds it took for responder to complete the survey"
    group_label: "Qualtrics Metadata"
    type: number
    sql: ${TABLE}.duration_seconds ;;
  }

  dimension: finished {
    label: "Is Survey Completed?"
    group_label: "Qualtrics Metadata"
    type: yesno
    sql: ${TABLE}.finished ;;
  }

  dimension_group: recorded {
    hidden: yes
    type: time
    timeframes: [
      raw,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.recorded_date ;;
  }

  dimension: response_id {
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.response_id ;;
  }

  dimension: recipient_lastname {
    hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.recipient_lastname ;;
  }

  dimension: recipient_firstname {
    hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.recipient_firstname ;;
  }

  dimension: recipient_email {
    hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.recipient_email ;;
  }

  dimension: external_reference {
    hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.external_reference ;;
  }

  dimension: location_latitude {
    # hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.location_latitude ;;
  }

  dimension: location_longitude {
    # hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.location_longitude ;;
  }

  dimension: distribution_channel {
    # hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.distribution_channel ;;
  }

  dimension: user_language {
    # hidden: yes
    group_label: "Qualtrics Metadata"
    type: string
    sql: ${TABLE}.user_language ;;
  }

  dimension: device {
    label: "Device Type"
    # label: "Which product are you providing feedback on?"
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: recommend_score {
    # label: "How likely is it that you would recommend this device to a colleague?"
    description: "Survey question: How likely is it that you would recommend this device to a colleague?"
    group_label: "Survey Questions"
    type: number
    sql: ${TABLE}.recommend_score ;;
  }

  dimension: recommend_score_reason {
    # label: "What is the top reason you gave the score you did?"
    description: "Survey question: What is the top reason you gave the score you did?"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.recommend_score_reason ;;
  }

  dimension: magic_wand {
    # label: "If you could wave a magic wand and make this device do one more thing, what would it be?"
    description: "Survey question: If you could wave a magic wand and make this device do one more thing, what would it be?"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.magic_wand ;;
  }

  dimension: product_market_fit {
    # label: "How would you feel if you could no longer use the device?"
    description: "Survey question: How would you feel if you could no longer use the device?"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.product_market_fit ;;
  }

  dimension: biggest_device_benefit {
    label: "Biggest Device Benefit/Device Does Well"
    # label: "What do you consider the biggest benefit of the device?"
    description: "Combines results from 2 questions - 'What do you consider the biggest benefit of the [device]?' in 0mo HQ & WBO surveys, 'What does the [device] do well?' from all 6mo & 12mo surveys"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.biggest_device_benefit ;;
  }

  dimension: customer_support_rating {
    # label: "To what extent do you agree or disagree with the following statement: Owl Labs made it easy for me to solve questions or issues with my device."
    description: "Survey question: To what extent do you agree or disagree with the following statement: Owl Labs made it easy for me to solve questions or issues with my device."
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.customer_support_rating ;;
  }

  dimension: calendaring_system_select {
    label: "Calendaring System"
    description: "Survey question: What calendaring system do you use?"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.calendaring_system_select ;;
  }

  dimension: calendaring_system_text {
    label: "Calendaring System (Other text)"
    description: "Survey question: What calendaring system do you use? (Other text)"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.calendaring_system_text ;;
  }

  dimension: videoconferencing_system_select {
    label: "Videoconferencing System"
    description: "Survey question: What videoconferencing system do you use?"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.videoconferencing_system_select ;;
  }

  dimension: videoconferencing_system_text {
    label: "Videoconferencing System (Other text)"
    description: "Survey question: What videoconferencing system do you use? (Other text)"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.videoconferencing_system_text ;;
  }

  dimension: device_predominant_use_select {
    label: "Predominant Use"
    description: "Survey question: Our Owl is used predominantly to"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.device_predominant_use_select ;;
  }

  dimension: device_predominant_use_text {
    label: "Predominant Use (Other text)"
    description: "Survey question: Our Owl is used predominantly to (Other text)"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.device_predominant_use_text ;;
  }

  dimension: add_remove_wb_capture {
    label: "WB Capture Add/Remove"
    description: "Survey question: What would you add or remove from Whiteboard Capture?"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.add_remove_wb_capture ;;
  }

  dimension: wifi_always_connected_select {
    label: "Wifi Always Connected?"
    description: "Survey question: Do you keep your Meeting Owl Pro connected to WiFi at all times? "
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.wifi_always_connected_select ;;
  }

  dimension: wifi_always_connected_text {
    label: "Wifi Always Connected? ('No' text)"
    description: "Survey question: Can you tell us why you don't keep your Meeting Owl Pro connected to WiFi at all times? "
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.wifi_always_connected_text ;;
  }

  dimension: hybrid_collab_pain_point {
    label: "Hybrid Collab Pain Point"
    description: "Survey question: What is your biggest pain point with hybrid collaboration?"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.hybrid_collab_pain_point ;;
  }

  dimension: subscription_feature_request {
    # label: ""
    description: "Survey question: What features or benefits would you like to see included in the device's annual subscription?"
    group_label: "Survey Questions"
    type: string
    sql: ${TABLE}.subscription_feature_request ;;
  }

  dimension: role_description_select {
    label: "Which best describes your role?"
    group_label: "Responder Info"
    type: string
    sql: ${TABLE}."role_description_select" ;;
  }

  dimension: role_description_text {
    label: "Which best describes your role? - free text"
    group_label: "Responder Info"
    type: string
    sql: ${TABLE}."role_description_text" ;;
  }

  dimension: employee_count {
    label: "Number of Employees"
    description: "Survey question: How many employees does your organization have?"
    group_label: "Responder Info"
    type: string
    sql: ${TABLE}."employee_count" ;;
  }

  dimension: company_name {
    description: "Survey question: What company do you work for?"
    group_label: "Responder Info"
    type: string
    sql: ${TABLE}."company_name" ;;
  }

  dimension: thank_you_gift_email {
    group_label: "Responder Info"
    label: "Email Address"
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: survey_source {
    hidden: yes
    type: string
    sql: ${TABLE}.survey_source ;;
  }

  dimension: survey_iteration {
    description: "Which survey round the reponse was included in. Initial = first survey sent following purchase, 6 Month = survey sent 6 months after purchase, 12 Month = survey sent 12 months after purchase."
    type: string
    # sql: ${TABLE}.survey_iteration ;;
    # alpha_sort: yes
    case: {
      when: {
        sql: ${TABLE}.survey_iteration = '0mo' ;;
        label: "Initial"
      }
      when: {
        sql: ${TABLE}.survey_iteration = '6mo' ;;
        label: "6 Month"
      }
      when: {
        sql: ${TABLE}.survey_iteration = '12mo' ;;
        label: "12 Month"
      }
      # else: "Unknown"
    }
  }

  # dimension: test_response {
  #   description: "Flag indicates whether the response is an internal test of survey (Yes) or an actual submission (No)"
  #   group_label: "Filters"
  #   type: yesno
  #   sql: ${TABLE}.test_response ;;
  # }

  dimension: dupe_response {
    description: "Flag indicates if an additional response was submitted by the same email address for the same device and survey iteration"
    group_label: "Filters"
    type: yesno
    sql: ${TABLE}.dupe_response ;;
  }

  dimension: nps_bucket_int {
    label: "Net Promoter Category Integer"
    description: "This value is used to calculate NPS score. Promoter is assiged 1, Passive is assigned 0, and Detractor is assigned -1"
    group_label: "Net Promoter Category"
    type: number
    sql: case when ${recommend_score} in (9,10) then 1
              when ${recommend_score} in (7,8) then 0
              when ${recommend_score} in (0,1,2,3,4,5,6) then -1
              else null end;;
  }

  dimension: nps_bucket {
    label: "Net Promoter Category"
    description: "Promoter: score of 9 or 10, Passive: score or 7 or 8, Detractor: score of 0-6"
    group_label: "Net Promoter Category"
    type: string
    sql: case when ${recommend_score} in (9,10) then 'Promoter'
              when ${recommend_score} in (7,8) then 'Passive'
              when ${recommend_score} in (0,1,2,3,4,5,6) then 'Detractor'
              else null end;;
  }

## MEASURES

  measure: nps_score {
    label: "NPS Score"
    description: "Calculated by subtracting the count of Detractors from count of Promoters, dividing by the total number of responses, and multiplying by 100"
    type: number
    sql: ((sum(${nps_bucket_int}) * 1.0) / count(${recommend_score})) * 100 ;;
    value_format: "0"
  }

  measure: count_scores {
    label: "Count of Scores"
    description: "Total count of submitted recommendation scores"
    type: number
    sql: count(${recommend_score}) ;;
  }

  measure: count {
    label: "Count of Surveys"
    description: "Total count of survey Response IDs"
    type: count
    drill_fields: [device, company_name]
  }

  measure: total_duration_seconds {
    hidden: yes
    type: sum
    sql: ${duration_seconds} ;;
  }

  measure: average_duration_seconds {
    hidden: yes
    type: average
    sql: ${duration_seconds} ;;
  }
}
