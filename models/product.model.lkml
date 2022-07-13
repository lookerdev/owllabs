connection: "redshift"

include: "/views/nps_surveys.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: nps_surveys {
  label: "NPS"
  description: "NPS survey responses from historical Google form & all Qualtrics surveys. By default filters out test responses and selects the initial survey iteration."
  always_filter: {
    filters: [nps_surveys.test_response: "No", nps_surveys.survey_iteration: "Initial"] # filter defaults to remove test responses
  }
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
  }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
