import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppSidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final bool extended;

  const AppSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.extended = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget buildItem({
      required IconData icon,
      required String label,
      required int index,
    }) {
      final isSelected = selectedIndex == index;
      final backgroundColor =
          isSelected ? colorScheme.primary.withAlpha(25) : Colors.transparent;
      final textColor = isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant;

      return InkWell(
        onTap: () => onItemSelected(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          color: backgroundColor,
          child: Row(
            children: [
              Icon(icon, color: textColor, size: 20),
              if (extended) ...[
                const SizedBox(width: 12),
                Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return Container(
      width: extended ? 240 : 72,
      color: Theme.of(context).colorScheme.surface, // No rounded border
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: extended
                ? Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/raspberry-pi.svg',
                        height: 32,
                        width: 32,
                        colorFilter: ColorFilter.mode(
                          colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'App Interface',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: SvgPicture.asset(
                      'assets/images/raspberry-pi.svg',
                      height: 32,
                      width: 32,
                      colorFilter: ColorFilter.mode(
                        colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 12),
          buildItem(icon: FontAwesomeIcons.gauge, label: 'Dashboard', index: 0),
          buildItem(icon: FontAwesomeIcons.gear, label: 'Settings', index: 1),
        ],
      ),
    );
  }
}
