- view: deployment_remote_import
  sql_table_name: segment.deployment_remote_import
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: context_google_analytics_campaign_content
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_content

  - dimension: context_google_analytics_campaign_medium
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_medium

  - dimension: context_google_analytics_campaign_name
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_name

  - dimension: context_google_analytics_campaign_source
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_source

  - dimension: context_google_analytics_client_id
    type: string
    sql: ${TABLE}.context_google_analytics_client_id

  - dimension: context_google_analytics_user_agent
    type: string
    sql: ${TABLE}.context_google_analytics_user_agent

  - dimension: context_library_name
    type: string
    sql: ${TABLE}.context_library_name

  - dimension: context_library_version
    type: string
    sql: ${TABLE}.context_library_version

  - dimension: context_source
    type: string
    sql: ${TABLE}.context_source

  - dimension: deployment_name
    type: string
    sql: ${TABLE}.deployment_name

  - dimension: deployment_type
    type: string
    sql: ${TABLE}.deployment_type

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

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

  - dimension_group: timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.timestamp

  - dimension: user_id
    type: string
    # hidden: true
    sql: ${TABLE}.user_id

  - dimension_group: uuid_ts
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.uuid_ts

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - context_google_analytics_campaign_name
    - context_library_name
    - deployment_name
    - users.context_campaign_name
    - users.context_library_name
    - users.name
    - users.context_app_name
    - users.id
    - users.context_google_analytics_campaign_name
    - users.name

