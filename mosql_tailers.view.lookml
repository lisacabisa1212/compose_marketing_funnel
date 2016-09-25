- view: mosql_tailers
  fields:

  - dimension: position
    type: string
    sql: ${TABLE}.position

  - dimension: service
    type: string
    sql: ${TABLE}.service

  - dimension: timestamp
    type: number
    sql: ${TABLE}.timestamp

  - measure: count
    type: count
    drill_fields: []

