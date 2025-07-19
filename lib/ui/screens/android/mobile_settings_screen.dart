import 'package:flutter/material.dart';
import '/../../core/dummy/dummy_data.dart';

class MobileSettingsScreen extends StatefulWidget {
  final ThemeMode initialThemeMode;
  final Function(ThemeMode) onThemeModeChanged;

  const MobileSettingsScreen({
    super.key,
    required this.initialThemeMode,
    required this.onThemeModeChanged,
  });

  @override
  State<MobileSettingsScreen> createState() => _MobileSettingsScreenState();
}

class _MobileSettingsScreenState extends State<MobileSettingsScreen> {
  late String _theme;
  bool _autoReconnect = true;
  bool _autoUpdate = true;
  bool _sendAnalytics = false;

  @override
  void initState() {
    super.initState();
    _theme = _fromThemeMode(widget.initialThemeMode);
  }

  String _fromThemeMode(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'Light',
        ThemeMode.dark => 'Dark',
        _ => 'System',
      };

  ThemeMode _toThemeMode(String mode) => switch (mode) {
        'Light' => ThemeMode.light,
        'Dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };

  @override
  Widget build(BuildContext context) {
    final device = DummyData.raspberryMobile;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SwitchListTile(
              title: const Text('Auto-Reconnect on Boot'),
              value: _autoReconnect,
              onChanged: (val) => setState(() => _autoReconnect = val),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Storage', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: device.storagePercentage,
                      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 8),
                    Text('Storage: ${device.storageLabel}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _actionTile('Clear Temp Files', Icons.cleaning_services),
            const Divider(height: 32),
            _actionTile('Check Firmware Update', Icons.system_update_alt, trailing: Text(device.firmwareVersion)),
            _actionTile('Restart Device', Icons.restart_alt),
            _actionTile('Factory Reset', Icons.delete_forever, color: Colors.red),

            const Divider(height: 32),

            ListTile(
              title: const Text('Theme Mode'),
              subtitle: const Text('Choose Light, Dark, or System'),
              trailing: DropdownButton<String>(
                value: _theme,
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _theme = value);
                  widget.onThemeModeChanged(_toThemeMode(value));
                },
                items: const [
                  DropdownMenuItem(value: 'System', child: Text('System')),
                  DropdownMenuItem(value: 'Light', child: Text('Light')),
                  DropdownMenuItem(value: 'Dark', child: Text('Dark')),
                ],
              ),
            ),
            SwitchListTile(
              title: const Text('Enable Auto Updates'),
              value: _autoUpdate,
              onChanged: (val) => setState(() => _autoUpdate = val),
            ),
            ListTile(
              title: const Text('Check for Updates'),
              trailing: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh),
                label: const Text('Check'),
              ),
            ),
            SwitchListTile(
              title: const Text('Send Usage Analytics'),
              value: _sendAnalytics,
              onChanged: (val) => setState(() => _sendAnalytics = val),
            ),
            const Divider(height: 32),
            ListTile(
              title: const Text('Clear Cache'),
              trailing: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                label: const Text('Clear'),
              ),
            ),
            const ListTile(
              title: Text('App Version'),
              subtitle: Text('v1.0.0-beta'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionTile(String title, IconData icon,
      {Widget? trailing, Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: trailing,
      onTap: () {
        // Placeholder
      },
    );
  }
}
