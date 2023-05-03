connection: "redshift"

include: "/views/dim_calendar.view.lkml"
include: "/views/google_analytics_traffic_conversion.view.lkml"

# ga4
include: "//ga_four_block/views/*.view"

# You can use wildcards to include multiple files. For example, to include all view files in the /views/ directory of the e_flights imported project:
# include: "//e_flights/views/*.view"

# Furthermore, you can use wildcards to scope to specific directory levels or to recursive directories in imported project:
# include: "//e_flights/*/*.view.lkml"
# include: "//e_commerce/*/*.view.lkml"



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
