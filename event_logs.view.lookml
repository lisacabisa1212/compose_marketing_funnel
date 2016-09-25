- view: event_logs
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_balance_bucket
    type: string
    sql: ${TABLE}.account_balance_bucket

  - dimension: account_conversion_status
    type: string
    sql: ${TABLE}.account_conversion_status

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: account_type
    type: string
    sql: ${TABLE}.account_type

  - dimension: action
    type: string
    sql: ${TABLE}.action

  - dimension: category
    type: string
    sql: ${TABLE}.category

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: object_id
    type: string
    sql: ${TABLE}.object_id

  - dimension: object_klass
    type: string
    sql: ${TABLE}.object_klass

  - dimension: user_source
    type: string
    sql: ${TABLE}.user_source

  - dimension: value
    type: string
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: [id, accounts.context_library_name, accounts.name, accounts.name, accounts.parent_account_id]

