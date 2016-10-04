- dashboard: compose_marketing_funnel_v0_2
  title: Compose Marketing Funnel (alpha v0.2)
  layout: grid
  rows:
#    - elements: [funnel_last_month]
#      height: 500
    - elements: [funnel_by_month_chart]
      height: 600
    - elements: [funnel_by_month_table]
      height: 400
    - elements: [funnel_by_quarter_chart]
      height: 600
    - elements: [funnel_by_quarter_table]
      height: 400
#  tile_size: 150

#  filters:

  elements:

#  - name: funnel_last_month
#    title: Funnel Last Month
#    type: funnel
#    model: compose_warehouse
#    explore: vw_pdt_funnel
#    dimensions: [vw_pdt_funnel.Funnel]
#    measures: [vw_pdt_funnel.Users]
#    sorts: [vw_pdt_funnel.Funnel]
#    filters:
#      vw_pdt_funnel.Month: last month
#    limit: 500
#    colorRange: ['#a15e8a', '#c899b7', '#efd7e7', '#bcd0a6', '#749e5b']
#    isCurved: false
#    hoverEffects: true
#    colorType: true
#    dynamicArea: false
#    showChange: true
    
  - name: funnel_by_month_chart
    title: Funnel by Month
    type: looker_column
    model: compose_warehouse
    explore: vw_pdt_funnel
    dimensions: [vw_pdt_funnel.Funnel, vw_pdt_funnel.Month]
    pivots: [vw_pdt_funnel.Funnel]
    measures: [vw_pdt_funnel.Users]
    filters:
      vw_pdt_funnel.Month: 13 months
      #vw_pdt_funnel.Month: 2016/01/01 to 2016/06/30
    sorts: [vw_pdt_funnel.Funnel, vw_pdt_funnel.Month]
    limit: 500
    column_limit: 50
    stacking: normal
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
    '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: true
    label_density: '25'
    label_color: [black]
    font_size: 8px
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 0.3
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'

  - name: funnel_by_month_table
    title: Funnel by Month
    type: table
    model: compose_warehouse
    explore: vw_pdt_funnel
    dimensions: [vw_pdt_funnel.Month, vw_pdt_funnel.Funnel]
    pivots: [vw_pdt_funnel.Funnel]
    measures: [vw_pdt_funnel.Users]
    sorts: [vw_pdt_funnel.Month desc, vw_pdt_funnel.Funnel]
    limit: 500
    column_limit: 50
    stacking: normal
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
    '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: true
    label_density: '25'
    label_color: [black]
    font_size: 8px
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 0
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    
  - name: funnel_by_quarter_chart
    title: Funnel by Quarter
    type: looker_column
    model: compose_warehouse
    explore: vw_pdt_funnel
    dimensions: [vw_pdt_funnel.Funnel, vw_pdt_funnel.Event_date_quarter]
    pivots: [vw_pdt_funnel.Funnel]
    measures: [vw_pdt_funnel.Users]
    filters:
      vw_pdt_funnel.Event_date_quarter: 5 quarters
      #vw_pdt_funnel.Event_date_quarter: 2016/01/01 to 2016/06/30
    sorts: [vw_pdt_funnel.Funnel, vw_pdt_funnel.Event_date_quarter]
    limit: 500
    column_limit: 50
    stacking: normal
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
    '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: true
    label_density: '25'
    label_color: [black]
    font_size: 8px
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 0.3
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    
  - name: funnel_by_quarter_table
    title: Funnel by Quarter
    type: table
    model: compose_warehouse
    explore: vw_pdt_funnel
    dimensions: [vw_pdt_funnel.Funnel, vw_pdt_funnel.Event_date_quarter]
    pivots: [vw_pdt_funnel.Funnel]
    measures: [vw_pdt_funnel.Users]
    sorts: [vw_pdt_funnel.Funnel, vw_pdt_funnel.Event_date_quarter desc]
    limit: 500
    column_limit: 50
    stacking: normal
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
    '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: true
    label_density: '25'
    label_color: [black]
    font_size: 8px
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 0
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'


