connection: "redshift"

include: "/views/barn/*.view.lkml"
include: "/views/salesforce_accounts.view.lkml"
include: "/views/shopify_orders_serial_numbers.view.lkml"





explore: devices {
  # from: devices_extend # https://cloud.google.com/looker/docs/reference/param-explore-from?version=22.16&lookml=new
  from: devices_extend
  description: "Data for all devices in the Barn Devices table or that have been recorded in Shopify orders. Does not include Desktop App records."
  fields: [ALL_FIELDS*, -device_registrations.channel_id, -device_registrations.device_hardware_serial_number, -device_registrations.device_id, -device_registrations.product_id, -device_registrations.product_name, -most_recent_update_attempt.deviceuuid, -barn_channels.product_name, -barn_channels.productid]
  join: device_registrations {
    type: left_outer
    relationship: one_to_many
    sql_on: ${devices.deviceuuid} = ${device_registrations.deviceuuid} ;;
  }
  join: salesforce_accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: lower(${device_registrations.sf_accounts_join_key}) = lower(${salesforce_accounts.device_registrations_join_key});;
  }

  join: shopify_orders_serial_numbers {
    type: left_outer
    relationship: one_to_one
    sql_on: lower(${devices.hardware_serial}) = lower(${shopify_orders_serial_numbers.serial_validated}) ;;
  }
  join: most_recent_update_attempt {
    type: left_outer
    relationship: one_to_one
    sql_on: ${most_recent_update_attempt.deviceuuid} = ${devices.deviceuuid} ;;
  }
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
  }
  join: device_meetingdates_v {
    type: left_outer
    relationship: one_to_one
    sql_on: ${devices.deviceuuid} = ${device_meetingdates_v.deviceuuid} ;;
  }
  join: devices_owl_connnect_usage {
    type: left_outer
    relationship: one_to_one
    sql_on: ${devices_owl_connnect_usage.device_id} = ${devices.device_id} ;;
  }
}

map_layer: europe_countries_layer {
  file: "/maps/europe_countries.json"
  max_zoom_level: 12
  min_zoom_level: 2
  property_key: "NAME"
}

map_layer: mena_layer {
  file: "/maps/mena.geojson"
  max_zoom_level: 12
  min_zoom_level: 2
  property_key: "code_a3"
}

map_layer: worldmap_layer {
  file: "/maps/world_countries.geojson"
  max_zoom_level: 12
  min_zoom_level: 2
  property_key: "ISO_A3"
}



explore: device_checkins {
  persist_for: "10 hours"
  label: "Device Check-ins"
  description: "Device check-in data captured via the Barn. This table has a huge amount of rows and will take some time to load."
  join: devices {
    type: left_outer
    relationship: many_to_one
    sql_on: ${device_checkins.deviceuuid} = ${devices.deviceuuid} ;;
  }
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${barn_channels.channel_id} = ${devices.channel_id} ;;
  }
}


explore: barn_channels {
  persist_for: "6 hours"
  label: "Barn Channels"
  description: "Details for all Barn Channels whether there are devices included in the channel or not. Includes data for the devices in each channel."
  fields: [barn_channels*, devices*,  device_registrations.count_registered_devices]
  join: devices {
    type: left_outer
    relationship: one_to_many
    sql_on: ${devices.channel_id} = ${barn_channels.channel_id}  ;;
  }
  join: device_registrations {
    type: left_outer
    relationship: one_to_many
    sql_on: ${devices.deviceuuid} = ${device_registrations.deviceuuid} ;;
  }
}

## Added 10-17-24 based on request from Babs/Courtney B. Need to review relationships and old comments from Aryn with Matt

explore: blackboxes {
  label: "Blackboxes"
  hidden: no
  # label: "Blackboxes - Under Construction - NOW OLD 10-31-24"
  description: "Blackbox snapshot from devices' most recent check-ins"
  join: devices {
    type: left_outer
   # Aryn originally left this as many_to_one since there were 68 deviceuuids with more than one record, but Weihai confirmed it should be one_to_one 10-18-24
    relationship: one_to_one
    sql_on: ${blackboxes.deviceuuid} = ${devices.deviceuuid} ;;
  }
  join: barn_channels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${devices.channel_id} = ${barn_channels.channel_id} ;;
  }

  join: device_registrations {
    type: left_outer
    relationship: one_to_one # Aryn originally left this as many_to_one due to funky registration dupes, Weihai confirmed one_to_one shoudl be correct 10-18-24
    sql_on: ${meeting_records.deviceuuid} = ${device_registrations.deviceuuid} ;;
  }

  join: meeting_records {
    type: left_outer
    relationship: many_to_one
    sql_on: ${meeting_records.deviceuuid} = ${devices.deviceuuid} ;;
  }
}
