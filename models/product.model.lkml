connection: "redshift"

include: "/views/nps_surveys.view.lkml"




explore: nps_surveys {
  label: "NPS"
  description: "NPS survey responses from historical Google form & all Qualtrics surveys. By default filters out test responses and duplicate responses and selects the initial survey iteration."
  always_filter: {
    filters: [nps_surveys.test_response: "No", nps_surveys.survey_iteration: "Initial", nps_surveys.dupe_response: "No"] # filter defaults to remove test responses
  }
}
