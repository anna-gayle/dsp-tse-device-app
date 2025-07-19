import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return StylishBottomBar(
      backgroundColor: colorScheme.surface,
      option: AnimatedBarOptions(
        iconStyle: IconStyle.animated,
        barAnimation: BarAnimation.fade,
        iconSize: 24, 
      ),
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      items: [
        BottomBarItem(
          icon: Icon(Icons.dashboard_outlined, color: colorScheme.onSurface),
          selectedIcon: Icon(Icons.dashboard, color: colorScheme.primary),
          title: Text('Overview', style: TextStyle(color: colorScheme.onSurface)),
          selectedColor: colorScheme.primary,
        ),
        BottomBarItem(
          icon: Icon(Icons.graphic_eq_outlined, color: colorScheme.onSurface),
          selectedIcon: Icon(Icons.graphic_eq, color: Colors.teal),
          title: Text('DSP/TSE', style: TextStyle(color: colorScheme.onSurface)),
          selectedColor: Colors.teal,
        ),
        BottomBarItem(
          icon: Icon(Icons.bar_chart_outlined, color: colorScheme.onSurface),
          selectedIcon: Icon(Icons.bar_chart, color: Colors.indigo),
          title: Text('Analytics', style: TextStyle(color: colorScheme.onSurface)),
          selectedColor: Colors.indigo,
        ),
        BottomBarItem(
          icon: Icon(Icons.settings_outlined, color: colorScheme.onSurface),
          selectedIcon: Icon(Icons.settings, color: isDark ? Colors.grey[300] : Colors.grey[800]),
          title: Text('Settings', style: TextStyle(color: colorScheme.onSurface)),
          selectedColor: isDark ? Colors.grey[300]! : Colors.grey[800]!,
        ),
      ],
    );
  }
}
