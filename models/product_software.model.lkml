connection: "redshift"

include: "/views/barn/*.view.lkml"


explore: rhapsody_sw_version_download_tracking {
  label: "Rhapsody Software Download Tracking"
  # description: ""
  }

explore: devices_per_channel_release {
  label: "Devices per Channel Release"
  description: "Can be used to evaluate devices running an unauthorized software release."
  fields: [devices_per_channel_release*]
  always_filter: {
    filters: [devices_per_channel_release.software_version_select: ""]
    }
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${barn_channels.channel_id} = ${devices_per_channel_release.channel_id} ;;
  }
}

explore: device_update_attempts {
  label: "Device Update Attempts"
  # description: ""
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
