class Raspberry {
  final String deviceName;
  final String connectionStatus;
  final String systemConnectedTo;
  final String firmwareVersion;
  final Duration uptime;
  final String appVersion;
  final String lastSyncTime;
  final String modelUsed;
  final bool isProcessing;
  final double storageUsed;
  final double storageTotal;

  Raspberry({
    required this.deviceName,
    required this.connectionStatus,
    required this.systemConnectedTo,
    required this.firmwareVersion,
    required this.uptime,
    required this.appVersion,
    required this.lastSyncTime,
    required this.modelUsed,
    required this.isProcessing,
    required this.storageUsed,
    required this.storageTotal,
  });

  String get formattedUptime =>
      '${uptime.inHours}h ${uptime.inMinutes.remainder(60)}m';

  String get storageLabel =>
      '${storageUsed.toStringAsFixed(1)} GB / ${storageTotal.toStringAsFixed(1)} GB';

  double get storagePercentage =>
      storageTotal == 0 ? 0 : storageUsed / storageTotal;

  bool get isConnected => connectionStatus.toLowerCase() == 'connected';
}
