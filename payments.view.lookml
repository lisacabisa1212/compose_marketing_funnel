- view: payments
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

  - dimension: invoice_id
    type: string
    # hidden: true
    sql: ${TABLE}.invoice_id

  - dimension_group: paid
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.paid_at

  - dimension: source_type
    type: string
    sql: ${TABLE}.source_type

  - dimension: successful
    type: yesno
    sql: ${TABLE}.successful

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
    - invoices.id

