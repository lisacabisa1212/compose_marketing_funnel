- view: billables
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: billable_group_id
    type: string
    sql: ${TABLE}.billable_group_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_at

  - dimension: identifier
    type: string
    sql: ${TABLE}.identifier

  - dimension: replaces_id
    type: string
    sql: ${TABLE}.replaces_id

  - dimension: resource_identifier
    type: string
    sql: ${TABLE}.resource_identifier

  - dimension: sku
    type: string
    sql: ${TABLE}.sku

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_at

  - dimension: target_id
    type: string
    sql: ${TABLE}.target_id

  - dimension: target_type
    type: string
    sql: ${TABLE}.target_type

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - accounts.context_library_name
    - accounts.name
    - accounts.name
    - accounts.parent_account_id
    - invoice_items.count

