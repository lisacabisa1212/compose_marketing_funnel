- view: experiment_viewed
  sql_table_name: segment.experiment_viewed
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: anonymous_id
    type: string
    sql: ${TABLE}.anonymous_id

  - dimension: context_integration_name
    type: string
    sql: ${TABLE}.context_integration_name

  - dimension: context_integration_version
    type: string
    sql: ${TABLE}.context_integration_version

  - dimension: context_ip
    type: string
    sql: ${TABLE}.context_ip

  - dimension: context_library_name
    type: string
    sql: ${TABLE}.context_library_name

  - dimension: context_library_version
    type: string
    sql: ${TABLE}.context_library_version

  - dimension: context_page_path
    type: string
    sql: ${TABLE}.context_page_path

  - dimension: context_page_referrer
    type: string
    sql: ${TABLE}.context_page_referrer

  - dimension: context_page_title
    type: string
    sql: ${TABLE}.context_page_title

  - dimension: context_page_url
    type: string
    sql: ${TABLE}.context_page_url

  - dimension: context_user_agent
    type: string
    sql: ${TABLE}.context_user_agent

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

  - dimension: experiment_id
    type: string
    sql: ${TABLE}.experiment_id

  - dimension_group: original_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.original_timestamp

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension_group: sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent_at

  - dimension_group: uuid_ts
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.uuid_ts

  - dimension: variation_name
    type: string
    sql: ${TABLE}.variation_name

  - measure: count
    type: count
    drill_fields: [id, variation_name, context_integration_name, context_library_name]

