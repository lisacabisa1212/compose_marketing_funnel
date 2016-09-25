- view: invoices
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

  - dimension: balance
    type: number
    sql: ${TABLE}.balance

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension_group: due
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due_at

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_at

  - dimension: number
    type: number
    sql: ${TABLE}.number

  - dimension: paid
    type: yesno
    sql: ${TABLE}.paid

  - dimension: payment_amount
    type: number
    sql: ${TABLE}.payment_amount

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_at

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
    - payments.count

