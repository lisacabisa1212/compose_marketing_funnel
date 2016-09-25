- view: backups_create
  sql_table_name: segment.backups_create
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

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

  - dimension: context_campaign_term
    type: string
    sql: ${TABLE}.context_campaign_term

  - dimension: context_campaign_timestamp
    type: string
    sql: ${TABLE}.context_campaign_timestamp

  - dimension: context_client_id
    type: string
    sql: ${TABLE}.context_client_id

  - dimension: context_google_analytics_account_id
    type: string
    sql: ${TABLE}.context_google_analytics_account_id

  - dimension: context_google_analytics_campaign_campaign_number
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_campaign_number

  - dimension: context_google_analytics_campaign_content
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_content

  - dimension: context_google_analytics_campaign_domain_hash
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_domain_hash

  - dimension: context_google_analytics_campaign_medium
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_medium

  - dimension: context_google_analytics_campaign_name
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_name

  - dimension: context_google_analytics_campaign_session_number
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_session_number

  - dimension: context_google_analytics_campaign_source
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_source

  - dimension: context_google_analytics_campaign_term
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_term

  - dimension: context_google_analytics_campaign_timestamp
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_timestamp

  - dimension: context_google_analytics_campaign_utmccn
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_utmccn

  - dimension: context_google_analytics_campaign_utmcct
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_utmcct

  - dimension: context_google_analytics_campaign_utmcmd
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_utmcmd

  - dimension: context_google_analytics_campaign_utmcsr
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_utmcsr

  - dimension: context_google_analytics_campaign_utmctr
    type: string
    sql: ${TABLE}.context_google_analytics_campaign_utmctr

  - dimension: context_google_analytics_client_id
    type: string
    sql: ${TABLE}.context_google_analytics_client_id

  - dimension: context_google_analytics_user_agent
    type: string
    sql: ${TABLE}.context_google_analytics_user_agent

  - dimension: context_ip
    type: string
    sql: ${TABLE}.context_ip

  - dimension: context_library_name
    type: string
    sql: ${TABLE}.context_library_name

  - dimension: context_library_version
    type: string
    sql: ${TABLE}.context_library_version

  - dimension: context_source
    type: string
    sql: ${TABLE}.context_source

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

  - dimension: deployment_type
    type: string
    sql: ${TABLE}.deployment_type

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

  - dimension: label
    type: string
    sql: ${TABLE}.label

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

  - dimension: type
    type: string
    sql: ${TABLE}.type

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
    - context_library_name
    - deployment_name
    - context_campaign_name
    - context_google_analytics_campaign_name
    - context_app_name
    - users.context_campaign_name
    - users.context_library_name
    - users.name
    - users.context_app_name
    - users.id
    - users.context_google_analytics_campaign_name
    - users.name
    - accounts.context_library_name
    - accounts.name
    - accounts.name
    - accounts.parent_account_id

