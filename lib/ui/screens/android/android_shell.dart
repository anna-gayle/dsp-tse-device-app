import 'package:flutter/material.dart';

import 'overview_screen.dart';
import 'noise_suppression_screen.dart';
import 'analytics_screen.dart';
import 'mobile_settings_screen.dart';
import '../../layout/appbar.dart';
import '../../layout/bottom_nav.dart'; 

class AndroidShell extends StatefulWidget {
  final ThemeMode initialThemeMode;
  final Function(ThemeMode) onThemeChanged;

  const AndroidShell({
    super.key,
    required this.initialThemeMode,
    required this.onThemeChanged,
  });

  @override
  State<AndroidShell> createState() => _AndroidShellState();
}

class _AndroidShellState extends State<AndroidShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isConnected = true;

    return Scaffold(
      appBar: MobileAppBar(
        isConnected: isConnected,
        onRefresh: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Refreshing...')),
          );
        },
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const OverviewScreen(),
          const NoiseSuppressionScreen(),
          const AnalyticsScreen(),
          MobileSettingsScreen(
            initialThemeMode: widget.initialThemeMode,
            onThemeModeChanged: widget.onThemeChanged,
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
