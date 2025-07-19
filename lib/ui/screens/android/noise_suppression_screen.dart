import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class NoiseSuppressionScreen extends StatefulWidget {
  const NoiseSuppressionScreen({super.key});

  @override
  State<NoiseSuppressionScreen> createState() => _NoiseSuppressionScreenState();
}

class _NoiseSuppressionScreenState extends State<NoiseSuppressionScreen> {
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
    return Scaffold(
      body: ListView(
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
      ),
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
