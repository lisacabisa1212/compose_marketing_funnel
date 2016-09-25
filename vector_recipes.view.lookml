- view: vector_recipes
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

  - dimension: deployment_id
    type: string
    # hidden: true
    sql: ${TABLE}.deployment_id

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: template
    type: string
    sql: ${TABLE}.template

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
    - deployments.id
    - deployments.name
    - accounts.context_library_name
    - accounts.name
    - accounts.name
    - accounts.parent_account_id

