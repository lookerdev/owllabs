view: salesforce_nps {
  label: "Salesforce NPS Responses"
  sql_table_name: salesforce.survey_data_nps_v ;;
  drill_fields: [id, account_c, contact_c, nps_score_c, comments_c, if_you_could_wave_a_magic_wand_c, email_c, self_selected_products_c, survey_response_time_c_date, survey_completion_time_c_date]


  dimension: id {
    primary_key: yes
    label: "Response ID"
    description: "Salesforce ID for this reponse. Click the link to view the Reponse page in Salesforce"
    group_label: "Salesforce Metadata"
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
    description: "Salesforce ID for responder's company. Click the link to view the Account page in Salesforce"
    group_label: "Salesforce Metadata"
    sql: ${TABLE}.account_c ;;
    link: {
      label: "Salesforce Account"
      url: "https://owllabs.lightning.force.com/lightning/r/Account/{{ value }}/view"
      icon_url: "https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://salesforce.com&size=16"
    }
  }

  dimension: comments_c {
    label: "NPS Score Reason"
    description: "Why responder gave the score they did."
    group_label: "Survey Reponses"
    type: string
    sql: ${TABLE}.comments_c ;;
  }

  dimension: company_size_c {
    label: "Company Size"
    description: "Number of employees at company."
    group_label: "Responder Info"
    # suggestable: yes
    type: string
    sql: ${TABLE}.company_size_c ;;
  }

  dimension: contact_c {
    label: "Contact ID"
    description: "Salesforce ID for responder's information. Click the link to view the Contact page in Salesforce"
    group_label: "Salesforce Metadata"
    type: string
    sql: ${TABLE}.contact_c ;;
    link: {
      label: "Salesforce Contact"
      url: "https://owllabs.lightning.force.com/lightning/r/Contact/{{ value }}/view"
      icon_url: "https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://salesforce.com&size=16"
    }
  }

  dimension: email_c {
    label: "Email Address"
    group_label: "Responder Info"
    type: string
    sql: ${TABLE}.email_c ;;
  }

  dimension_group: first_registration_date_c {
    label: "First Device Registration"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.lq_first_registration_date_c ;;
  }

  dimension: industry {
    description: "Salesforce company type designation"
    group_label: "Responder Info"
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_group_c {
    label: "Industry Group"
    description: "Salesforce umbrella grouping of related industries"
    group_label: "Responder Info"
    type: string
    sql: ${TABLE}.industry_group_c ;;
  }

  dimension: if_you_could_wave_a_magic_wand_c {
    label: "Magic Wand"
    group_label: "Survey Reponses"
    type: string
    sql: ${TABLE}.if_you_could_wave_a_magic_wand_c ;;
  }

  dimension_group: last_registration_date_c {
    label: "Most Recent Device Registration"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.lq_last_registration_date_c ;;
  }

  dimension: last_queried_products_surveyed_c {
    hidden: yes
    label: "Last Queried Products Surveyed"
    description: "Products registered for this email address via most recent query"
    group_label: "Last Queried Products"
    type: string
    sql: ${TABLE}.last_queried_products_surveyed_c  ;;
  }

  dimension: last_queried_mop {
    hidden: yes
    group_label: "Last Queried Products"
    type: yesno
    sql: CASE WHEN ${TABLE}.last_queried_products_surveyed_c LIKE '%Meeting Owl Pro%' THEN TRUE ELSE FALSE END  ;;
  }

  dimension: last_queried_mo3 {
    hidden: yes
    group_label: "Last Queried Products"
    type: yesno
    sql: CASE WHEN ${TABLE}.last_queried_products_surveyed_c LIKE '%Meeting Owl 3%' THEN TRUE ELSE FALSE END  ;;
  }

  dimension: last_queried_owlbar {
    hidden: yes
    group_label: "Last Queried Products"
    type: yesno
    sql: CASE WHEN ${TABLE}.last_queried_products_surveyed_c LIKE '%Owl Bar%' THEN TRUE ELSE FALSE END  ;;
  }

  dimension: last_queried_wbo {
    hidden: yes
    group_label: "Last Queried Products"
    type: yesno
    sql: CASE WHEN ${TABLE}.last_queried_products_surveyed_c LIKE '%Whiteboard Owl%' THEN TRUE ELSE FALSE END  ;;
  }

  dimension: last_queried_mhq {
    hidden: yes
    group_label: "Last Queried Products"
    type: yesno
    sql: CASE WHEN ${TABLE}.last_queried_products_surveyed_c LIKE '%Meeting HQ%' THEN TRUE ELSE FALSE END  ;;
  }

  dimension: last_queried_mic {
    hidden: yes
    group_label: "Last Queried Products"
    type: yesno
    sql: CASE WHEN ${TABLE}.last_queried_products_surveyed_c LIKE '%Expansion Mic%' THEN TRUE ELSE FALSE END  ;;
  }


  dimension: lq_count_of_devices_c {
    label: "# Registered Devices"
    group_label: "Responder's Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_devices_c ;;
  }

  dimension: lq_count_of_mhq_registered_c {
    label: "# Registered MHQ"
    group_label: "Responder's Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_mhq_registered_c ;;
  }

  dimension: lq_count_of_mo3_registered_c {
    label: "# Registered MO3"
    group_label: "Responder's Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_mo3_registered_c ;;
  }

  dimension: lq_count_of_moo_registered_c {
    label: "# Registered MO"
    group_label: "Responder's Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_moo_registered_c ;;
  }

  dimension: lq_count_of_mop_registered_c {
    label: "# Registered MOP"
    group_label: "Responder's Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_mop_registered_c ;;
  }

  dimension: lq_count_of_obar_registered_c {
    label: "# Registered Owl Bar"
    group_label: "Responder's Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_obar_registered_c ;;
  }

  dimension: lq_count_of_wbo_registered_c {
    label: "# Registered WBO"
    group_label: "Responder's Registered Devices"
    type: number
    sql: ${TABLE}.lq_count_of_wbo_registered_c ;;
  }

  dimension: lq_expansion_mic_usage_c {
    label: "Expansion Mic Used"
    group_label: "Responder's Registered Devices"
    type: yesno
    sql: ${TABLE}.lq_expansion_mic_usage_c ;;
  }

  dimension: survey_data_number {
    label: "Salesforce Survey Data Number"
    description: "Number for this specific repsonse in Salesforce. Related to - but different from - Response ID"
    group_label: "Salesforce Metadata"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nps_score_c {
    label: "NPS Survey Score"
    group_label: "Survey Reponses"
    type: number
    sql: ${TABLE}.nps_score_c ;;
  }

  dimension: numberofemployees {
    label: "Number of Employees"
    group_label: "Responder Info"
    type: number
    sql: ${TABLE}.numberofemployees ;;
  }

  dimension: self_selected_products_c {
    label: "Self-Selected Products List"
    description: "List of all devices customer claims to own"
    group_label: "Self-Selected Products"
    type: string
    sql: ${TABLE}.self_selected_products_c ;;
  }

  dimension: self_selected_mop {
    label: "Self-Selected: Meeting Owl Pro"
    description: "Identifies if customer selected that they own a MOP"
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_mop ;;
  }

  dimension: self_selected_mo3 {
    label: "Self-Selected: Meeting Owl 3"
    description: "Identifies if customer selected that they own an MO3"
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_mo3 ;;
  }

  dimension: self_selected_owlbar {
    label: "Self-Selected: Owl Bar"
    description: "Identifies if customer selected that they own an Owl Bar"
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_owlbar ;;
  }

  dimension: self_selected_wbo {
    label: "Self-Selected: Whiteboard Owl"
    description: "Identifies if customer selected that they own a WBO"
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_wbo ;;
  }

  dimension: self_selected_mhq {
    label: "Self-Selected: Meeting HQ"
    description: "Identifies if customer selected that they own an MHQ"
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_mhq ;;
  }

  dimension: self_selected_mic {
    label: "Self-Selected: Extension Mic"
    description: "Identifies if customer selected that they own an Extension Mic"
    group_label: "Self-Selected Products"
    type: yesno
    sql: ${TABLE}.self_selected_mic ;;
  }

  dimension_group: survey_completion_time_c {
    # hidden: yes
    label: "Survey Complete"
    description: "Date survey was completed & submitted. This is blank for 1-click email respondents who don't click through the other survey questions and hit Complete"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.survey_completion_time_c ;;
  }

  dimension: survey_completion_date_null {
    label: "Does Survey Have a Completion Date?"
    type: yesno
    sql: CASE WHEN ${survey_completion_time_c_date} IS NULL THEN False ELSE True END ;;
  }

  dimension_group: survey_response_time_c {
    label: "Survey Start"
    description: "Date GetFeedback recorded an initial survey click & respondent began the response"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.survey_response_time_c ;;
  }

  dimension: survey_iteration {
    label: "Survey Iteration"
    description: "The tiemframe for which a survey was sent"
    group_label: "Salesforce Metadata"
    type: string
    sql: CASE WHEN ${TABLE}.survey_trigger_c = 'One-Off NPS' THEN 'Initial NPS'
              WHEN ${TABLE}.survey_trigger_c = 'Re-Triggered New Registration NPS' THEN 'Initial NPS'
              ELSE ${TABLE}.survey_trigger_c END ;; # combines all initally triggered one-off sends as part of "Inital"
  }

  dimension: survey_trigger_c {
    label: "Survey Trigger"
    description: "The reason a survey was sent."
    group_label: "Salesforce Metadata"
    type: string
    sql: ${TABLE}.survey_trigger_c ;;
  }

  dimension: survey_trigger_notes_c {
    label: "Survey Trigger Notes"
    description: "Details about the what triggered the survey send"
    group_label: "Salesforce Metadata"
    type: string
    sql: ${TABLE}.survey_trigger_notes_c ;;
  }

  dimension_group: time_survey_triggered_c {
    label: "Survey Send"
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
    group_label: "Salesforce Metadata"
    type: string
    sql: case when ${nps_score_c} in (9,10) then 'Promoter'
              when ${nps_score_c} in (7,8) then 'Passive'
              when ${nps_score_c} in (0,1,2,3,4,5,6) then 'Detractor'
              else null end;;
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

  # dimension: link_to_response_c {
  #   label: "Link to GetFeedback Response"
  #   type: string
  #   sql: ${TABLE}.link_to_response_c ;;
  # }

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

  # dimension: slack_channel_c {
  #   type: string
  #   sql: ${TABLE}.slack_channel_c ;;
  # }

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

  # dimension: survey_source_c {
  #   type: string
  #   sql: ${TABLE}.survey_source_c ;;
  # }



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
