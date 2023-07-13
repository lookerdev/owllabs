view: survey_data_nps {
  label: "NPS - Salesforce"
  sql_table_name: salesforce.survey_data_nps ;;
  drill_fields: [id, nps_score_c]


  dimension: id {
    primary_key: yes
    label: "Response ID"
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "Salesforce Response"
      url: "https://owllabs.lightning.force.com/lightning/r/Survey_Data__c/{{ value }}/view"
      icon_url: "https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://salesforce.com&size=16"
    }
  }

  dimension: account_c {
    label: "Account ID"
    type: string
    sql: ${TABLE}.account_c ;;
  }

  # dimension: browser_c {
  #   type: string
  #   sql: ${TABLE}.browser_c ;;
  # }

  # dimension: case_c {
  #   type: string
  #   sql: ${TABLE}.case_c ;;
  # }

  # dimension: case_origin_c {
  #   type: string
  #   sql: ${TABLE}.case_origin_c ;;
  # }

  # dimension: ces_comment_sentiment_c {
  #   type: string
  #   sql: ${TABLE}.ces_comment_sentiment_c ;;
  # }

  dimension: comments_c {
    label: "NPS Score Reason"
    # description: "Response to survey question 3 or 4, depending on  'It looks like we could do better. Why did you give that score?'4) 'Why did you give us that score?'"
    type: string
    sql: ${TABLE}.comments_c ;;
  }

  dimension: contact_c {
    label: "Contact ID"
    type: string
    sql: ${TABLE}.contact_c ;;
  }

  dimension: email_c {
    label: "Email Address"
    type: string
    sql: ${TABLE}.email_c ;;
  }

  dimension_group: first_registration_date_c {
    label: "First Registration"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.first_registration_date_c ;;
  }

  dimension: if_you_could_wave_a_magic_wand_c {
    label: "Magic Wand"
    type: string
    sql: ${TABLE}.if_you_could_wave_a_magic_wand_c ;;
  }

  # dimension: internal_response_c {
  #   label: "test response"
  #   type: yesno
  #   sql: ${TABLE}.internal_response_c ;;
  # }

  # dimension: isdeleted {
  #   type: yesno
  #   sql: ${TABLE}.isdeleted ;;
  # }

  # dimension: jira_key_c {
  #   type: string
  #   sql: ${TABLE}.jira_key_c ;;
  # }

  # dimension: knowledge_article_c {
  #   type: string
  #   sql: ${TABLE}.knowledge_article_c ;;
  # }

  # dimension: knowledge_public_url_c {
  #   type: string
  #   sql: ${TABLE}.knowledge_public_url_c ;;
  # }

  # dimension: language_c {
  #   type: string
  #   sql: ${TABLE}.language_c ;;
  # }

  # dimension: language_code_c {
  #   type: string
  #   sql: ${TABLE}.language_code_c ;;
  # }

  dimension_group: last_registration_date_c {
    label: "Most Recent Registration"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.last_registration_date_c ;;
  }

  # dimension: link_to_response_c {
  #   label: "Link to GetFeedback Response"
  #   type: string
  #   sql: ${TABLE}.link_to_response_c ;;
  # }

  dimension: lq_count_of_devices_c {
    label: "# Total Devices"
    group_label: "Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_devices_c ;;
  }

  dimension: lq_count_of_mhq_registered_c {
    label: "# Registered MHQ"
    group_label: "Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_mhq_registered_c ;;
  }

  dimension: lq_count_of_mo3_registered_c {
    label: "# Registered MO3"
    group_label: "Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_mo3_registered_c ;;
  }

  dimension: lq_count_of_moo_registered_c {
    label: "# Registered MO"
    group_label: "Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_moo_registered_c ;;
  }

  dimension: lq_count_of_mop_registered_c {
    label: "# Registered MOP"
    group_label: "Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_mop_registered_c ;;
  }

  dimension: lq_count_of_obar_registered_c {
    label: "# Registered Owl Bar"
    group_label: "Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_obar_registered_c ;;
  }

  dimension: lq_count_of_wbo_registered_c {
    label: "# Registered WBO"
    group_label: "Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_wbo_registered_c ;;
  }

  dimension: lq_expansion_mic_usage_c {
    label: "Expansion Mic Used"
    group_label: "Registered Devices"
    type: yesno
    sql: ${TABLE}.lq_expansion_mic_usage_c ;;
  }

  # dimension: name {
  #   type: string
  #   sql: ${TABLE}.name ;;
  # }

  dimension: nps_score_c {
    label: "NPS Score"
    type: number
    sql: ${TABLE}.nps_score_c ;;
  }

  # dimension: observation_type_c {
  #   type: string
  #   sql: ${TABLE}.observation_type_c ;;
  # }

  # dimension: owl_labs_app_c {
  #   type: string
  #   sql: ${TABLE}.owl_labs_app_c ;;
  # }

  # dimension: ownerid {
  #   type: string
  #   sql: ${TABLE}.ownerid ;;
  # }

  # dimension: platform_c {
  #   type: string
  #   sql: ${TABLE}.platform_c ;;
  # }

  # dimension: recordtypeid {
  #   type: string
  #   sql: ${TABLE}.recordtypeid ;;
  # }

  dimension: self_selected_products_c {
    label: "Self-Selected Products List"
    description: "List of all devices customer claims to own."
    group_label: "Self-Selected Products"
    type: string
    sql: ${TABLE}.self_selected_products_c ;;
  }

  dimension: self_selected_mop {
    label: "Self-Selected: Meeting Owl Pro"
    description: "Identifies if customer selected that they own a MOP."
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_mop ;;
  }

  dimension: self_selected_mo3 {
    label: "Self-Selected: Meeting Owl 3"
    description: "Identifies if customer selected that they own an MO3."
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_mo3 ;;
  }

  dimension: self_selected_owlbar {
    label: "Self-Selected: Owl Bar"
    description: "Identifies if customer selected that they own an Owl Bar."
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_owlbar ;;
  }

  dimension: self_selected_wbo {
    label: "Self-Selected: Whiteboard Owl"
    description: "Identifies if customer selected that they own a WBO."
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_wbo ;;
  }

  dimension: self_selected_mhq {
    label: "Self-Selected: Meeting HQ"
    description: "Identifies if customer selected that they own an MHQ."
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_mhq ;;
  }

  dimension: self_selected_mic {
    label: "Self-Selected: Extension Mic"
    description: "Identifies if customer selected that they own an Extension Mic."
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_mic ;;
  }

  # dimension: slack_channel_c {
  #   type: string
  #   sql: ${TABLE}.slack_channel_c ;;
  # }

  dimension_group: survey_completion_time_c {
    # hidden: yes
    label: "Survey Completed"
    description: "Date survey was completed & submitted. This is blank for 1-click email respondents who don't click through the other survey questions and hit Complete."
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.survey_completion_time_c ;;
  }

  # dimension: survey_name_c {
  #   type: string
  #   sql: ${TABLE}.survey_name_c ;;
  # }

  # dimension_group: survey_response_date_c { # same as survey_response_date_c but excludes timestamp
  #   hidden: yes
  #   type: time
  #   timeframes: [raw, date, week, month, quarter, year]
  #   sql: ${TABLE}.survey_response_date_c ;;
  # }

  dimension_group: survey_response_time_c {
    label: "Survey Start"
    description: "Date GetFeedback recorded an initial survey click & respondent began the response."
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.survey_response_time_c ;;
  }

  # dimension: survey_source_c {
  #   type: string
  #   sql: ${TABLE}.survey_source_c ;;
  # }

  dimension: survey_trigger_c {
    label: "Survey Iteration"
    type: string
    sql: ${TABLE}.survey_trigger_c ;;
  }

  dimension_group: time_survey_triggered_c {
    label: "Survey Sent"
    description: "Date survey sent via GetFeedback"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.time_survey_triggered_c ;;
  }



  dimension: nps_bucket_int {
    hidden: yes
    label: "Net Promoter Category Integer"
    description: "This value is used to calculate NPS score. Promoter is assiged 1, Passive is assigned 0, and Detractor is assigned -1"
    # group_label: "Net Promoter Category"
    type: number
    sql: case when ${nps_score_c} in (9,10) then 1
              when ${nps_score_c} in (7,8) then 0
              when ${nps_score_c} in (0,1,2,3,4,5,6) then -1
              else null end;;
  }

  dimension: nps_bucket {
    label: "Net Promoter Category"
    description: "Promoter: score of 9 or 10, Passive: score or 7 or 8, Detractor: score of 0-6"
    # group_label: "Net Promoter Category"
    type: string
    sql: case when ${nps_score_c} in (9,10) then 'Promoter'
              when ${nps_score_c} in (7,8) then 'Passive'
              when ${nps_score_c} in (0,1,2,3,4,5,6) then 'Detractor'
              else null end;;
  }

## MEASURES

  measure: nps_score {
    label: "NPS Score"
    description: "Calculated by subtracting the count of Detractors from count of Promoters, dividing by the total number of responses, and multiplying by 100"
    type: number
    sql: ((sum(${nps_bucket_int}) * 1.0) / count(${nps_score_c})) * 100 ;;
    value_format: "0"
  }

  measure: count {
    label: "Count of Surveys"
    description: "Total count of survey Response IDs"
    type: count
    # drill_fields: [device, company_name]
    }
}
