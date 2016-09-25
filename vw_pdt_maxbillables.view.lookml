- view: vw_pdt_maxbillables
  derived_table:
    sql: |
       select b.account_id, max(b.start_at) as max_billable_start, max(b.end_at) as max_billable_end
         from billables b
       group by b.account_id

  fields:
    - dimension: account_id
      type: string
     
    - dimension: max_billable_start
      type: time
      timeframes: [date,week,month]
     
    - dimension: max_billable_end
      type: time
      timeframes: [date,week,month]
       
    - dimension: maxbillable_gt_trialendplus30
      type: yesno
      sql: case when ${max_billable_end_date} > ${accounts.trial_end_date} + 30  then TRUE else FALSE end
