enum MessageType { info, success, warning, error }

class AppMessage {
  final String title;
  final String? description;
  final MessageType type;
  final DateTime timestamp;
  final bool dismissible;

  const AppMessage({
    required this.title,
    this.description,
    required this.type,
    required this.timestamp,
    this.dismissible = true,
  });
}
