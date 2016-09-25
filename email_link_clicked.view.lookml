- view: email_link_clicked
  sql_table_name: segment.email_link_clicked
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name

  - dimension: clicked_at
    type: number
    sql: ${TABLE}.clicked_at

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

  - dimension: context_message_id
    type: string
    sql: ${TABLE}.context_message_id

  - dimension: context_traits_email
    type: string
    sql: ${TABLE}.context_traits_email

  - dimension: context_user_agent
    type: string
    sql: ${TABLE}.context_user_agent

  - dimension: email_id
    type: number
    sql: ${TABLE}.email_id

  - dimension: email_permalink
    type: string
    sql: ${TABLE}.email_permalink

  - dimension: email_subject
    type: string
    sql: ${TABLE}.email_subject

  - dimension: email_type
    type: string
    sql: ${TABLE}.email_type

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

  - dimension: link_url
    type: string
    sql: ${TABLE}.link_url

  - dimension: original_timestamp
    type: string
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
    - campaign_name
    - context_integration_name
    - context_library_name
    - users.context_campaign_name
    - users.context_library_name
    - users.name
    - users.context_app_name
    - users.id
    - users.context_google_analytics_campaign_name
    - users.name

