# IN PROGRESS
# ideally the goal is to use liquid parameters to control the software version that we are tracking against. I have to figure out how to bring that filter version in as a dimension in the final query to use as a filter and to have that filter affect the subqueries...

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
where dd.software_release_version_number < 4000000 /*sw rev we care about*/
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
where dd.software_release_version_number >= 4000000 /*sw rev we care about*/
and dd.software_release_version_number < 8888888 /*filters out uat versions*/
)
select
a.deviceuuid,
a.software_release_version_number as pre_last_software_version_number,
a.software_release_version as pre_last_software_version,
a.createdat as pre_last_software_version_download_date,
b.software_release_version_number as post_first_software_version_num,
b.software_release_version as post_first_software_version,
b.createdat as post_first_software_version_download_date,
dv.product_name,
dv.channel_category,
dv.channel_name
from a
left join b
  on a.deviceuuid = b.deviceuuid
  and b.rnk = 1
left join public.devices_view dv
  on dv.deviceuuid = a.deviceuuid
where 1=1
  and dv.product_name in ('Meeting Owl 3','Meeting Owl Pro','Source Next Owl Pro')
  and dv.channel_category = 'Public'
  and a.rnk = 1
  and b.deviceuuid is not null;;
  }
#
# WHERE
#         {% condition order_region %} order.region {% endcondition %}
# {% condition filter_name %} sql_or_lookml_reference {% endcondition %}
  # -- and {% condition device_type %} product_name {% endcondition %}


#   # Define your dimensions and measures here, like this:
  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${deviceuuid},  ;;
  }

  dimension: deviceuuid {
    # description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

# a.deviceuuid,
# a.software_release_version_number as pre_last_software_version_number,
# a.software_release_version as pre_last_software_version,
# a.createdat as pre_last_software_version_download_date,
# b.software_release_version_number as post_first_software_version_num,
# b.software_release_version as post_first_software_version,
# b.createdat as post_first_software_version_download_date,
# dv.product_name,
# dv.channel_category,
# dv.channel_name



  dimension: pre_last_software_version_number {
    # description: "The total number of orders for each user"
    type: number
    sql: ${TABLE}.pre_last_software_version_number ;;
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
    timeframes: [date, week, month, year, time_of_day, time]
    sql: ${TABLE}.createdat ;;
  }

  dimension: product_name {
    label: "Device Type"
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: channel_category {
    type: string
    sql: ${TABLE}.channel_category ;;
  }

  # dimension: channel_name {


  # }


  measure: count_deviceuuid {
    description: "Number of devices that have downloaded"
    type: count_distinct
    sql: ${deviceuuid} ;;
  }

}
