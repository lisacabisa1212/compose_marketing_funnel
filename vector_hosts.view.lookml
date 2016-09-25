- view: vector_hosts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: cluster
    type: string
    sql: ${TABLE}.cluster

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: flavor
    type: string
    sql: ${TABLE}.flavor

  - dimension: hardware_class
    type: string
    sql: ${TABLE}.hardware_class

  - dimension: hostname
    type: string
    sql: ${TABLE}.hostname

  - dimension: provider
    type: string
    sql: ${TABLE}.provider

  - dimension: region
    type: string
    sql: ${TABLE}.region

  - dimension: zone
    type: string
    sql: ${TABLE}.zone

  - measure: count
    type: count
    drill_fields: [id, hostname]

