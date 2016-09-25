- view: capsules
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: deployment_id
    type: string
    # hidden: true
    sql: ${TABLE}.deployment_id

  - dimension: host_id
    type: string
    # hidden: true
    sql: ${TABLE}.host_id

  - measure: count
    type: count
    drill_fields: [id, hosts.id, hosts.hostname, deployments.id, deployments.name]

