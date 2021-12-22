view: device_view {
  label: "Devices"
  sql_table_name: public.devices_view ;;
  drill_fields: [device_id]

# Dimensions

  dimension: alias {
    label: "Alias"
    description: "Customer's chosen nickname for device"
    type: string
    sql: ${TABLE}.device_alias ;;
  }

  dimension: channel_id {
    hidden: yes
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: channel_name {
    label: "Barn Channel Name"
    description: "Name of Barn channel device belongs to"
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension: barn_channel_category {
    description: "If Barn channel is a production, customer-facing channel or QA"
    type: string
    sql: case when ${channel_name} in ('Beta1','Beta2','BETA2020107FindFreeOwl','BETA2020109VoiceCameraLock','BETA2Production','Beta3','BetaActive','BetaCustomers','BetaRetired','BetaKOZ','RhapsodyBeta') then 'Beta'
              when ${channel_name} in ('AnastasiaTest','AudioTest','AutoWhiteBalance','BCATest','BETA1TESTERS','BETA2USERS','BobTest','CanadiaTest','CausewayStOwls','CausewayStPROD','CausewayStQA','CausewayStUnits','CausewayStWhiteboardOwls','ChrisEngTest','ChrisHTest','ChristineSQA','ChristineTest','DesktopAppDevOTATest','DoNotUpdate','ErinHbPairedOwlTest','ErinTest','FATESTALL','FATESTOTA','GooglePreReleaseDec18','GucciTest','HBIRDBETATESTEROWLS','IlyaTest','Internal','InternalAlpha','InternalUsers','Isolated','JBTest','JohnOiotOTA','LenaTest','LifeTest','MarkInternalTestFlock','OTATEST10100','PeterTest','PhuTest','PressAndMarketing','PrestonTest','Processing','QA','RAALLVERSIONTEST','RAOTATESTV18','RDPreRelease','RetiredEng','RevertOTA99998TestKey','RevertOTA99999999','RobertTest','RussTest','RyanJCustomersQA','RyanTest','SarahAudioTest','SourceNextOffice','SpenserTest','SQAAnastasia','SQAJeffTest','SQAnastasia','SterlingTest','TomTest','V1ToV2Upgrade','VCCertsAudioTest','WBsavenshareProOldPOC','YukiTesting','ZoomUi') then 'Internal'
              when ${channel_name} in ('OVERRIDE','overrideQA') then 'Override'
              when ${channel_name} in ('00019Customers','0001Customers','1080PhasedRollout','1090PhasedRollout','AmazonVendorCentral','ANZ','ChromeIssueOTA','ConferenceRooms','Customers','DesktopAppBeta','Europe','LodiSchools','LodiSchoolsPhasedRollout','PhasedRollout','ResellerCustomers','Returns','SomervilleOfficeConferenceRoom','Unknown') then 'Public'
              end;;
  }

  dimension_group: checkedinat {
    label: "Most Recent Device Check-In"
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
    sql: ${TABLE}.device_last_checkin::timestamp ;;
  }

  dimension_group: createdat {
    hidden: yes
    description: "Device Record Creation"
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
    sql: ${TABLE}.device_record_create_date ;;
  }

  dimension_group: device_activation_date {
    label: "Device Activation"
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
    sql: ${TABLE}.device_activation_date::timestamp ;;
  }

  dimension_group: device_record_delete_date {
    hidden: yes
    label: "Device Record Delete"
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
    sql: ${TABLE}.device_record_delete_date::timestamp ;;
  }

  dimension: device_hardware_serial_number {
    label: "Hardware Serial Number"
    type: string
    sql: ${TABLE}.device_hardware_serial_number ;;
  }

  dimension: device_hardware_version {
    label: "Hardware Version"
    type: string
    sql: ${TABLE}.device_hardware_version ;;
  }

  dimension: device_id {
    primary_key: yes
    hidden: yes
    label: "Device Record ID"
    description: "Unique identifier for each device record"
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_name {
    # hidden: yes
    type: string
    sql: ${TABLE}.device_name ;;
  }

  dimension: lastip {
    label: "Last IP Address"
    description: "Device's most recent IP address, captured during most recent check-in"
    hidden: yes
    type: string
    sql: ${TABLE}.device_last_ip_address ;;
  }

  dimension: last_location {
    hidden: yes
    type: string
    sql: ${TABLE}.device_last_location ;;
  }

  dimension: parent_settings {
    hidden: yes
    type: string
    sql: ${TABLE}.device_parent_settings ;;
  }

  dimension: pcb_version {
    hidden: yes
    type: string
    sql: ${TABLE}.device_pcb_version ;;
  }

  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    label: "Product"
    description: "Device product type"
    type: string
    sql: ${TABLE}.product_name;;
  }

  dimension: serial {
    label: "Software Serial Number"
    type: string
    sql: ${TABLE}.device_serial_number ;;
  }

  dimension: settings {
    hidden: yes
    type: string
    sql: ${TABLE}.device_settings ;;
  }

  dimension: software_version {
    label: "Device Current Software Version"
    description: "Device's most recent software version, captured during most recent check-in"
    type: string
    sql: ${TABLE}.device_software_version ;;
  }

  dimension: software_version_number{
    hidden: yes
    type: string
    sql: ${TABLE}.device_software_version_number ;;
  }

  dimension: status {
    label: "Device Status"
    description: "Status Values: 0 - New, 1 - Active, 2 - Requires Update, 3 - Updating, 4 - Inactive, 5 - Downloading Update, 6 - Offline, 7 - Archived"
    type: number
    sql: ${TABLE}.device_status ;;
  }

  dimension: uuid {
    label: "Device UUID"
    description: "Unique identifier for each device"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

# Measures
  measure: device_count {
    label: "Count of Devices"
    type: number
    sql: count(distinct ${uuid}) ;;
    drill_fields: [device_id, device_name, product_name, channel_name]
  }

  # dimension: 6mth_average_local_talk_time_minutes {
  #   hidden: yes
  #   label: "6 Month Avg. Local Talk Minutes"
  #   description: "Average number of minutes that meeting attendee(s) using the device spoke per meeting over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_average_local_talk_time_minutes" ;;
  # }

  # dimension: 6mth_average_meeting_len_minutes {
  #   hidden: yes
  #   label: "6 Month Avg. Meeting Minutes"
  #   description: "Average meeting length in minutes for device over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_average_meeting_len_minutes" ;;
  # }

  # dimension: 6mth_average_person_count {
  #   hidden: yes
  #   label: "6 Month Avg. Person Count"
  #   description: "Average number of people device counted per meeting over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_average_person_count" ;;
  # }

  # dimension: 6mth_average_remote_talk_time_minutes {
  #   hidden: yes
  #   label: "6 Month Avg. Remote Talk Minutes"
  #   description: "Average number of minutes meeting that attendee(s) not using the device spoke per meeting over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_average_remote_talk_time_minutes" ;;
  # }

  # dimension: 6mth_count_crash_meetings {
  #   hidden: yes
  #   label: "6 Month Count Crash Meetings"
  #   description: "Number of meetings device has crashed during over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_count_crash_meetings" ;;
  # }

  # dimension: 6mth_count_of_meetings {
  #   hidden: yes
  #   label: "6 Month Count of Meetings"
  #   description: "Total number of meetings device has participated in over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_count_of_meetings" ;;
  # }

  # dimension: 6mth_count_of_paired_meetings {
  #   hidden: yes
  #   label: "6 Month Count of Paired Meetings"
  #   description: "Number of meetings device has been paired to another device over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_count_of_paired_meetings" ;;
  # }

  # dimension: 6mth_max_person_count {
  #   hidden: yes
  #   label: "6 Month Maximum Person Count"
  #   description: "Greatest number of people counted by device in a single meeting over the last 6 months"
  #   type: number
  #   sql: ${TABLE}."6mth_max_person_count" ;;
  # }
}
