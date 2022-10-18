# joins devices.view to barn_channels.view

include: "/extend_test/devices_base.view.lkml" # extending this view
include: "/views/barn/barn_channels.view.lkml" # joining to this view

view: devices_extend_barn_channels {
  label: "Devices"
  extends: [devices_base]


  dimension: is_current_version {
    description: "Whether the device's Current Software Version is the most recent production release to that device's Barn Channel."
    type: yesno
    sql: ${software_version_number} = ${barn_channels.current_version} ;;
  }
}
