- view: groups
  sql_table_name: segment.groups
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: billing_method
    type: string
    sql: ${TABLE}.billing_method

  - dimension: context_library_name
    type: string
    sql: ${TABLE}.context_library_name

  - dimension: context_library_version
    type: string
    sql: ${TABLE}.context_library_version

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: group_id
    type: string
    # hidden: true
    sql: ${TABLE}.group_id

  - dimension: is_trial
    type: yesno
    sql: ${TABLE}.is_trial

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension_group: original_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.original_timestamp

  - dimension: paid_service_count
    type: number
    sql: ${TABLE}.paid_service_count

  - dimension: paid_service_legacy_count
    type: number
    sql: ${TABLE}.paid_service_legacy_count

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension_group: sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent_at

  - dimension: sku_account_enhanced
    type: number
    sql: ${TABLE}.sku_account_enhanced

  - dimension: sku_cluster_enterprise
    type: number
    sql: ${TABLE}.sku_cluster_enterprise

  - dimension: sku_deployment_application
    type: number
    sql: ${TABLE}.sku_deployment_application

  - dimension: sku_deployment_cassandra
    type: number
    sql: ${TABLE}.sku_deployment_cassandra

  - dimension: sku_deployment_databrowser
    type: number
    sql: ${TABLE}.sku_deployment_databrowser

  - dimension: sku_deployment_disque
    type: number
    sql: ${TABLE}.sku_deployment_disque

  - dimension: sku_deployment_elastic_search
    type: number
    sql: ${TABLE}.sku_deployment_elastic_search

  - dimension: sku_deployment_etcd
    type: number
    sql: ${TABLE}.sku_deployment_etcd

  - dimension: sku_deployment_influxdb
    type: number
    sql: ${TABLE}.sku_deployment_influxdb

  - dimension: sku_deployment_mongo
    type: number
    sql: ${TABLE}.sku_deployment_mongo

  - dimension: sku_deployment_mongodb
    type: number
    sql: ${TABLE}.sku_deployment_mongodb

  - dimension: sku_deployment_mongodb_shard
    type: number
    sql: ${TABLE}.sku_deployment_mongodb_shard

  - dimension: sku_deployment_mysql
    type: number
    sql: ${TABLE}.sku_deployment_mysql

  - dimension: sku_deployment_postgresql
    type: number
    sql: ${TABLE}.sku_deployment_postgresql

  - dimension: sku_deployment_rabbitmq
    type: number
    sql: ${TABLE}.sku_deployment_rabbitmq

  - dimension: sku_deployment_redis
    type: number
    sql: ${TABLE}.sku_deployment_redis

  - dimension: sku_deployment_rethink
    type: number
    sql: ${TABLE}.sku_deployment_rethink

  - dimension: sku_deployment_scylla
    type: number
    sql: ${TABLE}.sku_deployment_scylla

  - dimension: sku_host_mongodb_dedicated
    type: number
    sql: ${TABLE}.sku_host_mongodb_dedicated

  - dimension: sku_legacy
    type: number
    sql: ${TABLE}.sku_legacy

  - dimension: slug
    type: string
    sql: ${TABLE}.slug

  - dimension: tags
    type: string
    sql: ${TABLE}.tags

  - dimension_group: timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.timestamp

  - dimension_group: trial_end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.trial_end_at

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
    - name
    - context_library_name
    - groups.name
    - groups.context_library_name
    - groups.id
    - users.context_campaign_name
    - users.context_library_name
    - users.name
    - users.context_app_name
    - users.id
    - users.context_google_analytics_campaign_name
    - users.name
    - groups.count

