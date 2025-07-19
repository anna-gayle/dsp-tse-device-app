class HostSystem {
  final String deviceModel;
  final String osVersion;
  final String connectionType;
  final String inputDevice;
  final String usedByApp;
  final bool isCharging;

  HostSystem({
    required this.deviceModel,
    required this.osVersion,
    required this.connectionType,
    required this.inputDevice,
    required this.usedByApp,
    required this.isCharging,
  });
}
