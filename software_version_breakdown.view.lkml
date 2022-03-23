view: software_version_breakdown {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: select
        version_table.channelid,
        version_table.version,
        cast(version_table.device_count as integer) as device_count,
        release_table.id as "Release ID",
        release_table.name as "Release Name",
        cast(release_table.createdat as timestamp) as "Release Date"
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
         from channel_releases --I added
         inner join releases on releases.id = channel_releases.releaseid
         where channel_releases.channelid = 106
        ) release_table
        on release_table.version = version_table.version
        ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: channelid {
    # description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.channelid ;;
  }

  dimension: version {
    label: "SW Version"
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: id {
    label: "release id"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    label: "release name"
    type: number
    sql: ${TABLE}.name ;;
  }

  dimension_group: createdat {
    label: "Release"
    # description: "The date when each user last ordered"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.createdat ;;
  }

  measure: device_count {
    label: "Number of Registered Devices"
    # description: "Use this for counting lifetime orders across many users"
    type: number
    sql: ${TABLE}.device_count ;;
  }
}
