import 'dart:math';
import 'package:flutter/material.dart';
import 'package:waveform_flutter/waveform_flutter.dart';

import '/../models/app_message.dart';
import '../widgets/overlay_message.dart';

class AudioVisualizer extends StatelessWidget {
  const AudioVisualizer({super.key});

  static Stream<Amplitude> get fakeAudioStream => Stream.periodic(
        const Duration(milliseconds: 100),
        (count) {
          final random = Random();
          final current = random.nextDouble() * 100;
          return Amplitude(current: current, max: 100);
        },
      ).asBroadcastStream();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OverlayMessage(
          message: AppMessage(
            title: "Microphone In Use",
            description: "An app is using your microphone.",
            type: MessageType.info,
            timestamp: DateTime.now(),
            dismissible: false,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          width: double.infinity,
          child: AnimatedWaveList(
            stream: fakeAudioStream,
          ),
        ),
      ],
    );
  }
}
