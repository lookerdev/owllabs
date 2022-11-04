connection: "redshift"

include: "/views/dim_calendar.view.lkml"
include: "/views/google_analytics_traffic_conversion.view.lkml"



  explore: traffic_conversion {
    persist_for: "6 hours"
    description: "Google Analytics website traffic conversion to hardware orders (MO, MOP, MO3, HQ, WBO)"
    view_name: dim_calendar
    sql_always_where: ${year} >= 2016 and ${date_date} <= trunc(sysdate)
      ;;
    join: google_analytics_traffic_conversion {
      type: left_outer
      relationship: one_to_one
      sql_on: ${dim_calendar.id} = ${google_analytics_traffic_conversion.id} ;;
    }
}
