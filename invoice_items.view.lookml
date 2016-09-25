- view: invoice_items
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

  - dimension: billable_id
    type: string
    # hidden: true
    sql: ${TABLE}.billable_id

  - dimension_group: charge
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.charge_date

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_at

  - dimension: invoice_id
    type: string
    # hidden: true
    sql: ${TABLE}.invoice_id

  - dimension: sku
    type: string
    sql: ${TABLE}.sku

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
    - billables.id
    - invoices.id

