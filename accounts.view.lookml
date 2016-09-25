- view: accounts
  sql_table_name: public.accounts
  fields:

  - dimension: parent_account_id
    primary_key: true
    type: string
    sql: ${TABLE}.parent_account_id

  - dimension: account_type
    type: string
    sql: ${TABLE}.account_type

  - dimension: billing_method
    type: string
    sql: ${TABLE}.billing_method

  - dimension: comp_type
    type: string
    sql: ${TABLE}.comp_type

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: id
    type: string
    sql: ${TABLE}.id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: owner_email
    type: string
    sql: ${TABLE}.owner_email

  - dimension: owner_id
    type: string
    sql: ${TABLE}.owner_id

  - dimension: provider_id
    type: string
    # hidden: true
    sql: ${TABLE}.provider_id

  - dimension: slug
    type: string
    sql: ${TABLE}.slug

  - dimension: stripe_customer_id
    type: string
    sql: ${TABLE}.stripe_customer_id

  - dimension_group: trial_end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.trial_end_at

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - parent_account_id
    - name
    - providers.id
    - providers.name
    - billables.count
    - coupons.count
    - daily_revenue.count
    - databases.count
    - deployments.count
    - event_logs.count
    - invoice_items.count
    - invoices.count
    - monthly_usage.count
    - payments.count
    - users.count
    - vector_deployments.count
    - vector_recipes.count

