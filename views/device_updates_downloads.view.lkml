view: device_updates_downloads {
  label: "Device Update Downloads"
  sql_table_name: public.deviceupdatesdownloads_view ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.


# DIMENSIONS

  dimension: id {
    primary_key: yes
    # hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: createdat {
    label: "Update Attempt"
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

  dimension: deviceuuid {
    # hidden: yes
    label: "Device UUID"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: software_release_version {
    label: "Software Version"
    # hidden: yes
    type: string
    sql: ${TABLE}.software_release_version ;;
  }

  dimension: software_release_version_number {
    label: "Software Version (integer)"
    # hidden: yes
    type: number
    sql: ${TABLE}.software_release_version_number ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }

# MEASURES

  measure: count {
    label: "Count of Update Attempts"
    # hidden: yes
    type: count
    drill_fields: [id, createdat_date]
  }

}
