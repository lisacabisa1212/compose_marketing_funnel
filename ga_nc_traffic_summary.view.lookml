- view: ga_nc_traffic_summary
  fields:

  - dimension_group: date
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.date

  - dimension: month
    type: number
    sql: ${TABLE}.month

  - dimension: sessions
    type: number
    sql: ${TABLE}.sessions

  - dimension: users
    type: number
    sql: ${TABLE}.users

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - dimension: yearmonth
    type: number
    sql: ${TABLE}.yearmonth

  - measure: count
    type: count
    drill_fields: []

