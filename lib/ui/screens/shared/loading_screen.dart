import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatelessWidget {
  final String message;

  const LoadingScreen({
    super.key,
    this.message = 'Initializing Device\nand Loading Configurations...',
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Platform.isWindows;

    final displayMessage = isDesktop
        ? 'Initializing Device and Loading Configurations...'
        : message;

    final color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Raspberry Pi SVG Logo
            SvgPicture.asset(
              'assets/images/raspberry-pi.svg',
              height: isDesktop ? 100 : 80,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: 24),

            // Loading Text
            Text(
              displayMessage,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Small Fading Circle Loader
            SpinKitFadingCircle(
              color: color,
              size: isDesktop ? 40.0 : 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
