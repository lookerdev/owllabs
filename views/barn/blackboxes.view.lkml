view: blackboxes {
sql_table_name: owlbarn_views.blackboxes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: createdat {
    label: "Created"
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
    sql: ${TABLE}.createdAt ;;
  }

  dimension: deviceuuid {
    label: "DeviceUUID"
    type: string
    sql: ${TABLE}.deviceuuid ;;
  }

  dimension: lastbadboot {
    description: "Reason for previous reboot."
    label: "lastBadBoot"
    type: string
    sql: ${TABLE}.lastbadboot ;;
  }

  dimension: nappstarts {
    label: "nAppStarts"
    type: number
    sql: ${TABLE}.nappstarts ;;
  }

  dimension: nPowerUp_nAppStarts_diff {
    label: "nPowerUp_nAppStarts_diff"
    type: number
    sql: ${nappstarts}-${npowerup} ;;
  }

  dimension: nbadornosignalowlnetdisconnects {
    label: "nBadOrNoSignalOwlNetDisconnects"
    description: "Number of times Pairs disconnected from OwlNet due to bad or no signal causing consecutive ping failures."
    type: number
    sql: ${TABLE}.nbadornosignalowlnetdisconnects ;;
  }

  dimension: ncrashboot {
    label: "nCrashBoot"
    description: "Number of times Owl boots recovering from system crash."
    type: number
    sql: ${TABLE}.ncrashboot ;;
  }

  dimension: nlonelystreamingpairingsurrenders {
    label: "nLonelyStreamingPairingSurrenders"
    description: "Number of times Owl gave up trying to establish a streaming connection because of too many lonely streaming pairing failures."
    type: number
    sql: ${TABLE}.nlonelystreamingpairingsurrenders ;;
  }

  dimension: nmeetingminutes {
    label: "nMeetingMinutes"
    description: "Time in meetings."
    type: number
    sql: ${TABLE}.nmeetingminutes ;;
  }

  dimension: nmeetingminutesasprimary {
    label: "nMeetingMinutesAsPrimary"
    description: "Time in meetings as primary Owl in pair."
    type: number
    sql: ${TABLE}.nmeetingminutesasprimary ;;
  }

  dimension: nmeetingminutesassecondary {
    label: "nMeetingMinutesAsSecondary"
    description: "Time in meetings as secondary Owl in pair."
    type: number
    sql: ${TABLE}.nmeetingminutesassecondary ;;
  }

  dimension: nmeetings {
    label: "nMeetings"
    description: "Number of total meetings."
    type: number
    sql: ${TABLE}.nmeetings ;;
  }

  dimension: nnoprimaryowlnetpairingfails {
    label: "nNoPrimaryOwlNetPairingFails"
    description: "Number of OwlNet Pairing failures due to the primary failing to start advertising P2P network in time (within 5 seconds of command)."
    type: number
    sql: ${TABLE}.nnoprimaryowlnetpairingfails ;;
  }

  dimension: nowlnetpairingsuccesses {
    label: "nOwlNetPairingSuccesses"
    description: "Number of OwlNet Pairing successes."
    type: number
    sql: ${TABLE}.nowlnetpairingsuccesses ;;
  }

  dimension: npinnedaoiminutes {
    label: "nPinnedAoiMinutes"
    description: "Total minutes of meetings where an AOI was pinned."
    type: number
    sql: ${TABLE}.npinnedaoiminutes ;;
  }

  dimension: npinnedaois {
    label: "nPinnedAois"
    description: "Total number of times AOIs have been pinned during meetings."
    type: number
    sql: ${TABLE}.npinnedaois ;;
  }

  dimension: npowerup {
    label: "nPowerUp"
    description: "Number of times Owl boots from power up."
    type: number
    sql: ${TABLE}.npowerup ;;
  }

  dimension: nprimaryowlnetdisconnects {
    label: "nPrimaryOwlNetDisconnects"
    description: "Number of times Pairs disconnected from OwlNet due to primary dropping OwlNet connection."
    type: number
    sql: ${TABLE}.nprimaryowlnetdisconnects ;;
  }

  dimension: nsecondaryowlnetdisconnects {
    label: "nSecondaryOwlNetDisconnects"
    description: "Number of times Pairs disconnected from OwlNet due to primary dropping OwlNet connection."
    type: number
    sql: ${TABLE}.nsecondaryowlnetdisconnects ;;
  }

  dimension: nsecondaryusbowlnetdisconnects {
    label: "nSecondaryUsbOwlNetDisconnects"
    description: "Number of times Pairs disconnected from OwlNet due to secondary being plugged into USB."
    type: number
    sql: ${TABLE}.nsecondaryusbowlnetdisconnects ;;
  }

  dimension: nsecondaryusbowlnetpairingfailures {
    label: "nSecondaryUsbOwlNetPairingFailures"
    description: "Number of times OwlNet pairing fails due to secondary being plugged into USB."
    type: number
    sql: ${TABLE}.nsecondaryusbowlnetpairingfailures ;;
  }

  dimension: nstreamingpairingsuccesses {
    label: "nStreamingPairingSuccesses"
    description: "Number of successful visual pairings for streaming."
    type: number
    sql: ${TABLE}.nstreamingpairingsuccesses ;;
  }

  dimension: ntotalowlnetpairingfails {
    label: "nTotalOwlNetPairingFails"
    description: "Number of total OwlNet Pairing failures."
    type: number
    sql: ${TABLE}.ntotalowlnetpairingfails ;;
  }

  dimension: ntotalstreamingpairingsurrenders {
    label: "nTotalStreamingPairingSurrenders"
    description: "Number of times consecutive unsuccessful visual pairings exceeded maximum attempts and Owls gave up trying to establish a streaming connection."
    type: number
    sql: ${TABLE}.ntotalstreamingpairingsurrenders ;;
  }


#button stats dimensions

  dimension: volDnButtonPresses {
    hidden:  yes
    label: "Volume Down Presses"
    group_label: "Button Stats"
    description: "Count of Presses to volume down button during meeting"
    type:  string
    sql: ${TABLE}.vol_down_presses ;;

  }

  dimension: volUpButtonPresses {
     hidden:  yes
    label: "Volume Up Presses"
    group_label: "Button Stats"
    description: "Count of Presses to volume up button during meeting"
    type:  string
    sql: ${TABLE}.vol_up_presses ;;

  }

  dimension: muteButtonPresses {
     hidden:  yes
    label: "Mute Presses"
    group_label: "Button Stats"
    description: "Count of Presses to mute button during meeting"
    type:  string
    sql: ${TABLE}.mute_presses ;;

  }


  dimension: multiButtonPresses {
     hidden:  yes
    label: "Multi Button Presses"
    group_label: "Button Stats"
    description: "Count of Presses to multi button during meeting"
    type:  string
    sql: ${TABLE}.multib_presses ;;

  }

  # other dimensions


  dimension: nuptimeminutes {
    label: "nUpTimeMinutes"
    description: "Time program runs."
    type: number
    sql: ${TABLE}.nuptimeminutes ;;
  }

  dimension: nuptimesincebootminutes {
    label: "nUpTimeSinceBootMinutes"
    description: "Time since the system last booted."
    type: number
    sql: ${TABLE}.nuptimesincebootminutes ;;
  }

  dimension: nusbstatefixups {
    label: "nUsbStateFixups"
    description: "Number of times USB state had to be corrected in libOwlPG."
    type: number
    sql: ${TABLE}.nusbstatefixups ;;
  }

  dimension: peerinfo {
    label: "peerInfo"
    type: string
    sql: ${TABLE}.peerinfo ;;
  }

  dimension: peerswserial {
    label: "peerSwSerial"
    type: string
    sql: ${TABLE}.peerswserial ;;
  }

  dimension: rawdata {
    hidden: yes
    label: "rawData"
    description: "JSON from device checkin"
    type: string
    sql: ${TABLE}.rawdata ;;
  }

  dimension: spkrvolume {
    label: "spkrVolume"
    description: "Persistent speaker volume."
    type: number
    sql: ${TABLE}.spkrvolume ;;
  }

  dimension_group: updatedat {
    label: "Updated"
    description: "Record last updated"
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


# split fields into their corresponding sections
  ## FeatureFlagSettings/Feature Flags

  ## BruinInfo

  ## BlackBox

  ## Settings


# MEASURES

  measure: count {
    label: "Count of Blackbox Records"
    type: count
    drill_fields: [id]
  }


  #button stats measures

  measure: sum_volDnButtonPresses {
    label: "Volume Down Presses"
    group_label: "Button Stats"
    description: "Count of Presses to volume down button during meeting"
    type:  sum
    sql: ${TABLE}.vol_down_presses ;;

  }

  measure: sum_volUpButtonPresses {
    label: "Volume Up Presses"
    group_label: "Button Stats"
    description: "Count of Presses to volume up button during meeting"
    type:  sum
    sql: ${TABLE}.vol_up_presses ;;

  }

  measure: sum_muteButtonPresses {
    label: "Mute Presses"
    group_label: "Button Stats"
    description: "Count of Presses to mute button during meeting"
    type:  sum
    sql: ${TABLE}.mute_presses ;;

  }


  measure: sum_multiButtonPresses {
    label: "Multi Button Presses"
    group_label: "Button Stats"
    description: "Count of Presses to multi button during meeting"
    type:  sum
    sql: ${TABLE}.multib_presses ;;

  }


  #button stats per meeting

  measure: perdevice_volDnButtonPresses {
    label: "Volume Down Button Presses per Device"
    group_label: "Button Stats per Device"
    type: number
    sql: ${sum_volDnButtonPresses} * 1.0 / nullif(${devices.device_count},0) ;;
    value_format: "0.00"}

  measure: perdevice_volUpButtonPresses {
    label: "Volume Up Button Presses per Device"
    group_label: "Button Stats per Device"
    type: number
    sql: ${sum_volUpButtonPresses} * 1.0 / nullif(${devices.device_count},0) ;;
    value_format: "0.00"}

  measure: perdevice_muteButtonPresses {
    label: "Mute Button Presses per Device"
    group_label: "Button Stats per Device"
    type: number
    sql: ${sum_muteButtonPresses} * 1.0 / nullif(${devices.device_count},0) ;;
    value_format: "0.00"}

  measure: perdevice_multiButtonPresses {
    label: "Multi Button Presses per Device"
    group_label: "Button Stats per Device"
    type: number
    sql: ${sum_multiButtonPresses} * 1.0 / nullif(${devices.device_count},0) ;;
    value_format: "0.00"}

  # measure: total_nappstarts {
  #   type: sum
  #   sql: ${nappstarts} ;;
  # }

  # measure: average_nappstarts {
  #   type: average
  #   sql: ${nappstarts} ;;
  # }

}
