- view: elasticsearch_indices_destroy
  sql_table_name: segment.elasticsearch_indices_destroy
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: context_app_name
    type: string
    sql: ${TABLE}.context_app_name

  - dimension: context_campaign_content
    type: string
    sql: ${TABLE}.context_campaign_content

  - dimension: context_campaign_domain_hash
    type: string
    sql: ${TABLE}.context_campaign_domain_hash

  - dimension: context_campaign_medium
    type: string
    sql: ${TABLE}.context_campaign_medium

  - dimension: context_campaign_name
    type: string
    sql: ${TABLE}.context_campaign_name

  - dimension: context_campaign_number
    type: string
    sql: ${TABLE}.context_campaign_number

  - dimension: context_campaign_session_number
    type: string
    sql: ${TABLE}.context_campaign_session_number

  - dimension: context_campaign_source
    type: string
    sql: ${TABLE}.context_campaign_source

  - dimension: context_campaign_timestamp
    type: string
    sql: ${TABLE}.context_campaign_timestamp

  - dimension: context_client_id
    type: string
    sql: ${TABLE}.context_client_id

  - dimension: context_ip
    type: string
    sql: ${TABLE}.context_ip

  - dimension: context_library_name
    type: string
    sql: ${TABLE}.context_library_name

  - dimension: context_library_version
    type: string
    sql: ${TABLE}.context_library_version

  - dimension: context_traits_account_id
    type: string
    sql: ${TABLE}.context_traits_account_id

  - dimension: context_traits_user_id
    type: string
    sql: ${TABLE}.context_traits_user_id

  - dimension: context_user_agent
    type: string
    sql: ${TABLE}.context_user_agent

  - dimension: deployment_name
    type: string
    sql: ${TABLE}.deployment_name

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

  - dimension: index_name
    type: string
    sql: ${TABLE}.index_name

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
    - context_app_name
    - context_campaign_name
    - context_library_name
    - deployment_name
    - index_name
    - users.context_campaign_name
    - users.context_library_name
    - users.name
    - users.context_app_name
    - users.id
    - users.context_google_analytics_campaign_name
    - users.name

