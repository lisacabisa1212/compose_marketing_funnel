- view: vector_capsules
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

  - dimension: number
    type: number
    sql: ${TABLE}.number

  - dimension: parent_slug
    type: string
    sql: ${TABLE}.parent_slug

  - dimension: role
    type: string
    sql: ${TABLE}.role

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension: units
    type: number
    sql: ${TABLE}.units

  - dimension: units_needed
    type: number
    sql: ${TABLE}.units_needed

  - measure: count
    type: count
    drill_fields: [id, hosts.id, hosts.hostname, deployments.id, deployments.name]

