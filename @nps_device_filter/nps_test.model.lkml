connection: "redshift"

include: "/@nps_device_filter/*.view.lkml"



explore: survey_data_nps_derived {
  hidden: yes
}
