connection: "redshift"

include: "/views/meeting_records.view.lkml"
include: "/views/device_view.view.lkml"
include: "/views/device_registrations.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


 explore: meeting_records {
  sql_always_where: ${device_view.product_name} <> 'TESTNAME' ;; # Removes TESTNAME product name rows
  always_filter: {
    filters: [device_registrations.registration_record_delete_date: "NULL"]
  }
   join: device_view {
    # view_label: "Devices"
      type: left_outer
      relationship: many_to_one
      sql_on: ${device_view.uuid} = ${meeting_records.deviceuuid} ;;
     # sql_where: ${device_view.product_name} != 'TESTNAME' ;;
   }
    join:  device_registrations {
      type: left_outer
      relationship: many_to_one
      sql_on: ${device_view.uuid} = ${device_registrations.deviceuuid} ;;
    }
    join: salesforce_accounts {
      # type: left_outer
      relationship: many_to_one
      sql_on: ${device_registrations.company_domain} = ${salesforce_accounts.email_domain} ;;
    }
}
