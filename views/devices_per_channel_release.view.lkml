view: devices_per_channel_release {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: select
          a.channel_id, --filter: Channel ID
          a.channel_name,
          a.product_name,
          a.version, --dimension
          a.registered_device_count, /*as "Number of Registered Devices" --measure*/
          b.id as release_id,
          b.name as release_name,
          date(b.createdat) as channel_release_date
          from (
             select
             devices_view.channel_id ,
             devices_view.channel_name ,
             devices_view.product_name,
             devices_view.device_software_version_number as version,
             count(1) as registered_device_count
          --   ,count(device_registrations_view.deviceuuid) as device_count
             from public.devices_view
             inner join public.device_registrations_view
              on devices_view.deviceuuid  = device_registrations_view.deviceuuid
             where 1=1
              and devices_view.device_software_version_number  > 1000000 --filter: Minimum SW Version
              and devices_view.device_software_version_number < 8000000 --filter: Maximum SW Version
             group by devices_view.channel_id, devices_view.channel_name, devices_view.product_name, devices_view.device_software_version_number
             order by devices_view.device_software_version_number desc
          ) a
          left join (
             select
             releases.name,
             releases.id,
             releases.version,
             releases.releasedate ,
             channel_releases.createdat,
             channel_releases.channelid
             from channel_releases
             inner join releases
              on releases.id = channel_releases.releaseid
            ) b
          on b.version = a.version
          and b.channelid = a.channel_id
          order by a.channel_id, a.version
      ;;
  }

  parameter: max_software_version {
    description: ""
    type: unquoted
  }

  parameter: min_software_version {

  }

#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
}


# view: software_version_breakdown {
#   derived_table: {
#     sql: select
#         version_table.channelid,
#         version_table.version,
#         cast(version_table.device_count as integer) as device_count,
#         release_table.id,
#         release_table.name,
#         cast(release_table.createdat as timestamp) as createdat
#         -- release_table.description as "Release Description"
#         from (
#         select
#         channelid,
#         softwareversion as version,
#         count(1) as device_count
#         from public.devices
#         inner join public.device_registrations
#           on devices.uuid = device_registrations.deviceuuid
#         where devices.channelid = 106
#           and softwareversion  > 1000000
#           and softwareversion < 8000000
#         group by channelid, softwareversion
#         order by softwareversion desc
#         ) version_table
#         left outer join (
#         select
#         releases.name,
#         /*"Releases".description,*/
#         releases.id,
#         releases.version,
#         channel_releases.createdat
#         from channel_releases
#         inner join releases on releases.id = channel_releases.releaseid
#         where channel_releases.channelid = 106
#         ) release_table
#         on release_table.version = version_table.version
#         ;;
#   }

#   dimension: channelid {
#     type: number
#     sql: ${TABLE}.channelid ;;
#   }

#   dimension: version {
#     label: "SW Version"
#     type: number
#     sql: ${TABLE}.version ;;
#   }

#   dimension: id {
#     label: "Release id"
#     type: number
#     sql: ${TABLE}.id ;;
#   }

#   dimension: name {
#     label: "Release name"
#     type: string
#     sql: ${TABLE}.name ;;
#   }

#   dimension: device_count {
#     hidden: yes
#     type: number
#     sql: ${TABLE}.device_count ;;
#   }

#   dimension_group: createdat {
#     label: "Release"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.createdat::timestamp ;;
#   }

#   measure: sum_device_count {
#     label: "Number of Registered Devices"
#     type: sum
#     sql: ${device_count} ;;
#   }
# }
