view: meeting_records {
  label: "Meeting Records"
  sql_table_name: owlbarn_views.meeting_records_v ;;
  drill_fields: [id]

# Dimensions
  dimension: id {
    primary_key: yes
    # hidden: yes
    label: "Meeting ID"
    description: "Unique identifier for each meeting record"
    type: number
    sql: ${TABLE}.id;;
  }

  dimension: avepinnedaoiwidth {
    hidden: yes
    label: "Average Pinned AOI Width"
    type: number
    sql: ${TABLE}.avepinnedaoiwidth ;;
  }

  dimension: crashinmeeting {
    label: "Crash in Meeting"
    description: "Whether the device crashed during the meeting"
    type: yesno
    sql: ${TABLE}.crashinmeeting ;;
  }

  dimension_group: createdat {
    hidden: yes
    label: "Meeting Record Created"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createdat::timestamp ;;
  }

  dimension: deviceuuid {
    label: "DeviceUUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: npinnedaoiedits {
    hidden: yes
    label: "Number of Pinned AOI Edits"
    type: number
    sql: ${TABLE}.npinnedaoiedits ;;
  }

  dimension: npinnedaoiseconds {
    hidden: yes
    label: "Number of Pinned AOI Seconds"
    type: number
    sql: ${TABLE}.npinnedaoiseconds ;;
  }

  dimension_group: originalstartdate {
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
    sql: ${TABLE}.originalstartdate::timestamp ;;
  }

  dimension: personcount {
    label: "Person Count"
    description: "Device's count of people who spoke during the meeting"
    type: number
    sql: ${TABLE}.personcount ;;
  }

  dimension: presenteradmin {
    label: "Presenter Mode Enabled"
    description: "Whether presenter mode was enabled by admin setting"
    type: yesno
    sql: ${TABLE}.presenteradmin ;;
  }

  dimension: presenterseconds {
    label: "Presenter Mode (seconds)"
    description: "Seconds of meeting with presenter mode enabled"
    type: number
    sql: ${TABLE}.npresenterseconds ;;
  }

  dimension_group: startdate {
    label: "Meeting Start"
    description: "The datetime at which a meeting began"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.startdate::timestamp ;; # have to cast as timestamp for the date parts (year, etc) to work
    allow_fill: yes
  }

  dimension_group: updatedat {
    hidden: yes
    label: "Meeting Record Updated"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updatedat::timestamp ;;
  }

# talk time
  dimension: remotetalktimeseconds {
    label: "Remote Talk Time (seconds)"
    group_label: "Meeting Talk Time"
    description: "Number of meeting seconds meeting attendee(s) not using the device spoke"
    type: number
    sql: ${TABLE}.remotetalktimeseconds ;;
  }

  dimension: bothtalktimeseconds {
    label: "Both Talk Time (seconds)"
    group_label: "Meeting Talk Time"
    description: "Number of meeting seconds at least one meeting attendee using the device and at least one meeting attendee not using the device spoke at the same time"
    type: number
    sql: ${TABLE}.bothtalktimeseconds ;;
  }

  dimension: localtalktimeseconds {
    label: "Local Talk Time (seconds)"
    group_label: "Meeting Talk Time"
    description: "Number of meeting seconds meeting attendee(s) using the device spoke"
    type: number
    sql: ${TABLE}.localtalktimeseconds ;;
  }

  dimension: neithertalktimeseconds {
    label: "Neither Talk Time (seconds)"
    group_label: "Meeting Talk Time"
    description: "Number of meeting seconds no meeting attendees spoke"
    type: number
    sql: ${TABLE}.neithertalktimeseconds ;;
  }

  dimension: waspaired {
    type: yesno
    label: "Device Paired"
    description: "Whether this device was paired to another device during meeting"
    sql: ${TABLE}.waspaired ;;
  }

  dimension: meeting_software_version {
    label: "Meeting Software Version"
    description: "The software version a device had installed at the time of the meeting. Based on combination of meeting data captured by Owl and software version from most recent checkin prior to meeting start. "
    # If null, this data can't be gathered from the device's checkins (Possible reasons - the most recent checkin for device occurred after the meeting date and sw version could not be determined, no sw version captured at checkin).
    type: string
    sql: ${TABLE}.swversion_decimal ;;
  }

  # dimension: swversion_int {
  #   label: "Meeting Software Version (integer)"
  #   description: "The software version a device had installed at the time of the meeting. Based on software version captured for device at most recent checkin prior to meeting start. If null, this data can't be gathered from the device's checkins (Possible reasons - the most recent checkin for device occurred after the meeting date and sw version could not be determined, no sw version captured at checkin)."
  #   type: string
  #   sql: ${TABLE}.swversion_int ;;
  # }

  dimension: durationseconds_per_meeting {
    hidden: yes
    label: "Meeting Length (seconds)"
    description: "The number of minutes that each individual meeting takes. Use this to filter by meeting length."
    type: number
    sql: ${TABLE}.durationseconds ;;
  }

  dimension: durationminutes_per_meeting {
    label: "Meeting Length (minutes)"
    description: "The number of seconds that each individual meeting takes. Use this to filter by meeting length."
    type: number
    sql: ${TABLE}.durationseconds / 60 ;;
    # value_format: "0" # integer
  }

# NEW MEETING RECORD COLUMNS

  dimension: cameratemp {
    label: "Camera Temperature"
    description: "Measured in millidegrees Centigrade."
    type: number
    sql: ${TABLE}.cameratemp ;;
  }

  dimension: cputemp {
    label: "CPU Temperature"
    description: "Measured in degrees Centigrade."
    type: number
    sql: ${TABLE}.cputemp ;;
  }

  dimension: droppedframesduetolatency {
    label: "Dropped Frames Due to Latency"
    description: "Number of video frames excluded from stream due to video lag."
    type: number
    sql: ${TABLE}.droppedframesduetolatency ;;
  }

  dimension: fps {
    label: "Frames per Second"
    description: "Frequency at which consecutive images are captured or displayed."
    type: number
    sql: ${TABLE}.fps ;;
  }

  dimension: nwhiteboardappseconds {
    label: "Number of Whiteboard App Seconds"
    description: "Total time spent showing whiteboard when requested through the app UI."
    type: number
    sql: ${TABLE}.nwhiteboardappseconds ;;
  }

  dimension: nwhiteboardtagflips {
    label: "Number of Whiteboard Tag Flips"
    description: "Number of tag flips that occured while a WBO was paired."
    type: number
    sql: ${TABLE}.nwhiteboardtagflips ;;
  }

  dimension: nwhiteboardtagseconds {
    label: "Number of Whiteboard Tag Seconds"
    description: "Total time spent showing whiteboard when requested by tag flip."
    type: number
    sql: ${TABLE}.nwhiteboardtagseconds ;;
  }

  dimension: paireddevicecount {
    label: "Number of Paired Devices"
    group_label: "Paired Devices"
    description: "Count of unique secondary devices paired via OwlNet in meeting."
    type: number
    sql: ${TABLE}.paireddevicecount ;;
  }

  dimension: paireddevices {
    label: "Paired Devices"
    group_label: "Paired Devices"
    description: "List of secondary devices paired via OwlNet in meeting."
    type: string
    sql: ${TABLE}.paireddevices ;;
  }

  dimension: paireddevicetypes {
    label: "Paired Device Types"
    group_label: "Paired Devices"
    description: "Types of secondary devices paired via Owl Net in meeting."
    type: string
    sql: ${TABLE}.paireddevicetypes ;;
  }




# TO BE ADDED LATER
# bruinserial
# nbruinmeetingmuted
# nbruinmeetingseconds
# nbruinmeetingunmuted





# # Cohort analysis
#   dimension_group: owl_connect_return_after_first_mtg {
#     # hidden: yes
#     type: duration
#     # sql_start: ${devices.first_owl_connect_mtg_5_mins_date} ;;
#     sql_start: ${device_view.first_owl_connect_mtg_5_mins_date} ;;
#     sql_end: ${startdate_date} ;;
#     # intervals: [day, month]
#   }



# Measures

# counts
  measure: count_meetings {
    label: "Count of Meetings"
    description: "Count of unique meeting records"
    type: count_distinct
    sql: ${id} ;;
    # drill_fields: [devices.product_name, count_meetings]
    drill_fields: [device_view.product_name, count_meetings]
  }

  measure: count_devices {
    label: "Count of Devices in Meetings"
    description: "Number of distinct devices that have had meetings"
    type: count_distinct
    sql: ${deviceuuid};;
    drill_fields: [durationminutes_per_meeting, count_devices]
  }

  measure: crash_count {
    description: "Count of Times Device Crashed"
    type: sum
    sql: CASE WHEN ${crashinmeeting} = 'true' THEN 1 ELSE NULL END;;
    # drill_fields: [devices.product_name, crash_count]
    drill_fields: [device_view.product_name, crash_count]
  }

  measure: count_days {
    hidden: yes
    type: number
    sql: count(distinct ${startdate_date}) ;;
  }

  measure: sum_personcount {
    label: "Total Person Count"
    description: "Device's count of total people who spoke"
    type: sum
    sql: ${personcount} ;;
  }

  measure: avg_personcount {
    label: "Avg. Person Count per Meeting"
    description: "Average number of people captured by device who spoke per meeting"
    type: number
    sql: ${sum_personcount} * 1.0 / nullif(${count_meetings},0) ;;
    value_format: "0"
  }

# meeting duration
  measure: durationseconds {
    hidden: yes
    label: "Total Meeting Seconds"
    group_label: "Total Meeting Duration"
    description: "Total sum of meeting seconds for all devices"
    type: sum
    sql: ${durationseconds_per_meeting} ;;
  }

  measure: durationminutes {
    label: "Total Meeting Minutes"
    group_label: "Total Meeting Duration"
    description: "Total sum of meeting minutes for all devices"
    type: number
    sql: sum(${durationseconds_per_meeting}) / 60.0 ;;
    value_format: "0" # integer
  }

  measure: durationhours {
    label: "Total Meeting Hours"
    group_label: "Total Meeting Duration"
    type: number
    sql: sum(${durationseconds_per_meeting}) / 3600.0 ;;
    value_format: "0.0" #adds 1 decimal place
  }

# averages
  measure: avg_hours_per_device{
    hidden: yes
    label: "Avg. Meeting Hours per Device"
    type: number
    value_format: "0.0"
    sql: (${durationhours} * 1.0) / nullif(${count_devices},0) ;;
  }

  measure: avg_meetings_per_device {
    hidden: yes
    label: "Avg. Meetings per Device"
    type: number
    value_format: "0.0"
    sql: (${count_meetings} * 1.0) / nullif(${count_devices},0) ;;
  }

  measure: avg_meeting_length_minutes {
    label: "Avg. Minutes per Meeting"
    type: average
    value_format: "0"
    sql: ${durationminutes_per_meeting};;
    # sql: ${durationminutes} / ${count_meetings};;
  }

# talk time
  measure: sum_remotetalktimeseconds {
    label: "Total Remote Talk Time (seconds)"
    group_label: "Total Talk Time"
    description: "Total seconds meeting attendees not using the device spoke"
    type: sum
    sql: ${remotetalktimeseconds} ;;
  }

  measure: sum_bothtalktimeseconds {
    label: "Total Both Talk Time (seconds)"
    group_label: "Total Talk Time"
    description: "Total seconds at least one meeting attendee using the device and at least one meeting attendee not using the device spoke at the same time"
    type: sum
    sql: ${bothtalktimeseconds} ;;
  }

  measure: sum_localtalktimeseconds {
    label: "Total Local Talk Time (seconds)"
    group_label: "Total Talk Time"
    description: "Total seconds meeting attendees using the device spoke"
    type: sum
    sql: ${localtalktimeseconds} ;;
  }

  measure: sum_neithertalktimeseconds {
    label: "Total Neither Talk Time (seconds)"
    group_label: "Total Talk Time"
    description: "Total seconds no meeting attendees spoke"
    type: sum
    sql: ${neithertalktimeseconds} ;;
  }

# other
  measure: max_startdate {
    hidden: yes
    label: "Most Recent Meeting Date"
    sql: max(${originalstartdate_date})::timestamp ;;
  }

  measure: sum_presenterseconds {
    label: "Total Presenter Mode (seconds)"
    description: "Sum of meeting seconds with presenter mode enabled"
    type: sum
    sql: ${presenterseconds} ;;
  }

  measure: avg_mtgs_per_customer {
    label: "Avg. # Meetings per Customer"
    description: "Total count of meetings divded by total count of registration domains"
    type: number
    sql: ${count_meetings} * 1.0 / nullif(${device_registrations.count_domain},0) ;;
    # value_format: "0.0"
  }

# % paired meetings
  measure: count_paired_meetings {
    hidden: yes
    filters: [waspaired: "Yes"]
    type: count_distinct
    sql: ${id} ;;
  }

  measure: percent_paired_meetings {
    label: "% Paired Meetings"
    description: "Percentage of total meetings where the primary device was paired. Please note this measure will not be accurate if the Was Paired filter is used"
    type: number
    value_format: "0.0%"
    sql: ${count_paired_meetings} * 1.0 / nullif(${count_meetings},0) ;;
  }

  measure: avg_meetings_per_day_per_device {
    # hidden: yes
    label: "Avg. Meetings per Day per Device"
    description: "Count of total meetings divided by count of days"
    type: number
    sql: (count(distinct ${id})/count(distinct ${startdate_date}))/count(distinct ${deviceuuid}) ;;
  }


# NEEDED?
  dimension: hour {
    hidden: yes
    type: number
    sql: extract(hour from ${startdate_raw}) ;;
  }



  # measure: max_number_meetings {
  #   label: "Maximum Number of Meetings"
  #   type: max
  #   sql: ${TABLE}.count;;
  #   drill_fields: [id,deviceuuid]
  # }

  # measure: avg_person_count_per_mtg {
  #   label: "Average Person Count per Meeting"
  #   type: average
  #   sql: ${personcount} * 1.0 ;; # personcount needs to be a dimension
  #   drill_fields: [id,deviceuuid]
  # }

# # does this measure work?
#   measure: avg_number_meetings_per_week {
#     label: "Average Number of Meetings per Week"
#     type: number
#     sql: count(${TABLE}.id) / nullif(DATEDIFF(week,min(${TABLE}.startdate::timestamp), max(${TABLE}.startdate::timestamp)),0);;
#   }
}
