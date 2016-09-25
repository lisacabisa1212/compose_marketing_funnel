- view: vector_deployments
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension_group: last_backup
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_backup_at

  - dimension_group: last_scaled
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_scaled_at

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: reserved_units
    type: number
    sql: ${TABLE}.reserved_units

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - name
    - accounts.context_library_name
    - accounts.name
    - accounts.name
    - accounts.parent_account_id

