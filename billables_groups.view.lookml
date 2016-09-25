- view: billables_groups
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: identifier
    type: string
    sql: ${TABLE}.identifier

  - dimension: sku
    type: string
    sql: ${TABLE}.sku

  - measure: count
    type: count
    drill_fields: [id]

