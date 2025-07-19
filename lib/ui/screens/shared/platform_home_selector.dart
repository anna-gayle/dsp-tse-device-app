import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import '../shared/loading_screen.dart';
import '../shared/unsupported_platform_screen.dart';
import '../windows/windows_shell.dart';
import '../android/android_shell.dart';

class PlatformHomeSelector extends StatefulWidget {
  final ThemeMode themeMode;
  final void Function(ThemeMode mode) onThemeChanged;

  const PlatformHomeSelector({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  State<PlatformHomeSelector> createState() => _PlatformHomeSelectorState();
}

class _PlatformHomeSelectorState extends State<PlatformHomeSelector> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate loading delay
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isInitialized = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) return const LoadingScreen();

    if (Platform.isAndroid) {
      return AndroidShell(
        initialThemeMode: widget.themeMode,           
        onThemeChanged: widget.onThemeChanged,        
      );
    }

    if (Platform.isWindows) {
      return WindowsShell(
        themeMode: widget.themeMode,
        onThemeChanged: widget.onThemeChanged,
      );
    }

    return const UnsupportedPlatformScreen();
  }
}
