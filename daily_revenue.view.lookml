- view: daily_revenue
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: billables_amount
    type: number
    sql: ${TABLE}.billables_amount

  - dimension: date
    type: string
    sql: ${TABLE}.date

  - dimension_group: date_as
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_as_time

  - dimension: invoice_item_amount
    type: number
    sql: ${TABLE}.invoice_item_amount

  - measure: count
    type: count
    drill_fields: [id, accounts.context_library_name, accounts.name, accounts.name, accounts.parent_account_id]

