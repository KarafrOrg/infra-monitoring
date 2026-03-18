local grafana = import 'grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;
local row = grafana.row;
local graphPanel = grafana.graphPanel;
local prometheus = grafana.prometheus;

dashboard.new(
  'Test Dashboard from Grafonnet',
  schemaVersion=16,
  tags=['test'],
)

.addRow(
  row.new('CPU & Memory')
    .addPanel(
      graphPanel.new(
        'CPU Usage',
        datasource='Prometheus',
        span=6
      )
      .addTarget(
        prometheus.target(
          expr='rate(node_cpu_seconds_total{mode!="idle"}[5m])',
          legendFormat='CPU {{cpu}}'
        )
      )
    )
    .addPanel(
      graphPanel.new(
        'Memory Usage',
        datasource='Prometheus',
        span=6
      )
      .addTarget(
        prometheus.target(
          expr='node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100',
          legendFormat='Available Memory %'
        )
      )
    )
)

.addRow(
  row.new('Disk I/O')
    .addPanel(
      graphPanel.new(
        'Disk Reads',
        datasource='Prometheus',
        span=6
      )
      .addTarget(
        prometheus.target(
          expr='rate(node_disk_reads_completed_total[5m])',
          legendFormat='Disk Reads'
        )
      )
    )
    .addPanel(
      graphPanel.new(
        'Disk Writes',
        datasource='Prometheus',
        span=6
      )
      .addTarget(
        prometheus.target(
          expr='rate(node_disk_writes_completed_total[5m])',
          legendFormat='Disk Writes'
        )
      )
    )
)
