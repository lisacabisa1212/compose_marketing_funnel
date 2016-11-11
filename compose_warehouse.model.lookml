- connection: compose_warehouse

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: accounts
  joins:
    - join: providers
      type: left_outer 
      sql_on: ${accounts.provider_id} = ${providers.id}
      relationship: many_to_one
      
    - join: users
      type: left_outer 
      sql_on: ${users.id} = ${accounts.owner_id}
      relationship: many_to_one
      
    - join: billables
      type: left_outer 
      sql_on: ${accounts.id} = ${billables.account_id}
      relationship: one_to_many
      
    - join: invoices
      type: left_outer 
      sql_on: ${accounts.id} = ${invoices.account_id}
      relationship: one_to_many
      
    - join: vw_pdt_maxbillables
      type: left_outer 
      sql_on: ${accounts.id} = ${vw_pdt_maxbillables.account_id}
      relationship: one_to_many
      
    - join: tracks
      type: left_outer 
      sql_on: ${accounts.id} = ${tracks.context_traits_account_id}
      relationship: one_to_many

- explore: billables
  joins:
    - join: accounts
      type: left_outer 
      sql_on: ${billables.account_id} = ${accounts.id}
      relationship: many_to_one

    - join: providers
      type: left_outer 
      sql_on: ${accounts.provider_id} = ${providers.id}
      relationship: many_to_one

- explore: invoices
  joins:
    - join: accounts
      type: left_outer 
      sql_on: ${invoices.account_id} = ${accounts.id}
      relationship: many_to_one

    - join: providers
      type: left_outer 
      sql_on: ${accounts.provider_id} = ${providers.id}
      relationship: many_to_one

- explore: providers
  joins:
    - join: accounts
      type: left_outer 
      sql_on: ${accounts.provider_id} = ${providers.id}
      relationship: one_to_many

- explore: users
  joins:
    - join: accounts
      type: left_outer 
      sql_on: ${users.id} = ${accounts.owner_id}
      relationship: many_to_one

    - join: tracks
      type: left_outer
      sql_on: ${tracks.context_traits_user_id} = ${users.id}
      relationship: one_to_many
      
- explore: vw_pdt_maxbillables
  joins:
    - join: accounts
      type: left_outer 
      sql_on: ${vw_pdt_maxbillables.account_id} = ${accounts.id}
      relationship: many_to_one

- explore: vw_pdt_funnel

- explore: tracks
  joins:
    - join: accounts
      type: left_outer
      sql_on: ${tracks.context_traits_account_id} = ${accounts.id}
      relationship: many_to_one

    - join: users
      type: left_outer
      sql_on: ${tracks.context_traits_user_id} = ${users.id}
      relationship: many_to_one
