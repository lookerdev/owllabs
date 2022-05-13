view: channel_releases {
  sql_table_name: public.channel_releases_view ;;


# DIMENSIONS
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: number
    sql: concat(${channelid}, ${releaseid}) ;;
  }

  dimension: buildid {
    label: "Build ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.buildid ;;
  }

  dimension: channelid {
    label: "Channel ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.channelid ;;
  }

  dimension_group: channelrelease_createdat {
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

  dimension: createdbyid {
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

  dimension: productid {
    label: "Product ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.productid ;;
  }

  dimension_group: release_createdat {
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
    label: "Release Software Version (int)"
    type: number
    value_format: "0"
    sql: ${TABLE}.release_version ;;
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

  dimension: releaseid {
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
    type: count
    drill_fields: [release_name]
  }
}
