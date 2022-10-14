# directs meeting_records.view to devices.view for owl_connect_return_after_first_mtg cohort analysis field

include: "/views/barn/devices.view.lkml"
include: "/views/barn/meeting_records.view.lkml"

view: extend-devices_include_barn_channels {
  extends: [meeting_records]


# Cohort analysis
  dimension_group: owl_connect_return_after_first_mtg {
    hidden: yes
    type: duration
    sql_start: ${devices.first_owl_connect_mtg_5_mins_date} ;;
    sql_end: ${startdate_date} ;;
    # intervals: [day, month]
  }

}
