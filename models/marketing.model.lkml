connection: "redshift"

include: "/views/dim_calendar.view.lkml"
include: "/views/google_analytics_traffic_conversion.view.lkml"



  explore: traffic_conversion {
    persist_for: "6 hours"
    description: "Google Analytics website traffic conversion to hardware orders (MO, MOP, MO3, HQ, WBO, OB)"
    view_name: dim_calendar
    sql_always_where: ${year} >= 2016 and ${date_date} <= trunc(sysdate)
      ;;
    join: google_analytics_traffic_conversion {
      type: left_outer
      relationship: one_to_one
      sql_on: ${dim_calendar.id} = ${google_analytics_traffic_conversion.id} ;;
    }
}

# include: "/views/ganalytics_conversion.view.lkml"


# explore: ga4_conversion {
#   persist_for: "6 hours"
#   # fields: [ganalytics_conversion]
#   # fields: [ALL_FIELDS*, -device_registrations.channel_id, -device_registrations.device_hardware_serial_number, -device_registrations.device_id, -device_registrations.product_id, -device_registrations.product_name, -most_recent_update_attempt.deviceuuid, -barn_channels.product_name, -barn_channels.productid]
#   description: "Google Analytics website traffic conversion to hardware orders (MO, MOP, MO3, HQ, WBO, OB)"
#   view_name: dim_calendar
#   sql_always_where: ${year} >= 2016 and ${date_date} <= trunc(sysdate)
#     ;;
#   join: ganalytics_conversion {
#     type: left_outer
#     relationship: one_to_one
#     sql_on: ${dim_calendar.id} = ${ganalytics_conversion.id} ;;
#   }
# }
