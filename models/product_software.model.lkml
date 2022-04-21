connection: "redshift"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/views/rhapsody_sw_version_download_tracking.view.lkml"
include: "/views/devices_per_channel_release.view.lkml"


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: rhapsody_sw_version_download_tracking {
  label: "Rhapsody Software Download Tracking"
  }

explore: devices_per_channel_release {
  label: "Devices per Channel Release"
  always_filter: {
    filters: [devices_per_channel_release.software_version_select: ""]
    }
}
