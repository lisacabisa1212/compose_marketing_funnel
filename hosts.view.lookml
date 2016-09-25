- view: hosts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: hostname
    type: string
    sql: ${TABLE}.hostname

  - measure: count
    type: count
    drill_fields: [id, hostname, capsules.count, vector_capsules.count]

