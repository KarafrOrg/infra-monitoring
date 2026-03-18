local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

// dashboard definition
g.dashboard.new('Example Dashboard with Collapsible Row')
+ g.dashboard.withUid('demo-collapsible-row')
+ g.dashboard.withDescription('Demo showing 1 row with 2 panels')
+ g.dashboard.withPanels(
  g.util.grid.makeGrid([
    row.new('Process')
    + row.withPanels([
      panels.timeSeries.cpuUsage('CPU Usage', queries.cpuUsage),
      panels.timeSeries.memoryUsage('Memory Usage', queries.memUsage),
      panels.timeSeries.base('Goroutines', queries.goroutines),
      panels.timeSeries.base('Threads', queries.threads),
      panels.timeSeries.seconds('GC Duration Mean', queries.gcDuration),
    ]),
    row.new('Kubernetes Client')
    + row.withCollapsed(true)
    + row.withPanels([
      panels.heatmap.base('Workqueue Waiting Duration Over Time', queries.wqDurationOverTime),
      panels.timeSeries.durationQuantile('Workqueue Waiting Duration Quantile', queries.wqDurationQuantile),
      panels.timeSeries.short('Workqueue Depth', queries.wqDepth),
      panels.timeSeries.short('Failed Requests', queries.failedRequests),
    ]),
    row.new('Controller Runtime')
    + row.withCollapsed(true)
    + row.withPanels([
      panels.heatmap.base('Reconciling Latency Over Time', queries.reconcilingLatencyOverTime),
      panels.timeSeries.durationQuantile('Reconciling Latency Quantile', queries.reconcilingDurationQuantile),
    ]),
  ], panelWidth=8)
)
