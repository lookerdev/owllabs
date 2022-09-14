view: blackboxes {
sql_table_name: owlbarn.blackboxes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: createdat {
    label: "Created At"
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
    type: number
    sql: ${TABLE}.nbadornosignalowlnetdisconnects ;;
  }

  dimension: ncrashboot {
    label: "nCrashBoot"
    type: number
    sql: ${TABLE}.ncrashboot ;;
  }

  dimension: nlonelystreamingpairingsurrenders {
    label: "nLonelyStreamingPairingSurrenders"
    type: number
    sql: ${TABLE}.nlonelystreamingpairingsurrenders ;;
  }

  dimension: nmeetingminutes {
    label: "nMeetingMinutes"
    type: number
    sql: ${TABLE}.nmeetingminutes ;;
  }

  dimension: nmeetingminutesasprimary {
    label: "nMeetingMinutesAsPrimary"
    type: number
    sql: ${TABLE}.nmeetingminutesasprimary ;;
  }

  dimension: nmeetingminutesassecondary {
    label: "nMeetingMinutesAsSecondary"
    type: number
    sql: ${TABLE}.nmeetingminutesassecondary ;;
  }

  dimension: nmeetings {
    label: "nMeetings"
    type: number
    sql: ${TABLE}.nmeetings ;;
  }

  dimension: nnoprimaryowlnetpairingfails {
    label: "nNoPrimaryOwlNetPairingFails"
    type: number
    sql: ${TABLE}.nnoprimaryowlnetpairingfails ;;
  }

  dimension: nowlnetpairingsuccesses {
    label: "nOwlNetPairingSuccesses"
    type: number
    sql: ${TABLE}.nowlnetpairingsuccesses ;;
  }

  dimension: npinnedaoiminutes {
    label: "nPinnedAoiMinutes"
    type: number
    sql: ${TABLE}.npinnedaoiminutes ;;
  }

  dimension: npinnedaois {
    label: "nPinnedAois"
    type: number
    sql: ${TABLE}.npinnedaois ;;
  }

  dimension: npowerup {
    label: "nPowerUp"
    type: number
    sql: ${TABLE}.npowerup ;;
  }

  dimension: nprimaryowlnetdisconnects {
    label: "nPrimaryOwlNetDisconnects"
    type: number
    sql: ${TABLE}.nprimaryowlnetdisconnects ;;
  }

  dimension: nsecondaryowlnetdisconnects {
    label: "nSecondaryOwlNetDisconnects"
    type: number
    sql: ${TABLE}.nsecondaryowlnetdisconnects ;;
  }

  dimension: nsecondaryusbowlnetdisconnects {
    label: "nSecondaryUsbOwlNetDisconnects"
    type: number
    sql: ${TABLE}.nsecondaryusbowlnetdisconnects ;;
  }

  dimension: nsecondaryusbowlnetpairingfailures {
    label: "nSecondaryUsbOwlNetPairingFailures"
    type: number
    sql: ${TABLE}.nsecondaryusbowlnetpairingfailures ;;
  }

  dimension: nstreamingpairingsuccesses {
    label: "nStreamingPairingSuccesses"
    type: number
    sql: ${TABLE}.nstreamingpairingsuccesses ;;
  }

  dimension: ntotalowlnetpairingfails {
    label: "nTotalOwlNetPairingFails"
    type: number
    sql: ${TABLE}.ntotalowlnetpairingfails ;;
  }

  dimension: ntotalstreamingpairingsurrenders {
    label: "nTotalStreamingPairingSurrenders"
    type: number
    sql: ${TABLE}.ntotalstreamingpairingsurrenders ;;
  }

  dimension: nuptimeminutes {
    label: "nUpTimeMinutes"
    type: number
    sql: ${TABLE}.nuptimeminutes ;;
  }

  dimension: nuptimesincebootminutes {
    label: "nUpTimeSinceBootMinutes"
    type: number
    sql: ${TABLE}.nuptimesincebootminutes ;;
  }

  dimension: nusbstatefixups {
    label: "nUsbStateFixups"
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
    label: "rawData"
    type: string
    sql: ${TABLE}.rawdata ;;
  }

  dimension: spkrvolume {
    label: "spkrVolume"
    type: number
    sql: ${TABLE}.spkrvolume ;;
  }

  dimension_group: updatedat {
    label: "Updated At"
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
