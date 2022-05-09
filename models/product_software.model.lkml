connection: "redshift"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/views/rhapsody_sw_version_download_tracking.view.lkml"
include: "/views/devices_per_channel_release.view.lkml"
include: "/views/device_updates_downloads.view.lkml"
include: "/views/devices.view.lkml"


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: rhapsody_sw_version_download_tracking {
  label: "Rhapsody Software Download Tracking"
  # description: ""
  }

explore: devices_per_channel_release {
  label: "Devices per Channel Release"
  # description: ""
  always_filter: {
    filters: [devices_per_channel_release.software_version_select: ""]
    }
}

explore: device_update_attempts {
  label: "Device Update Attempts - UAT"
  # description: ""
  # hidden: yes
  view_name: device_updates_downloads
  fields: [device_updates_downloads*, devices.device_hardware_serial_number, devices.barn_channel_category, devices.channel_name, devices.product_name]
  join: devices {
    type: left_outer
    relationship: many_to_one
    sql_on: ${device_updates_downloads.deviceuuid} = ${devices.uuid} ;;
  }
}
