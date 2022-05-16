connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/views/google_analytics_traffic_conversion.view.lkml"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#



  explore: traffic_conversion {
    persist_for: "6 hours"
    # label: "Traffic Conversion"
  # description: ""
    view_name: dim_calendar
    sql_always_where: ${year} >= 2016 and ${date_date} <= trunc(sysdate)
      ;;
    join: google_analytics_traffic_conversion {
      type: left_outer
      relationship: one_to_one
      sql_on: ${dim_calendar.id} = ${google_analytics_traffic_conversion.id} ;;
    }
}
