// ═══════════════════════════════════════════════════════════════
// Configure system UI appearance
// ═══════════════════════════════════════════════════════════════
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../classes/app_logger.dart';

/// This function sets application's system-level UI appearance and behavior,
/// including status bar styling, navigation bar appearance, and  orientation
/// preferences. It should be called early in the application lifecycle.
// translate-me-ignore-all-file
Future<void> configureSystemUI() async {
  const String tag = 'SystemUIConfiguration';
  const String configurationMessage = 'Configuring system UI...';

  Logger.info(configurationMessage, tag);

  try {
    // These operations have dependencies - they must run in sequence
    await _configurePlatformSpecificUI(); // Sets initial UI style
    await _configureSystemOverlays(); // Builds on previous configuration
    await _configureScreenOrientation(); // Final configuration step

    Logger.success('System UI configured successfully', tag);
  } catch (error, stackTrace) {
    Logger.error(
      'Error configuring system UI: $error\nStack trace: $stackTrace',
      tag,
    );
    rethrow;
  }
}

/// Configures platform-specific system UI overlay styles
Future<void> _configurePlatformSpecificUI() async {
  const String tag = 'SystemUIConfiguration';

  if (Platform.isAndroid) {
    Logger.debug('Configuring Android system UI overlay style', tag);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // Status bar configuration
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,

        // Navigation bar configuration
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  } else if (Platform.isIOS) {
    Logger.debug('Configuring iOS system UI overlay style', tag);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // iOS specific status bar configuration
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        // iOS navigation bar configuration
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

/// Configures system UI overlays for edge-to-edge display
Future<void> _configureSystemOverlays() async {
  const String tag = 'SystemUIConfiguration';

  Logger.debug('Configuring system UI overlays', tag);

  // Enable edge-to-edge mode for immersive experience
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Apply overlay style for edge-to-edge display
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

/// Configures preferred screen orientations
Future<void> _configureScreenOrientation() async {
  const String tag = 'SystemUIConfiguration';

  Logger.debug('Configuring screen orientations', tag);

  // Set preferred orientations to portrait modes only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Enable manual system UI mode with specific overlays
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  Logger.debug('Screen orientation configuration completed', tag);
}
