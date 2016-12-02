- view: vw_pdt_funnel

# # Or, you could make this view a derived table, like this:
  derived_table:
    sql: |
      -- Funnel flow by month
      -- Traffic
      select distinct to_date(substr(cast(gau.year_month as text),1,4) || '-' || substr(cast(gau.year_month as text),5), 'YYYY-MM-DD') as Month, 'Step 1 - Website Traffic (visitors in 00s)' as Funnel, sum(gau.users) / 100 as Users
      from ga.monthly_uniques gau
      where gau.year_month >= '201601'
      and gau.view_alias = 'marketing_sites'
      and gau.unique_dimension is null
      and gau.deleted_at is null
       -- and to_date(substr(cast(gau.year_month as text),1,4) || '-' || substr(cast(gau.year_month as text),5), 'YYYY-MM-DD') >= date_trunc('month', now()) - interval '5 months'
      group by Month, Funnel
      
      UNION
      
       -- Signup Page Viewers
      select distinct to_date(substr(cast(gau.year_month as text),1,4) || '-' || substr(cast(gau.year_month as text),5), 'YYYY-MM-DD') as Month, 'Step 2 - Signup Page Viewers' as Funnel, sum(gau.users) as Users
      from ga.monthly_uniques gau
      where gau.year_month >= '201601'
      and (gau.page_path like '%compose.com/signup%'
        or gau.page_path like '%compose.io/signup%')
      and gau.page_title not like 'accounts Viewed Signup Page%'
      and gau.unique_dimension = 'page'
      and gau.deleted_at is null
      -- and to_date(substr(cast(gau.year_month as text),1,4) || '-' || substr(cast(gau.year_month as text),5), 'YYYY-MM-DD') >= date_trunc('month', now()) - interval '5 months'
      group by Month, Funnel
      
      UNION
      
      -- Trial signups
      -- Pre-Nov 2016
      select date_trunc('month', a.created_at) as Month, 'Step 3 - Trial Signups (website form)' as Funnel, count(distinct a.id) as Users
      from accounts a
      left join users u on a.owner_id = u.id
      left join vector_deployments vd on vd.account_id = a.id and vd.name not like 'bmix_%' -- REMOVE Bluemix accounts
      where cast(a.created_at as date) >= '2016-01-01' -- account created in month
      and cast(a.created_at as date) < '2016-11-01' -- account created in month
      and cast(a.created_at as date) < current_date
      and a.trial_end_at is not null -- make sure it's a trial
      and a.billing_method not in ('comped','vendor') -- accounts which are not comped and REMOVE Bluemix accounts
      and a.deleted_at is null -- account is not deleted
      and u.email not like '%@compose.io%' -- remove any compose trials created for testing
      and u.email not like '%@mongohq.com%' -- remove any compose trials created for testing
      and u.email not like '%.ibm.com%' -- remove any ibm trials
      and u.email not like '%@example.com%' -- remove any other IBM test accounts
      and a.slug not like 'ibm-%' -- remove accounts with ibm slugs
      and a.slug not like 'jcleongpurdue%' -- internal bluemix testing
      and a.provider_id is null -- valid trials do not have providers
       -- and date_trunc('month', a.created_at) >= date_trunc('month', now()) - interval '5 months'
      group by Month, Funnel

      UNION

      -- Trial signups      
      -- After Nov 2016
      select date_trunc('month', a.created_at) as Month, 'Step 3 - Trial Signups (website form)' as Funnel, count(distinct a.id) as Users
      from accounts a
      left join users u on a.owner_id = u.id
      left join vector_deployments vd on vd.account_id = a.id and vd.name not like 'bmix_%' -- REMOVE Bluemix accounts
      join ga.monthly_events gae on u.id = gae.dimension2_user_id and event_action = 'Signup: verified email address'
      where cast(a.created_at as date) >= '2016-11-01' -- account created in month
      and cast(a.created_at as date) < current_date
      and a.trial_end_at is not null -- make sure it's a trial
      and a.billing_method not in ('comped','vendor') -- accounts which are not comped and REMOVE Bluemix accounts
      and a.deleted_at is null -- account is not deleted
      and u.email not like '%@compose.io%' -- remove any compose trials created for testing
      and u.email not like '%@mongohq.com%' -- remove any compose trials created for testing
      and u.email not like '%.ibm.com%' -- remove any ibm trials
      and u.email not like '%@example.com%' -- remove any other IBM test accounts
      and a.slug not like 'ibm-%' -- remove accounts with ibm slugs
      and a.slug not like 'jcleongpurdue%' -- internal bluemix testing
      and a.provider_id is null -- valid trials do not have providers
       -- and date_trunc('month', a.created_at) >= date_trunc('month', now()) - interval '5 months'
      group by Month, Funnel
      
      UNION
      
      -- Trials started (trial signups with billables)
      select date_trunc('month', a.created_at) as Month, 'Step 4 - Trials Started (deployment created)' as Funnel, count(distinct a.id) as Users
      from accounts a
      left join users u on a.owner_id = u.id
      left join vector_deployments vd on vd.account_id = a.id and vd.name not like 'bmix_%' -- REMOVE Bluemix accounts
      join (
        select b.account_id, max(b.start_at) as max_billable_start, max(b.end_at) as max_billable_end
        from billables b
        where b.amount > 0 -- must have billable amount greater than 0
        and b.deleted_at is null -- billable is not deleted
        group by b.account_id
      ) x on x.account_id = a.id -- customers with billables > 0
      where cast(a.created_at as date) >= '2016-01-01' -- account created in month
      and cast(a.created_at as date) < current_date
      and a.trial_end_at is not null -- make sure it's a trial
      and a.billing_method not in ('comped','vendor') -- accounts which are not comped and REMOVE Bluemix accounts
      and a.deleted_at is null -- account is not deleted
      and u.email not like '%@compose.io%' -- remove any compose trials created for testing
      and u.email not like '%@mongohq.com%' -- remove any compose trials created for testing
      and u.email not like '%.ibm.com%' -- remove any ibm trials
      and u.email not like '%@example.com%' -- remove any other IBM test accounts
      and a.slug not like 'ibm-%' -- remove accounts with ibm slugs
      and a.slug not like 'jcleongpurdue%' -- internal bluemix testing
      and a.provider_id is null -- valid trials do not have providers
       -- and date_trunc('month', a.created_at) >= date_trunc('month', now()) - interval '5 months'
      group by Month, Funnel
      
      UNION
      
       -- Converted from trial
      select date_trunc('month', (cast(a.trial_end_at as date) + interval '1 day')) as Month, 'Step 5 - Converted from Trial to Paid' as Funnel, count(distinct a.id) as Users
      from accounts a
      left join users u on a.owner_id = u.id
      join (
        select b.account_id, max(b.start_at) as max_billable_start, max(b.end_at) as max_billable_end
        from billables b
        where b.amount > 0 -- must have billable amount greater than 0
        and b.deleted_at is null -- billable is not deleted
        group by b.account_id
      ) x on x.account_id = a.id -- customers with billables > 0
      where (a.deleted_at > a.trial_end_at -- accounts that are not deleted at date
          or a.deleted_at is null)
      and a.billing_method not in ('comped','vendor') -- accounts which are not comped and REMOVE Bluemix accounts
      and u.email not like '%@compose.io%' -- remove any compose trials created for testing
      and u.email not like '%@mongohq.com%' -- remove any compose trials created for testing
      and u.email not like '%.ibm.com%' -- remove any ibm trials
      and u.email not like '%@example.com%' -- remove any other IBM test accounts
      and a.slug not like 'ibm-%' -- remove accounts with ibm slugs
      and a.slug not like 'jcleongpurdue%' -- internal bluemix testing
      and a.provider_id is null -- valid trials do not have providers
      and cast(a.trial_end_at as date) >= '2016-01-01' -- trial ended in month
      and cast(a.trial_end_at as date) < current_date
      and cast(x.max_billable_end as date) > cast(a.trial_end_at as date) -- they have a billable after their trial ends
       -- and date_trunc('month', a.trial_end_at) >= date_trunc('month', now()) - interval '5 months'
      group by Month, Funnel
      order by Month, Funnel
    #sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from NOW()) - 60*60*7)/(60*60*24))
    #sql_trigger_value: select now()
    persist_for: 24 hours
    indexes: [Month]

  fields:
# #     Define your dimensions and measures here, like this:

     - dimension_group: Event_date
       type: time
       timeframes: [month, quarter, year]
       sql: ${TABLE}.Month

     - dimension: Month
       type: date
       sql: ${TABLE}.Month

     - dimension: Funnel
       type: string
       sql: ${TABLE}.Funnel

     - measure: Users
       type: sum
       sql: ${TABLE}.Users
