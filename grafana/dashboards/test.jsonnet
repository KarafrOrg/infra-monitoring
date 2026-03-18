local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

// dashboard definition
g.dashboard.new('Example Dashboard with Collapsible Row')
+ g.dashboard.withUid('demo-collapsible-row')
+ g.dashboard.withDescription('Demo showing 1 row with 2 panels')
+ g.dashboard.withPanels(
    [
      // Row container
      g.panel.row.new('Faro API Metrics')
      + g.panel.row.withCollapsed(true) // starts collapsed
      + g.panel.row.withPanels([

        // Panel 1 inside row
        g.panel.timeSeries.new('Requests / sec')
        + g.panel.timeSeries.queryOptions.withTargets([
          g.query.prometheus.new(
            'mimir',
            'sum(rate(request_duration_seconds_count{job=~".*/faro-api"}[$__rate_interval])) by (status_code)',
          ),
        ])
        + g.panel.timeSeries.standardOptions.withUnit('reqps'),

        // Panel 2 inside row
        g.panel.timeSeries.new('Errors / sec')
        + g.panel.timeSeries.queryOptions.withTargets([
          g.query.prometheus.new(
            'mimir',
            'sum(rate(request_errors_total{job=~".*/faro-api"}[$__rate_interval])) by (status_code)',
          ),
        ])
        + g.panel.timeSeries.standardOptions.withUnit('reqps'),

      ])
    ]
  )
