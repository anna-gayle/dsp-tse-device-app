import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/../models/app_message.dart'; 

class OverlayMessage extends StatelessWidget {
  final AppMessage message;
  final VoidCallback? onDismiss;

  const OverlayMessage({
    super.key,
    required this.message,
    this.onDismiss,
  });

  IconData _getIcon(MessageType type) {
    switch (type) {
      case MessageType.success:
        return FontAwesomeIcons.circleCheck;
      case MessageType.warning:
        return FontAwesomeIcons.triangleExclamation;
      case MessageType.error:
        return FontAwesomeIcons.circleXmark;
      case MessageType.info:
        return FontAwesomeIcons.circleInfo;
    }
  }

  Color _getColor(BuildContext context, MessageType type) {
    final scheme = Theme.of(context).colorScheme;
    switch (type) {
      case MessageType.success:
        return Colors.green;
      case MessageType.warning:
        return Colors.orange;
      case MessageType.error:
        return Colors.red;
      case MessageType.info:
        return scheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final icon = _getIcon(message.type);
    final color = _getColor(context, message.type);

    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withAlpha(25), // soft translucent background
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            FaIcon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                  ),
                  if (message.description != null)
                    Text(
                      message.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                ],
              ),
            ),
            if (message.dismissible && onDismiss != null)
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onDismiss,
                color: color,
                tooltip: 'Dismiss',
              ),
          ],
        ),
      ),
    );
  }
}
