view: survey_data_nps {
  label: "NPS - Salesforce"
  sql_table_name: salesforce.survey_data_nps ;;
  drill_fields: [id]


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_c {
    type: string
    sql: ${TABLE}.account_c ;;
  }

  dimension: browser_c {
    type: string
    sql: ${TABLE}.browser_c ;;
  }

  dimension: case_c {
    type: string
    sql: ${TABLE}.case_c ;;
  }

  dimension: case_origin_c {
    type: string
    sql: ${TABLE}.case_origin_c ;;
  }

  dimension: ces_comment_sentiment_c {
    type: string
    sql: ${TABLE}.ces_comment_sentiment_c ;;
  }

  dimension: comments_c {
    type: string
    sql: ${TABLE}.comments_c ;;
  }

  dimension: contact_c {
    type: string
    sql: ${TABLE}.contact_c ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
  }

  dimension_group: createddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createddate ;;
  }

  dimension: currencyisocode {
    type: string
    sql: ${TABLE}.currencyisocode ;;
  }

  dimension: customer_effort_comments_c {
    type: string
    sql: ${TABLE}.customer_effort_comments_c ;;
  }

  dimension: customer_effort_response_c {
    type: string
    sql: ${TABLE}.customer_effort_response_c ;;
  }

  dimension: customer_effort_score_c {
    type: string
    sql: ${TABLE}.customer_effort_score_c ;;
  }

  dimension: email_c {
    type: string
    sql: ${TABLE}.email_c ;;
  }

  dimension: feature_inquiry_primary_c {
    type: string
    sql: ${TABLE}.feature_inquiry_primary_c ;;
  }

  dimension: feature_inquiry_secondary_c {
    type: string
    sql: ${TABLE}.feature_inquiry_secondary_c ;;
  }

  dimension: feature_request_upvote_c {
    type: yesno
    sql: ${TABLE}.feature_request_upvote_c ;;
  }

  dimension: feature_requests_c {
    type: string
    sql: ${TABLE}.feature_requests_c ;;
  }

  dimension: feedback_rating_c {
    type: string
    sql: ${TABLE}.feedback_rating_c ;;
  }

  dimension_group: first_registration_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_registration_date_c ;;
  }

  dimension: if_you_could_wave_a_magic_wand_c {
    type: string
    sql: ${TABLE}.if_you_could_wave_a_magic_wand_c ;;
  }

  dimension: internal_response_c {
    type: yesno
    sql: ${TABLE}.internal_response_c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: jira_key_c {
    type: string
    sql: ${TABLE}.jira_key_c ;;
  }

  dimension: knowledge_article_c {
    type: string
    sql: ${TABLE}.knowledge_article_c ;;
  }

  dimension: knowledge_public_url_c {
    type: string
    sql: ${TABLE}.knowledge_public_url_c ;;
  }

  dimension: language_c {
    type: string
    sql: ${TABLE}.language_c ;;
  }

  dimension: language_code_c {
    type: string
    sql: ${TABLE}.language_code_c ;;
  }

  dimension_group: last_registration_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_registration_date_c ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: lastmodifieddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension_group: lastreferenceddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.lastreferenceddate ;;
  }

  dimension_group: lastvieweddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension: link_to_response_c {
    type: string
    sql: ${TABLE}.link_to_response_c ;;
  }

  dimension: lq_count_of_devices_c {
    type: number
    sql: ${TABLE}.lq_count_of_devices_c ;;
  }

  dimension: lq_count_of_mhq_registered_c {
    type: number
    sql: ${TABLE}.lq_count_of_mhq_registered_c ;;
  }

  dimension: lq_count_of_mo3_registered_c {
    type: number
    sql: ${TABLE}.lq_count_of_mo3_registered_c ;;
  }

  dimension: lq_count_of_moo_registered_c {
    type: number
    sql: ${TABLE}.lq_count_of_moo_registered_c ;;
  }

  dimension: lq_count_of_mop_registered_c {
    type: number
    sql: ${TABLE}.lq_count_of_mop_registered_c ;;
  }

  dimension: lq_count_of_obar_registered_c {
    type: number
    sql: ${TABLE}.lq_count_of_obar_registered_c ;;
  }

  dimension: lq_count_of_wbo_registered_c {
    type: number
    sql: ${TABLE}.lq_count_of_wbo_registered_c ;;
  }

  dimension: lq_expansion_mic_usage_c {
    type: yesno
    sql: ${TABLE}.lq_expansion_mic_usage_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nps_score_c {
    type: number
    sql: ${TABLE}.nps_score_c ;;
  }

  dimension: observation_type_c {
    type: string
    sql: ${TABLE}.observation_type_c ;;
  }

  dimension: owl_labs_app_c {
    type: string
    sql: ${TABLE}.owl_labs_app_c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: platform_c {
    type: string
    sql: ${TABLE}.platform_c ;;
  }

  dimension: recordtypeid {
    type: string
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: self_selected_products_c {
    type: string
    sql: ${TABLE}.self_selected_products_c ;;
  }

  dimension: slack_channel_c {
    type: string
    sql: ${TABLE}.slack_channel_c ;;
  }

  dimension_group: survey_completion_time_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.survey_completion_time_c ;;
  }

  dimension: survey_name_c {
    type: string
    sql: ${TABLE}.survey_name_c ;;
  }

  dimension_group: survey_response_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.survey_response_date_c ;;
  }

  dimension_group: survey_response_time_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.survey_response_time_c ;;
  }

  dimension: survey_source_c {
    type: string
    sql: ${TABLE}.survey_source_c ;;
  }

  dimension: survey_trigger_c {
    type: string
    sql: ${TABLE}.survey_trigger_c ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension_group: time_survey_triggered_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.time_survey_triggered_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
