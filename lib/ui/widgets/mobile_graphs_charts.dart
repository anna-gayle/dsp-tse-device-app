import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/dummy/dummy_data.dart';
import '/../models/analytics_data.dart';

class MobileGraphsCharts extends StatefulWidget {
  const MobileGraphsCharts({super.key});

  @override
  State<MobileGraphsCharts> createState() => _MobileGraphsChartsState();
}

class _MobileGraphsChartsState extends State<MobileGraphsCharts> {
  late final List<AnalyticsDataPoint> cpuData;
  late final List<AnalyticsDataPoint> snrData;
  late final List<AnalyticsDataPoint> latencyData;
  late final List<AnalyticsDataPoint> deviceCpuData;
  late final List<AnalyticsDataPoint> deviceRamData;
  late final List<AnalyticsDataPoint> deviceTempData;

  @override
  void initState() {
    super.initState();

    cpuData = DummyData.analyticsData.where((e) => e.metric == 'CPU Usage').toList();
    snrData = DummyData.analyticsData.where((e) => e.metric == 'Clarity').toList();

    latencyData = List.generate(cpuData.length, (i) {
      final timestamp = cpuData[i].timestamp;
      final latencyValue = 70 + (i % 4) * 15 - (i % 2) * 10;
      return AnalyticsDataPoint(
        timestamp: timestamp,
        value: latencyValue.toDouble(),
        metric: 'Latency',
        unit: 'ms',
      );
    });

    deviceCpuData = DummyData.analyticsData.where((e) => e.metric == 'Device CPU').toList();
    deviceRamData = DummyData.analyticsData.where((e) => e.metric == 'Device RAM').toList();
    deviceTempData = DummyData.analyticsData.where((e) => e.metric == 'Device Temp').toList();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Live Performance Metrics', style: titleStyle),
        const SizedBox(height: 12),
        SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          legend: const Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<AnalyticsDataPoint, DateTime>>[
            LineSeries<AnalyticsDataPoint, DateTime>(
              name: 'CPU Usage',
              dataSource: cpuData,
              xValueMapper: (point, _) => point.timestamp,
              yValueMapper: (point, _) => point.value,
              markerSettings: const MarkerSettings(isVisible: true),
              color: Colors.orange,
            ),
            LineSeries<AnalyticsDataPoint, DateTime>(
              name: 'Clarity (SNR)',
              dataSource: snrData,
              xValueMapper: (point, _) => point.timestamp,
              yValueMapper: (point, _) => point.value,
              markerSettings: const MarkerSettings(isVisible: true),
              color: Colors.purple,
            ),
            LineSeries<AnalyticsDataPoint, DateTime>(
              name: 'Latency',
              dataSource: latencyData,
              xValueMapper: (point, _) => point.timestamp,
              yValueMapper: (point, _) => point.value,
              markerSettings: const MarkerSettings(isVisible: true),
              color: Colors.green,
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text('Device Resource Usage', style: titleStyle),
        const SizedBox(height: 12),
        SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          legend: const Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<AnalyticsDataPoint, DateTime>>[
            ColumnSeries<AnalyticsDataPoint, DateTime>(
              name: 'Device CPU',
              dataSource: deviceCpuData,
              xValueMapper: (point, _) => point.timestamp,
              yValueMapper: (point, _) => point.value,
              color: Colors.redAccent,
            ),
            ColumnSeries<AnalyticsDataPoint, DateTime>(
              name: 'Device RAM',
              dataSource: deviceRamData,
              xValueMapper: (point, _) => point.timestamp,
              yValueMapper: (point, _) => point.value,
              color: Colors.blueAccent,
            ),
          ],
        ),
        const SizedBox(height: 32),
        SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          legend: const Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<AnalyticsDataPoint, DateTime>>[
            SplineAreaSeries<AnalyticsDataPoint, DateTime>(
              name: 'Device Temp (°C)',
              dataSource: deviceTempData,
              xValueMapper: (point, _) => point.timestamp,
              yValueMapper: (point, _) => point.value,
              color: Colors.deepOrange.withAlpha((0.6 * 255).toInt()),
              borderColor: Colors.deepOrange,
              borderWidth: 2,
            ),
          ],
        ),
      ],
    );
  }
}
