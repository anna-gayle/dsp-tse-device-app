import 'package:flutter/material.dart';

import '../../layout/sidebar.dart';
import 'dashboard_screen.dart';
import 'settings_screen.dart';

class WindowsShell extends StatefulWidget {
  final ThemeMode themeMode;
  final void Function(ThemeMode mode) onThemeChanged;

  const WindowsShell({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  State<WindowsShell> createState() => _WindowsShellState();
}

class _WindowsShellState extends State<WindowsShell> {
  int _selectedIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const DashboardScreen();
      case 1:
        return SettingsPage(
          toggleTheme: widget.onThemeChanged,
          initialThemeMode: widget.themeMode,
        );
      default:
        return const Center(child: Text('Page not found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppSidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            extended: true, 
          ),
          Expanded(
            child: _getPage(_selectedIndex),
          ),
        ],
      ),
    );
  }
}
