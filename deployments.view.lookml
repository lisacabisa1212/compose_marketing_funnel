- view: deployments
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

  - dimension: current_primary
    type: string
    sql: ${TABLE}.current_primary

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: name
    type: string
    sql: ${TABLE}.name

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
    - capsules.count
    - databases.count
    - vector_capsules.count
    - vector_recipes.count

