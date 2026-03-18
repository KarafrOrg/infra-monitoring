local grafana = import 'grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;
local row = grafana.row;
local prometheus = grafana.prometheus;
local template = grafana.template;
local graphPanel = grafana.graphPanel;

dashboard.new(
  'Test Dashboard from Grafonnet',
  schemaVersion=16,
  tags=['test'],
)
.addPanel(
  graphPanel.new(
    'Test Panel',
    datasource='Prometheus',
    span=6,
  ),
  gridPos={h: 8, w: 12, x: 0, y: 0}
)

