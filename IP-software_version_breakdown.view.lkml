view: software_version_breakdown {
  derived_table: {
    sql: select
        version_table.channelid,
        version_table.version,
        cast(version_table.device_count as integer) as device_count,
        release_table.id,
        release_table.name,
        cast(release_table.createdat as timestamp) as createdat
        -- release_table.description as "Release Description"
        from (
         select
         channelid,
         softwareversion as version,
         count(1) as device_count
         from public.devices
         inner join public.device_registrations
          on devices.uuid = device_registrations.deviceuuid
         where devices.channelid = 106
          and softwareversion  > 1000000
          and softwareversion < 8000000
         group by channelid, softwareversion
         order by softwareversion desc
        ) version_table
        left outer join (
         select
         releases.name,
         /*"Releases".description,*/
         releases.id,
         releases.version,
         channel_releases.createdat
         from channel_releases
         inner join releases on releases.id = channel_releases.releaseid
         where channel_releases.channelid = 106
        ) release_table
        on release_table.version = version_table.version
        ;;
  }

  dimension: channelid {
    type: number
    sql: ${TABLE}.channelid ;;
  }

  dimension: version {
    label: "SW Version"
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: id {
    label: "Release id"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    label: "Release name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: device_count {
    hidden: yes
    type: number
    sql: ${TABLE}.device_count ;;
  }

  dimension_group: createdat {
    label: "Release"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.createdat::timestamp ;;
  }

  measure: sum_device_count {
    label: "Number of Registered Devices"
    type: sum
    sql: ${device_count} ;;
  }
}
