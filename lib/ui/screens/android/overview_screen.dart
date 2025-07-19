import 'package:flutter/material.dart';

import '/../../core/dummy/dummy_data.dart';
import '../../widgets/mobile_host_card.dart';
import '../../widgets/mobile_raspberry_card.dart';
import '../../widgets/mobile_raspberry_gauge.dart'; 

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MobileHostCard(host: DummyData.hostMobile),
              const SizedBox(height: 16),
              MobileRaspberryCard(device: DummyData.raspberryMobile),
              const SizedBox(height: 16),
              MobileRaspberryGauges(device: DummyData.raspberryMobile),
            ],
          ),
        ),
      ),
    );
  }
}
