import 'package:flutter/material.dart';

import '../../widgets/audio_visualizer.dart';
import '../../widgets/mobile_graphs_charts.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SizedBox(height: 24),
              AudioVisualizer(),
              SizedBox(height: 24),
              MobileGraphsCharts(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
