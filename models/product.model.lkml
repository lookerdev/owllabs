connection: "redshift"


include: "/views/nps/*.view.lkml"



explore: nps_surveys {
  label: "NPS"
  description: "NPS survey responses from historical Google form & all Qualtrics surveys. By default filters out test responses and duplicate responses and selects the initial survey iteration."
  always_filter: {
    filters: [nps_surveys.survey_iteration: "Initial"] # filter defaults to remove test responses
  }
}

# explore: survey_data_nps {
#   label: "NPS - Salesforce"
# }
