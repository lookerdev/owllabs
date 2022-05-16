connection: "redshift"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/views/rhapsody_sw_version_download_tracking.view.lkml"
include: "/views/devices_per_channel_release.view.lkml"
include: "/views/device_updates_downloads.view.lkml"
include: "/views/devices.view.lkml"
include: "/views/barn_channels.view.lkml"
include: "/views/channel_releases.view.lkml"
include: "/views/device_registrations.view.lkml"




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
  label: "Device Update Attempts"
  # description: ""
  # hidden: yes
  view_name: device_updates_downloads
  # fields: [device_updates_downloads*, devices.device_hardware_serial_number, devices.product_name, devices.barn_channel_category, devices.channel_name]
  fields: [device_updates_downloads*, devices.hardware_serial, devices.product_name, barn_channels.channel_category, barn_channels.slug] # this line goes with addition of barn_channels view
  join: devices {
    type: left_outer
    relationship: many_to_one
    sql_on: ${device_updates_downloads.deviceuuid} = ${devices.deviceuuid} ;;
  }
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
  }
}

explore: releases_per_channel {
  # hidden: yes
  label: "Releases per Barn Channel"
  fields: [barn_channels*, channel_releases*, devices.device_count, device_registrations.count_registered_devices]
  view_name: barn_channels
  join: channel_releases {
    type: left_outer
    relationship: many_to_one
    sql_on: ${barn_channels.channel_id} = ${channel_releases.channel_id} ;;
  }
  join: devices {
    type: left_outer
    relationship: one_to_many
    sql_on: ${channel_releases.channel_id} = ${devices.channel_id}
            and ${channel_releases.release_version} = ${devices.software_version_number} ;;
  }
  join: device_registrations {
    type:  left_outer
    relationship: one_to_one
    sql_on: ${devices.deviceuuid} = ${device_registrations.deviceuuid} ;;
  }
}
