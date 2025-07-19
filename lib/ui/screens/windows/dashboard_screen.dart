import 'package:flutter/material.dart';

import '/../core/dummy/dummy_data.dart';
import '../../widgets/dashboard_header.dart';
import '../../widgets/host_system_card.dart';
import '../../widgets/raspberry_info_card.dart';
import '../../widgets/raspberry_gauges.dart';
import '../../widgets/audio_visualizer.dart'; 
import '../../widgets/graphs_charts.dart'; 

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 1000;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeader(
                isConnected: true,
                initialSuppressionEnabled: true, 
                onRefresh: () {
                  // Placeholder
                },
              ),
              const SizedBox(height: 16),

              Column(
                children: [
                  isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: HostSystemInfoCard(host: DummyData.hostDesktop)),
                            const SizedBox(width: 16),
                            Expanded(child: RaspberryInfoCard(device: DummyData.raspberryDesktop)),
                            const SizedBox(width: 16),
                            Expanded(child: RaspberryGauges(device: DummyData.raspberryDesktop)),
                          ],
                        )
                      : Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            HostSystemInfoCard(host: DummyData.hostDesktop),
                            RaspberryInfoCard(device: DummyData.raspberryDesktop),
                            RaspberryGauges(device: DummyData.raspberryDesktop),
                          ],
                        ),

                  const SizedBox(height: 24),

                  const AudioVisualizer(),

                  const SizedBox(height: 24),

                  const GraphsCharts(), 

                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
