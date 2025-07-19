import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/../models/host_system.dart';

class HostSystemInfoCard extends StatelessWidget {
  final HostSystem host;

  const HostSystemInfoCard({super.key, required this.host});

  @override
  Widget build(BuildContext context) {
    final isChargingText = host.isCharging ? 'Charging' : 'Not Charging';

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 280, maxWidth: 320),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(host.deviceModel, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              _infoRow(FontAwesomeIcons.windows, 'OS', host.osVersion),
              _infoRow(FontAwesomeIcons.networkWired, 'Connection', host.connectionType),
              _infoRow(FontAwesomeIcons.microphone, 'Input', host.inputDevice),
              _infoRow(FontAwesomeIcons.volumeHigh, 'Used By', host.usedByApp),
              _infoRow(FontAwesomeIcons.batteryThreeQuarters, 'Battery', isChargingText),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          FaIcon(icon, size: 14),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
