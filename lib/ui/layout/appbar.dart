import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isConnected;
  final VoidCallback? onRefresh;

  const MobileAppBar({
    super.key,
    required this.isConnected,
    this.onRefresh,
  });

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MobileAppBarState extends State<MobileAppBar> {
  bool _powerOn = true;

  void _togglePower() {
    setState(() => _powerOn = !_powerOn);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _powerOn ? 'Noise Suppression Active' : 'Noise Suppression Inactive',
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: _powerOn ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final statusColor = widget.isConnected ? colorScheme.primary : colorScheme.error;
    final statusText = widget.isConnected ? 'Connected' : 'Disconnected';

    return AppBar(
      backgroundColor: colorScheme.surface,
      elevation: 2,
      centerTitle: false,
      titleSpacing: 0,
      title: Row(
        children: [
          const SizedBox(width: 8),
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              'assets/images/raspberry-pi.svg',
              fit: BoxFit.contain,
              color: colorScheme.primary, 
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'App Interface',
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),
          Icon(
            widget.isConnected ? Icons.check_circle_rounded : Icons.cancel_rounded,
            size: 18,
            color: statusColor,
          ),
          const SizedBox(width: 4),
          Text(
            statusText,
            style: theme.textTheme.bodySmall?.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: widget.onRefresh,
            icon: Icon(Icons.refresh, color: colorScheme.onSurface),
            tooltip: 'Refresh',
          ),
          IconButton(
            onPressed: _togglePower,
            icon: Icon(
              Icons.power_settings_new,
              color: _powerOn ? Colors.green : Colors.red,
            ),
            tooltip: _powerOn ? 'Power On' : 'Power Off',
          ),
        ],
      ),
    );
  }
}
