connection: "redshift"

include: "/views/meeting_records.view.lkml"
include: "/views/device_view.view.lkml"
include: "/views/device_checkins.view.lkml"
# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
 explore: meeting_records {
   join: device_view {
     relationship: many_to_one
     sql_on: ${device_view.uuid} = ${meeting_records.deviceuuid} ;;
  }

   join: device_checkins {
     relationship: many_to_one
     sql_on: ${device_checkins.deviceuuid}id} = ${meeting_records.deviceuuid} ;;
  }
}
