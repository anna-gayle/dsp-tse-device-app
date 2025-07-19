import 'package:flutter/material.dart';

class DashboardHeader extends StatefulWidget {
  final bool isConnected;
  final bool initialSuppressionEnabled;
  final VoidCallback? onRefresh;

  const DashboardHeader({
    super.key,
    required this.isConnected,
    this.initialSuppressionEnabled = false,
    this.onRefresh,
  });

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  late bool suppressionEnabled;

  @override
  void initState() {
    super.initState();
    suppressionEnabled = widget.initialSuppressionEnabled;
  }

  void _toggleSuppression() {
    setState(() {
      suppressionEnabled = !suppressionEnabled;
    });

    final isActive = suppressionEnabled;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isActive
              ? 'Noise Suppression Enabled'
              : 'Noise Suppression Disabled',
        ),
        backgroundColor: isActive ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final statusColor = widget.isConnected ? colorScheme.primary : colorScheme.error;
    final statusText = widget.isConnected ? 'Connected' : 'Disconnected';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withAlpha(25),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dashboard',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // Status
                  Row(
                    children: [
                      Icon(
                        widget.isConnected
                            ? Icons.check_circle_rounded
                            : Icons.cancel_rounded,
                        color: statusColor,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        statusText,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Buttons
                  Row(
                    children: [
                      Tooltip(
                        message: 'Refresh status',
                        child: IconButton(
                          icon: Icon(Icons.sync, color: colorScheme.onSurface),
                          onPressed: widget.onRefresh,
                        ),
                      ),
                      Tooltip(
                        message: suppressionEnabled
                            ? 'Disable Noise Suppression'
                            : 'Enable Noise Suppression',
                        child: IconButton(
                          icon: Icon(
                            Icons.power_settings_new,
                            color:
                                suppressionEnabled ? Colors.green : Colors.grey,
                          ),
                          onPressed: _toggleSuppression,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
