# directs devices.view to barn channels to compare sw version
# rename devices_barn_channel_extend or something?

include: "/views/devices.view.lkml"
include: "/views/barn_channels.view.lkml"

view: devices_extend {
  extends: [devices]


  dimension: is_current_version {
    description: "Whether the device's Current Software Version is the most recent production release to that device's Barn Channel."
    type: yesno
    sql: ${software_version_number} = ${barn_channels.current_version} ;;
  }


}
