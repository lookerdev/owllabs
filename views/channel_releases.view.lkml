view: channel_releases {
  sql_table_name: owlbarn_views.channelreleases_v ;;


# DIMENSIONS
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: number
    sql: concat(${channel_id}, ${release_id}) ;;
  }

  dimension: build_id {
    label: "Build ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.buildid ;;
  }

  dimension: channel_id {
    label: "Channel ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.channelid ;;
  }

  dimension_group: channelrelease_createdat {
    label: "Channel Release Created At"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.channelrelease_createdat ;;
  }

  dimension_group: channelrelease_updatedat {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.channelrelease_updatedat ;;
  }

  dimension: createdby_id {
    hidden: yes
    type: yesno
    sql: ${TABLE}.createdbyid ;;
  }

  dimension: isdraft {
    label: "Is Draft"
    type: yesno
    sql: ${TABLE}.isdraft = 1 ;;
  }

  dimension: mandatory {
    type: yesno
    sql: ${TABLE}.mandatory ;;
  }

  dimension: override {
    type: yesno
    sql: ${TABLE}.override ;;
  }

  dimension: product_id {
    label: "Product ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.productid ;;
  }

  dimension_group: release_createdat {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.release_createdat ;;
  }

  dimension_group: release_deletedat {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.release_deletedat ;;
  }

  dimension: release_name {
    type: string
    sql: ${TABLE}.release_name ;;
  }

  dimension_group: release_updatedat {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.release_updatedat ;;
  }

  dimension: release_version {
    label: "Release Software Version (integer)"
    type: number
    value_format: "0"
    sql: ${TABLE}.release_version_int ;;
  }

  dimension: release_version_decimal {
    label: "Release Software Version"
    type: string
    sql: ${TABLE}.release_version_decimal ;;
  }

  dimension: is_current_version {
    description: "Whether this release version is the most recent prod release for the channel."
    type: yesno
    sql: ${release_version} = ${barn_channels.current_version} ;;
  }

  dimension_group: releasedate {
    label: "Release"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.releasedate ;;
  }

  dimension: release_id {
    label: "Release ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.releaseid ;;
  }

  dimension: updatedby {
    label: "Updated By"
    type: number
    sql: ${TABLE}.updatedby ;;
  }

  dimension: urgency {
    type: number
    sql: ${TABLE}.urgency ;;
  }

  measure: count {
    label: "Count of Releases"
    type: count
    drill_fields: [release_name]
  }
}
