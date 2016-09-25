- view: databases_daily
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: active
    type: yesno
    sql: ${TABLE}.active

  - dimension: data_size
    type: number
    sql: ${TABLE}.dataSize

  - dimension: database_id
    type: string
    # hidden: true
    sql: ${TABLE}.database_id

  - dimension_group: date_as
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_as_time

  - dimension: file_size
    type: number
    sql: ${TABLE}.fileSize

  - dimension: index_size
    type: number
    sql: ${TABLE}.indexSize

  - dimension: logins
    type: number
    sql: ${TABLE}.logins

  - measure: count
    type: count
    drill_fields: [id, databases.id, databases.name]

