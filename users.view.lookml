- view: users
  sql_table_name: public.users
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

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name, accounts.name, accounts.parent_account_id, pg_stat_statements.count]

