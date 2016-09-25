- view: coupons
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

  - dimension: coupon_group_id
    type: string
    # hidden: true
    sql: ${TABLE}.coupon_group_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: redeemed_amount
    type: number
    sql: ${TABLE}.redeemed_amount

  - dimension: redeemed_amount_base
    type: number
    sql: ${TABLE}.redeemed_amount_base

  - dimension_group: redeemed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.redeemed_at

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
    - coupon_groups.id
    - coupon_groups.name

