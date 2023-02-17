# Creating and using this extend for the Devices explore which includes the join tables (barn_channels) and maps layers
# doesn't cause the Meeting Records explore to error since the same reference tables aren't included there

include: "/views/barn/devices.view.lkml" # extending this view
include: "/views/barn/barn_channels.view.lkml" # joining to this view

view: devices_extend_barn_channels {
  extends: [devices]

# joins devices.view to barn_channels.view
  dimension: is_current_version {
    description: "Whether the device's Current Software Version is the most recent production release to that device's Barn Channel."
    type: yesno
    sql: ${software_version_number} = ${barn_channels.current_version} ;;
  }


# includes references to map layer
  dimension: lastgeo_country_shortname {
    hidden: yes
    group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_country_shortname ;;
    # map_layer_name: europe_countries_layer
  }

  dimension: lastgeo_country_iso3 {
    hidden: yes
    group_label: "Last Geo"
    type: string
    sql: ${TABLE}.lastgeo_country_iso3 ;;
    # map_layer_name: world_countries_layer
    # map_layer_name: europe_countries_layer
  }


}
