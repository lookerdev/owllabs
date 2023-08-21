view: blackboxes {
sql_table_name: owlbarn.blackboxes ;;
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
    sql: ${TABLE}.createdat ;;
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

  # measure: total_nappstarts {
  #   type: sum
  #   sql: ${nappstarts} ;;
  # }

  # measure: average_nappstarts {
  #   type: average
  #   sql: ${nappstarts} ;;
  # }

}
