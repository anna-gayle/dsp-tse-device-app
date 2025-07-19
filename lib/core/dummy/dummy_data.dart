import '/../models/raspberry.dart';
import '/../models/host_system.dart';
import '/../models/analytics_data.dart';
import '/../models/app_message.dart';

import 'package:waveform_flutter/waveform_flutter.dart';
import 'dart:math';

class DummyData {
  // Raspberry Device (Desktop)
  static final raspberryDesktop = Raspberry(
    deviceName: 'Raspberry Pi 4 Model B',
    firmwareVersion: 'v1.2.5',
    systemConnectedTo: 'LAPTOP-XYZ123',
    modelUsed: 'Conv-TSE v1.3',
    uptime: Duration(hours: 5, minutes: 42),
    appVersion: '1.0.0-beta',
    lastSyncTime: '2025-07-18 15:30',
    isProcessing: true,
    storageUsed: 9.4,
    storageTotal: 32.0,
    connectionStatus: 'Connected',
  );

  // Raspberry Device (Mobile)
  static final raspberryMobile = Raspberry(
    deviceName: 'Raspberry Pi 4 Model B',
    firmwareVersion: 'v1.2.5',
    systemConnectedTo: 'Pixel 8 Pro',
    modelUsed: 'Conv-TSE v1.3',
    uptime: Duration(hours: 4, minutes: 12),
    appVersion: '1.0.0-beta',
    lastSyncTime: '2025-07-18 14:55',
    isProcessing: false,
    storageUsed: 11.8,
    storageTotal: 32.0,
    connectionStatus: 'Connected',
  );

  // Host System (Desktop)
  static final hostDesktop = HostSystem(
    deviceModel: 'LAPTOP-XYZ123',
    osVersion: 'Windows 11',
    connectionType: 'USB-C',
    inputDevice: 'Blue Yeti Microphone',
    usedByApp: 'Zoom',
    isCharging: true,
  );

  // Host System (Mobile)
  static final hostMobile = HostSystem(
    deviceModel: 'Pixel 8 Pro',
    osVersion: 'Android 14',
    connectionType: 'Bluetooth',
    inputDevice: 'Pixel Mic',
    usedByApp: 'Google Meet',
    isCharging: true,
  );

  // Audio
  static final Stream<Amplitude> fakeAudioStream = Stream.periodic(
    const Duration(milliseconds: 100),
    (count) {
      final random = Random();
      return Amplitude(current: random.nextDouble() * 100, max: 100);
    },
  ).asBroadcastStream();

  // Shared Analytics Data
  static final analyticsData = <AnalyticsDataPoint>[
    // CPU Usage
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 5)), value: 60, metric: 'CPU Usage', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 4)), value: 55, metric: 'CPU Usage', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 3)), value: 62, metric: 'CPU Usage', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 2)), value: 50, metric: 'CPU Usage', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 1)), value: 53, metric: 'CPU Usage', unit: '%'),

    // Clarity (SNR)
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 5)), value: 0.7, metric: 'Clarity', unit: 'SNR'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 4)), value: 0.8, metric: 'Clarity', unit: 'SNR'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 3)), value: 0.6, metric: 'Clarity', unit: 'SNR'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 2)), value: 0.9, metric: 'Clarity', unit: 'SNR'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 1)), value: 0.85, metric: 'Clarity', unit: 'SNR'),

    // Device CPU Usage (%)
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 5)), value: 45, metric: 'Device CPU', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 4)), value: 50, metric: 'Device CPU', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 3)), value: 48, metric: 'Device CPU', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 2)), value: 52, metric: 'Device CPU', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 1)), value: 49, metric: 'Device CPU', unit: '%'),

    // Device RAM Usage (%)
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 5)), value: 70, metric: 'Device RAM', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 4)), value: 72, metric: 'Device RAM', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 3)), value: 69, metric: 'Device RAM', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 2)), value: 75, metric: 'Device RAM', unit: '%'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 1)), value: 73, metric: 'Device RAM', unit: '%'),

    // Device Temperature (°C)
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 5)), value: 55, metric: 'Device Temp', unit: '°C'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 4)), value: 56, metric: 'Device Temp', unit: '°C'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 3)), value: 57, metric: 'Device Temp', unit: '°C'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 2)), value: 58, metric: 'Device Temp', unit: '°C'),
    AnalyticsDataPoint(timestamp: DateTime.now().subtract(const Duration(minutes: 1)), value: 59, metric: 'Device Temp', unit: '°C'),
  ];

  // Notifications
  static final messages = [
    AppMessage(
      title: 'Update Available',
      description: 'New firmware version 1.2.6 is ready to install.',
      type: MessageType.info,
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    AppMessage(
      title: 'Processing Started',
      type: MessageType.success,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    AppMessage(
      title: 'Connection Lost',
      description: 'Device disconnected unexpectedly.',
      type: MessageType.error,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
  ];
}
