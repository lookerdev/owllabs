# TODO: Extend Devices view
# TODO: Extend Meeting Records view

connection: "redshift"

include: "/views/barn/**.view"
include: "/views/dim_calendar.view"

explore: devices {
  description: "All usage records relevant to the devices we sell"
  view_name: "devices"
  label: "Devices"
  view_label: "Devices"
  # Currently it is necessary to join Barn Channels in this model
  # because the 'devices' view has a dimension 'is_current_version'
  # that requires channel info to calculate it.
  # It is also necessary to join Device_View because Meeting Records
  # has a cohort analysis that uses it.
  # But we omit both as users will not inspect either here.
  # 11/4/22 - with the extends applied for meeting_records and devices, it's no longer necessary to join barn_channels or devices_view tables to this explore
  # fields: [
  #   ALL_FIELDS*,
  #   -barn_channels*,
  #   -device_view*,
  # ]
  # join: barn_channels {
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${channel_id} = ${barn_channels.channel_id}   ;;
  # }
  # join: device_view {
  #   type: left_outer
  #   relationship: one_to_one
  #   sql_on: ${devices.deviceuuid} = ${device_view.uuid} ;;
  # }
  join: device_registrations {
    type: left_outer
    relationship: one_to_many
    sql_on: ${deviceuuid} = ${device_registrations.deviceuuid} ;;
  }
  join: device_checkins {
    type: left_outer
    relationship: one_to_many
    sql_on: ${deviceuuid} = ${device_checkins.deviceuuid} ;;
  }
  join: meeting_records {
    type: left_outer
    relationship: one_to_many
    sql_on: ${deviceuuid} = ${meeting_records.deviceuuid} ;;
  }
}

explore: timelines {
  description: "All device-centered data revolving around time"
  view_name: "dim_calendar"
  # There is a dimension group that is used for cohort analysis in
  # meeting records that requires device_view.
  # It is non-sensical to join device_view to dim_calendar since
  # devices are not temporal, so we exclude the offending fields.
  # with the addition of the meeting_records explore, the owl_connect_return_after_first_mtg fields are no longer included in meeting_records and don't need to be filtered out
  # fields: [
  #   ALL_FIELDS*,
  #   -meeting_records.seconds_owl_connect_return_after_first_mtg,
  #   -meeting_records.minutes_owl_connect_return_after_first_mtg,
  #   -meeting_records.hours_owl_connect_return_after_first_mtg,
  #   -meeting_records.days_owl_connect_return_after_first_mtg,
  #   -meeting_records.weeks_owl_connect_return_after_first_mtg,
  #   -meeting_records.months_owl_connect_return_after_first_mtg,
  #   -meeting_records.quarters_owl_connect_return_after_first_mtg,
  #   -meeting_records.years_owl_connect_return_after_first_mtg,
  # ]
  join: device_checkins {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${device_checkins.createdat_date};;
  }
  join: device_registrations {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${device_registrations.registration_date} ;;
  }
  join: meeting_records {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${dim_calendar.date_date} = ${meeting_records.startdate_date} ;;
  }
}
