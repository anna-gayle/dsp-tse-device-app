import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'ui/screens/shared/platform_home_selector.dart';

class SpeechEnhancerApp extends StatefulWidget {
  const SpeechEnhancerApp({super.key});

  @override
  State<SpeechEnhancerApp> createState() => _SpeechEnhancerAppState();
}

class _SpeechEnhancerAppState extends State<SpeechEnhancerApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech Enhancer',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: PlatformHomeSelector(
        themeMode: _themeMode,
        onThemeChanged: _setThemeMode,
      ),
    );
  }
}
