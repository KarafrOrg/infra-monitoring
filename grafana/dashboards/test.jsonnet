local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

g.dashboard.new('Faro dashboard')
+ g.dashboard.withUid('faro-grafonnet-demo')
+ g.dashboard.withDescription('Dashboard for Faro')
+ g.dashboard.graphTooltip.withSharedCrosshair()
+ g.dashboard.withPanels([
  // Collapsible Row
  g.panel.row.new('Faro API Metrics')
  + g.panel.row.withCollapsed(false)  // true = start collapsed
  + g.panel.row.withPanels([
    // First panel inside the row
    g.panel.timeSeries.new('Requests / sec')
    + g.panel.timeSeries.queryOptions.withTargets([
      g.query.prometheus.new(
        'mimir',
        'sum by (status_code) (rate(request_duration_seconds_count{job=~".*/faro-api"}[$__rate_interval]))',
      ),
    ])
    + g.panel.timeSeries.standardOptions.withUnit('reqps')
    + g.panel.timeSeries.gridPos.withW(24)
    + g.panel.timeSeries.gridPos.withH(8),

    // Second panel inside the row
    g.panel.timeSeries.new('Errors / sec')
    + g.panel.timeSeries.queryOptions.withTargets([
      g.query.prometheus.new(
        'mimir',
        'sum by (status_code) (rate(request_errors_total{job=~".*/faro-api"}[$__rate_interval]))',
      ),
    ])
    + g.panel.timeSeries.standardOptions.withUnit('reqps')
    + g.panel.timeSeries.gridPos.withW(24)
    + g.panel.timeSeries.gridPos.withH(8),
  ])
])
