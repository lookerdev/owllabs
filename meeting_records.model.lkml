connection: "redshift"
label: "Barn Data"

include: "/views/meeting_records.view.lkml"
include: "/views/device_view.view.lkml"
include: "/views/device_registrations.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/device_checkins.view.lkml"
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
      sql_on: ${meeting_records.deviceuuid} = ${device_view.uuid} ;;
  }
    join:  device_registrations {
      type: left_outer
      relationship: many_to_many # this will change once I remove the funky registration dupes
      sql_on: ${meeting_records.deviceuuid} = ${device_registrations.deviceuuid} ;;
    }
    join: salesforce_accounts {
      type: left_outer
      relationship: many_to_one
      sql_on: lower(${device_registrations.company_domain}) = lower(${salesforce_accounts.email_domain})
              and lower(${device_registrations.company_name}) = lower(${salesforce_accounts.company_name});;
    }
}

 explore: device_checkins {
  label: "Device Check-Ins"
}

# explore: device_registrations {
# }

 explore: device_view {
  label: "Devices"
  sql_always_where: ${device_view.product_name} <> 'TESTNAME' ;; # Removes TESTNAME product name rows
  always_filter: {
    filters: [device_registrations.registration_record_delete_date: "NULL"]
  }
    join: device_registrations {
      type: left_outer
      relationship: one_to_many
      sql_on: ${device_view.uuid} = ${device_registrations.deviceuuid} ;;
    }
  }
