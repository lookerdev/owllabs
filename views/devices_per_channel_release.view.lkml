view: devices_per_channel_release {
  derived_table: {
    sql: select
          a.channel_id,
          a.channel_name,
          a.product_name,
          a.device_software_version,
          a.device_software_version_number,
          a.registered_device_count,
          b.id as release_id,
          b.name as release_name,
          cast(b.createdat as timestamp) as channel_release_date
          from (
             select
             devices_view.channel_id ,
             devices_view.channel_name ,
             devices_view.product_name,
             devices_view.device_software_version,
             devices_view.device_software_version_number,
             count(1) as registered_device_count
          --   ,count(device_registrations_view.deviceuuid) as device_count
             from public.devices_view
             inner join public.device_registrations_view
              on devices_view.deviceuuid  = device_registrations_view.deviceuuid
             where 1=1
              and {% condition software_version_select %} devices_view.device_software_version_number {% endcondition %}
             group by devices_view.channel_id, devices_view.channel_name, devices_view.product_name, devices_view.device_software_version_number, devices_view.device_software_version
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
          on b.version = a.device_software_version_number
          and b.channelid = a.channel_id
          order by a.channel_id, a.device_software_version_number
      ;;
  }


  filter: software_version_select {
    type:  number
  }


  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.channel_id || ${TABLE}.version ;;
  }

  dimension: channel_id {
    label: "Channel ID"
    description: ""
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: channel_name {
    # label: ""
    # description: ""
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension: product_name {
    label: "Device Type"
    # description: ""
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: device_software_version_number {
    label: "Software Version (integer)"
    # description: ""
    type: number
    value_format: "0"
    sql: ${TABLE}.device_software_version_number ;;
  }

  dimension: device_software_version {
    hidden: yes
    label: "Software Version (decimal expansion)"
    # description: ""
    type: string
    sql: ${TABLE}.device_software_version ;;
  }

  dimension: release_id {
    label: "Release ID"
    # description: ""
    type: number
    sql: ${TABLE}.release_id ;;
  }

  dimension: release_name {
    # description: ""
    type: string
    sql: ${TABLE}.release_name ;;
  }

  dimension_group: channel_release {
    type: time
    # convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.channel_release_date ;;
  }

  dimension: registered_device_count {
    hidden: yes
    type: number
    sql: ${TABLE}.registered_device_count ;;
  }


# MEASURES
  measure: sum_registered_device_count {
    label: "Count of Registered Devices"
    type: sum
    sql: ${registered_device_count} ;;
  }

}
