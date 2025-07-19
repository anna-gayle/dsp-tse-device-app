import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/../models/raspberry.dart';

class MobileRaspberryCard extends StatelessWidget {
  final Raspberry device;

  const MobileRaspberryCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(device.deviceName, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            _infoRow(FontAwesomeIcons.microchip, 'Firmware', device.firmwareVersion),
            _infoRow(FontAwesomeIcons.plug, 'Connected To', device.systemConnectedTo),
            _infoRow(FontAwesomeIcons.robot, 'Model Used', device.modelUsed),
            _infoRow(FontAwesomeIcons.clock, 'Uptime', device.formattedUptime),
            _infoRow(FontAwesomeIcons.codeBranch, 'App Version', device.appVersion),
            _infoRow(FontAwesomeIcons.arrowsRotate, 'Last Sync', device.lastSyncTime),
            _infoRow(
              FontAwesomeIcons.spinner,
              'Status',
              device.isProcessing ? 'Processing...' : 'Idle',
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: device.storagePercentage,
              backgroundColor: colorScheme.surfaceContainerHighest,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 4),
            Text(
              'Storage: ${device.storageLabel}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
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
