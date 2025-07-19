import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '/../core/dummy/dummy_data.dart';
import '/../models/raspberry.dart';

class SettingsPage extends StatelessWidget {
  final Function(ThemeMode) toggleTheme;
  final ThemeMode initialThemeMode;

  const SettingsPage({
    super.key,
    required this.toggleTheme,
    required this.initialThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Noise Suppression', icon: Icon(Icons.tune)),
              Tab(text: 'Device', icon: Icon(Icons.devices)),
              Tab(text: 'Application', icon: Icon(Icons.app_settings_alt)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const NoiseSuppressionTab(),
            const DeviceSettingsTab(),
            AppSettingsTab(
              onThemeModeChanged: toggleTheme,
              initialThemeMode: initialThemeMode,
            ),
          ],
        ),
      ),
    );
  }
}

class NoiseSuppressionTab extends StatefulWidget {
  const NoiseSuppressionTab({super.key});

  @override
  State<NoiseSuppressionTab> createState() => _NoiseSuppressionTabState();
}

class _NoiseSuppressionTabState extends State<NoiseSuppressionTab> {
  List<String> presets = ['Podcast', 'Studio Mic', 'Phone Call'];

  bool _enabled = true;
  double _aggressiveness = 0.5;
  double _sensitivity = 0.7;

  void _showSaveDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Save Preset'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Preset Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                setState(() => presets.add(name));
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Presets', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: presets.map((p) {
                    return InputChip(
                      label: Text(p),
                      onPressed: () {},
                      onDeleted: () => setState(() => presets.remove(p)),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _showSaveDialog,
            icon: const Icon(Icons.save),
            label: const Text('Save Preset'),
          ),
        ),
        const SizedBox(height: 24),
        _buildSwitch('Enable Noise Suppression', _enabled, (val) => setState(() => _enabled = val)),
        _buildSlider('Aggressiveness', _aggressiveness, (val) => setState(() => _aggressiveness = val)),
        _buildSlider('Sensitivity', _sensitivity, (val) => setState(() => _sensitivity = val)),
        const Divider(height: 32),
        _buildSlider('Noise Gate Level', 0.3),
        _buildSlider('Compressor Threshold', 0.6),
        _buildSlider('Attack', 0.2),
        _buildSlider('Release', 0.4),
        _buildSlider('Sibilance Reduction', 0.5),
        _buildSlider('De-esser Strength', 0.4),
        const Divider(height: 32),
        _buildSwitch('Enable ML-Based Speaker Extraction', true, (_) {}),
        _buildSlider('Target Speaker Confidence', 0.75),
        _buildSwitch('Enable TSE Logging', false, (_) {}),
        _buildSwitch('Low Latency Mode', false, (_) {}),
      ],
    );
  }

  Widget _buildSlider(String label, double value, [ValueChanged<double>? onChanged]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        SfSlider(
          value: value,
          min: 0.0,
          max: 1.0,
          stepSize: 0.1,
          showLabels: true,
          enableTooltip: true,
          onChanged: onChanged != null ? (val) => onChanged(val as double) : null,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildSwitch(String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}

class DeviceSettingsTab extends StatelessWidget {
  const DeviceSettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final Raspberry device = DummyData.raspberryDesktop;
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Auto-Reconnect on Boot'),
          value: true,
          onChanged: (_) {},
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
        _actionTile('Check Firmware Update', Icons.system_update_alt, trailing: const Text('v1.2.5')),
        _actionTile('Restart Device', Icons.restart_alt),
        _actionTile('Factory Reset', Icons.delete_forever, color: Colors.red),
      ],
    );
  }

  Widget _actionTile(String title, IconData icon, {Widget? trailing, Color? color}) {
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

class AppSettingsTab extends StatefulWidget {
  final Function(ThemeMode) onThemeModeChanged;
  final ThemeMode initialThemeMode;

  const AppSettingsTab({
    super.key,
    required this.onThemeModeChanged,
    required this.initialThemeMode,
  });

  @override
  State<AppSettingsTab> createState() => _AppSettingsTabState();
}

class _AppSettingsTabState extends State<AppSettingsTab> {
  late String _theme;
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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
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
          onChanged: (v) => setState(() => _autoUpdate = v),
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
          onChanged: (v) => setState(() => _sendAnalytics = v),
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
          subtitle: Text('v0.9.1-beta'),
        ),
      ],
    );
  }
}
