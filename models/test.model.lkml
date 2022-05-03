connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/views/device_extend_test.view.lkml"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: device_extend_test {
  hidden: yes
}
