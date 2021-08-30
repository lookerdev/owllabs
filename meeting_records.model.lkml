connection: "redshift"

include: "/views/meeting_records.view.lkml"
include: "/views/device_view.view.lkml"
include: "/views/device_checkins.view.lkml"
include: "/views/userdeviceregistrations.view.lkml"

# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
 explore: meeting_records {
  always_filter: {
    filters: [device_view.product_name: "-TESTNAME"] #why isn't this filtering properly??
  }

   join: device_view {
    # view_label: "Devices"
      type: left_outer
      relationship: many_to_one
      sql_on: ${device_view.uuid} = ${meeting_records.deviceuuid} ;;
     # sql_where: ${device_view.product_name} != 'TESTNAME' ;;
  }


   join: device_checkins {
      type: left_outer
      relationship: one_to_many
      sql_on: ${device_checkins.deviceuuid} = ${meeting_records.deviceuuid} ;;

  }

    join: userdeviceregistrations {
      type: left_outer
      relationship: one_to_one
      sql_on: ${meeting_records.deviceuuid} = ${userdeviceregistrations.deviceuuid}  ;;
  }

}
