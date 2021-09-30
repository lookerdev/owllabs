- dashboard: revenue_report
  title: Revenue Report
  layout: newspaper
  preferred_viewer: dashboards-next
  # tile_size: 100

  filters:
  - name: Revenue Period
    title: Revenue Period
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: netsuite
    explore: revenue_by_item_looker
    listens_to_filters: []
    field: revenue_by_item_looker.accounting_period_name
  - name: Fulfillments Period
    title: Fulfillments Period
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: netsuite
    explore: item_fulfillments_looker
    listens_to_filters: []
    field: item_fulfillments_looker.period
  - name: Product Category
    title: Product Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: netsuite
    explore: revenue_by_item_looker
    listens_to_filters: []
    field: revenue_by_item_looker.product_category
  - name: Product Line
    title: Product Line
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: netsuite
    explore: revenue_by_item_looker
    listens_to_filters: []
    field: revenue_by_item_looker.product_line
  - name: Channel
    title: Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: netsuite
    explore: revenue_by_item_looker
    listens_to_filters: []
    field: revenue_by_item_looker.channel


  elements:
  - title: Revenue by Channel
    name: Revenue by Channel
    model: netsuite
    explore: revenue_by_item_looker
    type: looker_bar
    fields: [revenue_by_item_looker.total_revenue, revenue_by_item_looker.channel]
    filters: {}
    sorts: [revenue_by_item_looker.total_revenue desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: revenue_by_item_looker.total_revenue,
            id: revenue_by_item_looker.total_revenue, name: Total Revenue}], showLabels: true,
        showValues: true, valueFormat: '0,," M"', unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 4, type: linear}]
    font_size: '12'
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Product Category: revenue_by_item_looker.product_category
      Product Line: revenue_by_item_looker.product_line
      Channel: revenue_by_item_looker.channel
      Revenue Period: revenue_by_item_looker.accounting_period_name
    row: 4
    col: 0
    width: 10
    height: 9
  - title: Total Revenue
    name: Total Revenue
    model: netsuite
    explore: revenue_by_item_looker
    type: single_value
    fields: [revenue_by_item_looker.total_revenue]
    filters: {}
    sorts: [revenue_by_item_looker.total_revenue desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    interpolation: linear
    font_size: 12
    listen:
      Product Category: revenue_by_item_looker.product_category
      Product Line: revenue_by_item_looker.product_line
      Channel: revenue_by_item_looker.channel
      Revenue Period: revenue_by_item_looker.accounting_period_name
    row: 0
    col: 0
    width: 5
    height: 4
  - title: Revenue by Marketplace Segment
    name: Revenue by Marketplace Segment
    model: netsuite
    explore: revenue_by_item_looker
    type: looker_bar
    fields: [revenue_by_item_looker.marketplace_segment, revenue_by_item_looker.total_revenue]
    filters: {}
    sorts: [revenue_by_item_looker.total_revenue desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: revenue_by_item_looker.total_revenue,
            id: revenue_by_item_looker.total_revenue, name: Total Revenue}], showLabels: true,
        showValues: true, valueFormat: '0,," M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Product Category: revenue_by_item_looker.product_category
      Product Line: revenue_by_item_looker.product_line
      Channel: revenue_by_item_looker.channel
      Revenue Period: revenue_by_item_looker.accounting_period_name
    row: 13
    col: 0
    width: 10
    height: 8
  - title: Revenue by Product Category
    name: Revenue by Product Category
    model: netsuite
    explore: revenue_by_item_looker
    type: looker_bar
    fields: [revenue_by_item_looker.total_revenue, revenue_by_item_looker.product_category]
    filters: {}
    sorts: [revenue_by_item_looker.total_revenue desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: revenue_by_item_looker.total_revenue,
            id: revenue_by_item_looker.total_revenue, name: Total Revenue}], showLabels: true,
        showValues: true, valueFormat: '0,," M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Product Category: revenue_by_item_looker.product_category
      Product Line: revenue_by_item_looker.product_line
      Channel: revenue_by_item_looker.channel
      Revenue Period: revenue_by_item_looker.accounting_period_name
    row: 21
    col: 0
    width: 10
    height: 6
  - title: Revenue by Product Line
    name: Revenue by Product Line
    model: netsuite
    explore: revenue_by_item_looker
    type: looker_bar
    fields: [revenue_by_item_looker.total_revenue, revenue_by_item_looker.product_line]
    filters: {}
    sorts: [revenue_by_item_looker.total_revenue desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: revenue_by_item_looker.total_revenue,
            id: revenue_by_item_looker.total_revenue, name: Total Revenue}], showLabels: true,
        showValues: true, valueFormat: '0,," M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Product Category: revenue_by_item_looker.product_category
      Product Line: revenue_by_item_looker.product_line
      Channel: revenue_by_item_looker.channel
      Revenue Period: revenue_by_item_looker.accounting_period_name
    row: 27
    col: 0
    width: 10
    height: 12
  - title: Revenue by Account
    name: Revenue by Account
    model: netsuite
    explore: revenue_by_item_looker
    type: looker_bar
    fields: [revenue_by_item_looker.account_line_name, revenue_by_item_looker.total_revenue]
    filters: {}
    sorts: [revenue_by_item_looker.total_revenue desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: revenue_by_item_looker.total_revenue,
            id: revenue_by_item_looker.total_revenue, name: Revenue}], showLabels: true,
        showValues: true, valueFormat: '0,," M"', unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    x_axis_label_rotation: 315
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Product Category: revenue_by_item_looker.product_category
      Product Line: revenue_by_item_looker.product_line
      Channel: revenue_by_item_looker.channel
      Revenue Period: revenue_by_item_looker.accounting_period_name
    row: 39
    col: 0
    width: 10
    height: 9
  - title: 'Account Subtotal: 40000 - Revenue'
    name: 'Account Subtotal: 40000 - Revenue'
    model: netsuite
    explore: revenue_by_item_looker
    type: single_value
    fields: [revenue_by_item_looker.total_revenue]
    filters:
      revenue_by_item_looker.account_line_number: '41000,42000,43000,44000,45000,46000,47000,48000,49000'
    sorts: [revenue_by_item_looker.total_revenue desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Product Category: revenue_by_item_looker.product_category
      Product Line: revenue_by_item_looker.product_line
      Channel: revenue_by_item_looker.channel
      Revenue Period: revenue_by_item_looker.accounting_period_name
    row: 0
    col: 5
    width: 5
    height: 2
  - title: 'Account Subtotal: Other Income'
    name: 'Account Subtotal: Other Income'
    model: netsuite
    explore: revenue_by_item_looker
    type: single_value
    fields: [revenue_by_item_looker.total_revenue]
    filters:
      revenue_by_item_looker.account_line_number: '71000,71100,71130'
    sorts: [revenue_by_item_looker.total_revenue desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Product Category: revenue_by_item_looker.product_category
      Product Line: revenue_by_item_looker.product_line
      Channel: revenue_by_item_looker.channel
      Revenue Period: revenue_by_item_looker.accounting_period_name
    row: 2
    col: 5
    width: 5
    height: 2
  - title: Fulfillments by Product Category
    name: Fulfillments by Product Category
    model: netsuite
    explore: item_fulfillments_looker
    type: looker_bar
    fields: [item_fulfillments_looker.product_category, item_fulfillments_looker.total_quantity]
    filters: {}
    sorts: [item_fulfillments_looker.total_quantity desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: item_fulfillments_looker.total_quantity,
            id: item_fulfillments_looker.total_quantity, name: Total Quantity}], showLabels: true,
        showValues: true, valueFormat: '0, "K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      item_fulfillments_looker.total_quantity: "#079c98"
    defaults_version: 1
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 21
    col: 10
    width: 7
    height: 6
  - title: COGS by Product Category
    name: COGS by Product Category
    model: netsuite
    explore: item_fulfillments_looker
    type: looker_bar
    fields: [item_fulfillments_looker.product_category, item_fulfillments_looker.total_cogs]
    filters: {}
    sorts: [item_fulfillments_looker.total_cogs desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total COGS, orientation: bottom, series: [{axisId: item_fulfillments_looker.total_cogs,
            id: item_fulfillments_looker.total_cogs, name: Total Cogs}], showLabels: true,
        showValues: true, valueFormat: '0.0,," M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      item_fulfillments_looker.total_cogs: "#9334E6"
    defaults_version: 1
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 21
    col: 17
    width: 7
    height: 6
  - title: COGS by Product Line
    name: COGS by Product Line
    model: netsuite
    explore: item_fulfillments_looker
    type: looker_bar
    fields: [item_fulfillments_looker.total_cogs, item_fulfillments_looker.product_line]
    filters: {}
    sorts: [item_fulfillments_looker.total_cogs desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: item_fulfillments_looker.total_cogs,
            id: item_fulfillments_looker.total_cogs, name: Total Cogs}], showLabels: true,
        showValues: true, valueFormat: '0.0,," M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    series_colors:
      item_fulfillments_looker.total_cogs: "#9334E6"
    defaults_version: 1
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 27
    col: 17
    width: 7
    height: 12
  - title: Fulfillments by Product Line
    name: Fulfillments by Product Line
    model: netsuite
    explore: item_fulfillments_looker
    type: looker_bar
    fields: [item_fulfillments_looker.product_line, item_fulfillments_looker.total_quantity]
    filters: {}
    sorts: [item_fulfillments_looker.total_quantity desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: item_fulfillments_looker.total_quantity,
            id: item_fulfillments_looker.total_quantity, name: Total Quantity}], showLabels: true,
        showValues: true, valueFormat: '0, "K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      item_fulfillments_looker.total_quantity: "#079c98"
    defaults_version: 1
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 27
    col: 10
    width: 7
    height: 12
  - title: Fulfillments by Channel
    name: Fulfillments by Channel
    model: netsuite
    explore: item_fulfillments_looker
    type: looker_bar
    fields: [item_fulfillments_looker.total_quantity, item_fulfillments_looker.channel]
    filters: {}
    sorts: [item_fulfillments_looker.total_quantity desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: item_fulfillments_looker.total_quantity,
            id: item_fulfillments_looker.total_quantity, name: Total Quantity}], showLabels: true,
        showValues: true, valueFormat: '0, "K"', unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 11, type: linear}]
    series_types: {}
    series_colors:
      item_fulfillments_looker.total_quantity: "#079c98"
    defaults_version: 1
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 4
    col: 10
    width: 7
    height: 9
  - title: COGS by Channel
    name: COGS by Channel
    model: netsuite
    explore: item_fulfillments_looker
    type: looker_bar
    fields: [item_fulfillments_looker.channel, item_fulfillments_looker.total_cogs]
    filters: {}
    sorts: [item_fulfillments_looker.total_cogs desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: item_fulfillments_looker.total_cogs,
            id: item_fulfillments_looker.total_cogs, name: Total Cogs}], showLabels: true,
        showValues: true, valueFormat: '0.0,," M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      item_fulfillments_looker.total_cogs: "#9334E6"
    defaults_version: 1
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 4
    col: 17
    width: 7
    height: 9
  - title: COGS by Marketplace Segment
    name: COGS by Marketplace Segment
    model: netsuite
    explore: item_fulfillments_looker
    type: looker_bar
    fields: [item_fulfillments_looker.total_cogs, item_fulfillments_looker.marketplace_segment]
    filters: {}
    sorts: [item_fulfillments_looker.total_cogs desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: item_fulfillments_looker.total_cogs,
            id: item_fulfillments_looker.total_cogs, name: Total Cogs}], showLabels: true,
        showValues: true, valueFormat: '0.0,," M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      item_fulfillments_looker.total_cogs: "#9334E6"
    defaults_version: 1
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 13
    col: 17
    width: 7
    height: 8
  - title: Fulfillments by Marketplace Segment
    name: Fulfillments by Marketplace Segment
    model: netsuite
    explore: item_fulfillments_looker
    type: looker_bar
    fields: [item_fulfillments_looker.marketplace_segment, item_fulfillments_looker.total_quantity]
    filters: {}
    sorts: [item_fulfillments_looker.total_quantity desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: item_fulfillments_looker.total_quantity,
            id: item_fulfillments_looker.total_quantity, name: Total Quantity}], showLabels: true,
        showValues: true, valueFormat: '0, "K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      item_fulfillments_looker.total_quantity: "#079c98"
    defaults_version: 1
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 13
    col: 10
    width: 7
    height: 8
  - title: Total Fulfillments
    name: Total Fulfillments
    model: netsuite
    explore: item_fulfillments_looker
    type: single_value
    fields: [item_fulfillments_looker.total_quantity]
    filters: {}
    sorts: [item_fulfillments_looker.total_quantity desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: "#079c98"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 0
    col: 10
    width: 7
    height: 4
  - title: Total COGS
    name: Total COGS
    model: netsuite
    explore: item_fulfillments_looker
    type: single_value
    fields: [item_fulfillments_looker.total_cogs]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#9334E6"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Fulfillments Period: item_fulfillments_looker.period
    row: 0
    col: 17
    width: 7
    height: 4
