- view: account_geos
  sql_table_name: other.account_geos
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: account_name
    type: string
    sql: ${TABLE}.account_name

  - dimension: account_slug
    type: string
    sql: ${TABLE}.account_slug

  - dimension: address_city
    type: string
    sql: ${TABLE}.address_city

  - dimension: address_country
    type: string
    sql: ${TABLE}.address_country

  - dimension: address_state
    type: string
    sql: ${TABLE}.address_state

  - dimension: address_zip
    type: string
    sql: ${TABLE}.address_zip

  - dimension_group: inserted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inserted_at

  - dimension: owner_email
    type: string
    sql: ${TABLE}.owner_email

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension: source_id
    type: string
    sql: ${TABLE}.source_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - account_name
    - accounts.context_library_name
    - accounts.name
    - accounts.name
    - accounts.parent_account_id

