view: software_version_download_tracking {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: with a as (
        --last download for all devices before the sw version we care about
        select
        RANK () over (partition by dd.deviceuuid ORDER BY dd.software_release_version_number desc, createdat desc) as rnk,
        dd.deviceuuid,
        dd.software_release_version_number,
        dd.software_release_version,
        dd.createdat
        from public.deviceupdatesdownloads_view dd
        left join public.devices_view dv
          on dd.deviceuuid = dv.deviceuuid
        where dv.product_name in ('Meeting Owl 3','Meeting Owl Pro','Source Next Owl Pro') [filter]
        and dv.channel_category = 'Public' [filter]
        and dd.software_release_version_number < 4000000 /*sw rev we care about*/ [filter]
        and dd.software_release_version_number > 1000000 /*filters out uat versions*/
        ),
        b as (
        --first download for all devices into the sw version we care about and beyond
        select
        RANK () over (partition by dd.deviceuuid ORDER BY dd.software_release_version_number asc, createdat desc) as rnk,
        dd.deviceuuid,
        dd.software_release_version_number,
        dd.software_release_version,
        dd.createdat
        from public.deviceupdatesdownloads_view dd
        left join public.devices_view dv
          on dd.deviceuuid = dv.deviceuuid
        where dv.product_name in ('Meeting Owl 3','Meeting Owl Pro','Source Next Owl Pro') [filter]
        and dv.channel_category = 'Public' [filter]
        and dd.software_release_version_number >= 4000000 /*sw rev we care about*/ [filter]
        and dd.software_release_version_number < 8888888 /*filters out uat versions*/
        )
        select
        a.deviceuuid,
        a.software_release_version_number as pre_last_software_version_number,
        a.software_release_version as pre_last_software_version,
        a.createdat as pre_last_software_version_download_date,
        b.software_release_version_number as post_first_software_version_num,
        b.software_release_version as post_first_software_version,
        b.createdat as post_first_software_version_download_date
        from a
        left join b
          on a.deviceuuid = b.deviceuuid
          and b.rnk = 1
        where a.rnk = 1
          and b.deviceuuid is not null ;;
  }
#
# WHERE
#         {% condition order_region %} order.region {% endcondition %}
# {% condition filter_name %} sql_or_lookml_reference {% endcondition %}


#   # Define your dimensions and measures here, like this:
  dimension: deviceuuid {
    # description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }
#
  dimension: software_release_version_number {
    # description: "The total number of orders for each user"
    type: number
    sql: ${TABLE}.software_release_version_number ;;
  }

  dimension: software_release_version {
    # description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.software_release_version ;;
  }

  dimension_group: createdat {
    label: "Download"
    description: "The date of each successful download"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.createdat ;;
  }

  measure: count_deviceuuid {
    description: "Number of devices that have downloaded"
    type: count_distinct
    sql: ${deviceuuid} ;;
  }

}
