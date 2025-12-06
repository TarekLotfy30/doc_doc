// ═══════════════════════════════════════════════════════════════
//  APPLICATION ENTRY POINT
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart'; 
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/doc_doc_app.dart';
import 'core/helpers/classes/app_logger.dart';
import 'core/helpers/functions/configure_system_ui.dart';
import 'core/helpers/functions/initialize_services.dart';

/// Sets up the environment, initializes services,
/// configures system UI, and launches the application
Future<void> main() async {
  // The "Preserve" Way (Recommended)
  // Splash ➔ Still Splash ➔ App UI

  // 1. Capture the Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // 2. PRESERVE: Tell the splash screen to wait for us.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Logger.info('Application starting...', 'main');

  // Run heavy async services (Splash screen stays visible during this time)
  await configureSystemUI();
  await initializeServices();

  // Run the application
  runApp(const DocDocApp());
  Logger.info('Application started successfully', 'main');
}
