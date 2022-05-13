view: barn_channels {
  sql_table_name: public.barn_channels_view ;;


  dimension: accesstype {
    hidden: yes
    type: number
    sql: ${TABLE}.accesstype ;;
  }

  dimension: beta_expiry {
    hidden: yes
    type: yesno
    sql: ${TABLE}.beta_expiry ;;
  }

  dimension: channel_category {
    label: "Barn Channel Category"
    type: string
    sql: ${TABLE}.channel_category ;;
  }

  dimension: channel_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension_group: createdat {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createdat ;;
  }

  dimension: current_version {
    label: "Current Software Version"
    description: "The latest production software version that has been released to a Barn channel. If null, no prod software versions have been released to that channel."
    type: number
    value_format: "0"
    sql: ${TABLE}.current_version ;;
  }

  dimension_group: deletedat {
    hidden:  yes
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
    sql: ${TABLE}.deletedat ;;
  }

  dimension: description {
    hidden: yes
    type: yesno
    sql: ${TABLE}.description ;;
  }

  dimension: isdefault {
    label: "Is Default?"
    type: yesno
    sql: ${TABLE}.isdefault = 1 ;;
  }

  dimension: ownerid {
    hidden: yes
    type: yesno
    sql: ${TABLE}.ownerid ;;
  }

  dimension: product_name {
    label: "Device Type"
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: productid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.productid ;;
  }

  dimension: settings {
    type: string
    sql: ${TABLE}.settings ;;
  }

  dimension: slug {
    label: "Barn Channel Name"
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }

# MEASURES
  measure: count {
    label: "Count of Channels"
    type: count
    drill_fields: [product_name]
  }
}
