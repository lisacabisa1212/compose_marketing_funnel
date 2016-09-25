- view: monthly_usage
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension_group: month
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.month

  - dimension: provider_id
    type: string
    # hidden: true
    sql: ${TABLE}.provider_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - providers.id
    - providers.name
    - accounts.context_library_name
    - accounts.name
    - accounts.name
    - accounts.parent_account_id

