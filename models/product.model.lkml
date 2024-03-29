connection: "redshift"
include: "/views/nps/*.view.lkml"



explore: nps_surveys {
  label: "Product NPS (Qualtrics)"
  description: "NPS survey responses from historical Google form & all Qualtrics surveys. By default filters out duplicate responses and filters for the Initial survey iteration."
  always_filter: {
    filters: [nps_surveys.survey_iteration: "Initial"] # filter defaults to remove test responses
  }
}

explore: salesforce_nps {
  label: "Salesforce NPS"
  description: "NPS survey responses from GetFeedback. This data does not separate scores by device type and by default filters for the Inital NPS survey iteration."
}
