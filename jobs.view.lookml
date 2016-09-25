- view: jobs
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: database_id
    type: string
    # hidden: true
    sql: ${TABLE}.database_id

  - dimension: runner
    type: string
    sql: ${TABLE}.runner

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: status_channel
    type: string
    sql: ${TABLE}.status_channel

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, databases.id, databases.name]

