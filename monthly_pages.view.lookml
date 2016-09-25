- view: monthly_pages
  sql_table_name: ga.monthly_pages
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: bounces
    type: number
    sql: ${TABLE}.bounces

  - dimension: campaign
    type: string
    sql: ${TABLE}.campaign

  - dimension: comment
    type: string
    sql: ${TABLE}.comment

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: dimension1_account_id
    type: string
    sql: ${TABLE}.dimension1_account_id

  - dimension: dimension2_user_id
    type: string
    sql: ${TABLE}.dimension2_user_id

  - dimension: entrances
    type: number
    sql: ${TABLE}.entrances

  - dimension: exits
    type: number
    sql: ${TABLE}.exits

  - dimension_group: inserted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inserted_at

  - dimension: landing_page_path
    type: string
    sql: ${TABLE}.landing_page_path

  - dimension: page_path
    type: string
    sql: ${TABLE}.page_path

  - dimension: page_title
    type: string
    sql: ${TABLE}.page_title

  - dimension: pageviews
    type: number
    sql: ${TABLE}.pageviews

  - dimension: previous_page_path
    type: string
    sql: ${TABLE}.previous_page_path

  - dimension: property_id
    type: string
    sql: ${TABLE}.property_id

  - dimension: source_medium
    type: string
    sql: ${TABLE}.source_medium

  - dimension: time_on_page
    type: number
    sql: ${TABLE}.time_on_page

  - dimension: unique_pageviews
    type: number
    sql: ${TABLE}.unique_pageviews

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: users
    type: number
    sql: ${TABLE}.users

  - dimension: view_alias
    type: string
    sql: ${TABLE}.view_alias

  - dimension: view_id
    type: number
    sql: ${TABLE}.view_id

  - dimension: year_month
    type: number
    sql: ${TABLE}.year_month

  - measure: count
    type: count
    drill_fields: [id]

