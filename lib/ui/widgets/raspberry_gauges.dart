import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '/../models/raspberry.dart';

class RaspberryGauges extends StatelessWidget {
  final Raspberry device;

  const RaspberryGauges({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 320,
        height: 280, // same height as other cards
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Raspberry Pi Metrics',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildGauge(
                    label: 'CPU',
                    value: 62,
                    valueText: '62%',
                    color: Colors.blue,
                  ),
                  _buildGauge(
                    label: 'RAM',
                    value: 71,
                    valueText: '71%',
                    color: Colors.green,
                  ),
                  _buildGauge(
                    label: 'Temp',
                    value: 54,
                    valueText: '54°C',
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGauge({
    required String label,
    required double value,
    required String valueText,
    required Color color,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 90,
          height: 90,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.15,
                  thicknessUnit: GaugeSizeUnit.factor,
                  color: Colors.grey.shade300,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: value,
                    width: 0.15,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: color,
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 90,
                    widget: Text(
                      valueText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
