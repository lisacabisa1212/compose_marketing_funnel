- view: daily_events
  sql_table_name: ga.daily_events
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: avg_session_duration
    type: number
    sql: ${TABLE}.avg_session_duration

  - dimension: campaign
    type: string
    sql: ${TABLE}.campaign

  - dimension: comment
    type: string
    sql: ${TABLE}.comment

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date

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

  - dimension: event_action
    type: string
    sql: ${TABLE}.event_action

  - dimension: event_category
    type: string
    sql: ${TABLE}.event_category

  - dimension: event_label
    type: string
    sql: ${TABLE}.event_label

  - dimension: goal12_completions_signup_pageviews
    type: number
    sql: ${TABLE}.goal12_completions_signup_pageviews

  - dimension: goal13_completions_blog_pageviews
    type: number
    sql: ${TABLE}.goal13_completions_blog_pageviews

  - dimension: goal6_completions_signups
    type: number
    sql: ${TABLE}.goal6_completions_signups

  - dimension_group: inserted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inserted_at

  - dimension: landing_page_path
    type: string
    sql: ${TABLE}.landing_page_path

  - dimension: new_users
    type: number
    sql: ${TABLE}.new_users

  - dimension: pageviews
    type: number
    sql: ${TABLE}.pageviews

  - dimension: property_id
    type: string
    sql: ${TABLE}.property_id

  - dimension: source_medium
    type: string
    sql: ${TABLE}.source_medium

  - dimension: total_events
    type: number
    sql: ${TABLE}.total_events

  - dimension: unique_events
    type: number
    sql: ${TABLE}.unique_events

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

  - measure: count
    type: count
    drill_fields: [id]

