# The name of this view in Looker is "Blackboxes"
view: blackboxes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: owlbarn.blackboxes ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: createdat {
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
    sql: ${TABLE}.createdat ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Deviceuuid" in Explore.

  dimension: deviceuuid {
    label: "DeviceUUID"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: lastbadboot {
    type: string
    sql: ${TABLE}.lastbadboot ;;
  }

  dimension: nappstarts {
    type: number
    sql: ${TABLE}.nappstarts ;;
  }

  dimension: ncrashboot {
    type: number
    sql: ${TABLE}.ncrashboot ;;
  }

  dimension: neyesflashingseconds {
    type: number
    sql: ${TABLE}.neyesflashingseconds ;;
  }

  dimension: nmeetingminutes {
    type: number
    sql: ${TABLE}.nmeetingminutes ;;
  }

  dimension: nmeetingminutesasprimary {
    type: number
    sql: ${TABLE}.nmeetingminutesasprimary ;;
  }

  dimension: nmeetingminutesassecondary {
    type: number
    sql: ${TABLE}.nmeetingminutesassecondary ;;
  }

  dimension: nmeetings {
    type: number
    sql: ${TABLE}.nmeetings ;;
  }

  dimension: nnosecondaryaudiominutes {
    type: number
    sql: ${TABLE}.nnosecondaryaudiominutes ;;
  }

  dimension: npinnedaoiminutes {
    type: number
    sql: ${TABLE}.npinnedaoiminutes ;;
  }

  dimension: npinnedaois {
    type: number
    sql: ${TABLE}.npinnedaois ;;
  }

  dimension: npowerup {
    type: number
    sql: ${TABLE}.npowerup ;;
  }

  dimension: nprimarypanelminutes {
    type: number
    sql: ${TABLE}.nprimarypanelminutes ;;
  }

  dimension: nsecondarypanelminutes {
    type: number
    sql: ${TABLE}.nsecondarypanelminutes ;;
  }

  dimension: nuptimeminutes {
    type: number
    sql: ${TABLE}.nuptimeminutes ;;
  }

  dimension: nuptimesincebootminutes {
    type: number
    sql: ${TABLE}.nuptimesincebootminutes ;;
  }

  dimension: nusbstatefixups {
    type: number
    sql: ${TABLE}.nusbstatefixups ;;
  }

  dimension: rawdata {
    type: string
    sql: ${TABLE}.rawdata ;;
  }

  dimension: spkrvolume {
    type: number
    sql: ${TABLE}.spkrvolume ;;
  }

  dimension_group: updatedat {
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
    type: count
    drill_fields: [id]
  }

  measure: total_nappstarts {
    type: sum
    sql: ${nappstarts} ;;
  }

  measure: average_nappstarts {
    type: average
    sql: ${nappstarts} ;;
  }

}
