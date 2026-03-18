local grafana = import 'grafonnet/grafonnet.libsonnet';

grafana.dashboard.new('Hello World Dashboard') +
grafana.panel.row.new('Hello World Row') +
grafana.panel.graph.new('Hello World Panel') +
grafana.panel.text.new('Hello World Text')
  .text('Hello, Grafana!')
  .mode('markdown')
