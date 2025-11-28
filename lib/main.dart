// ═══════════════════════════════════════════════════════════════
//  APPLICATION ENTRY POINT
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

import 'app/doc_doc_app.dart';
import 'core/helpers/classes/app_logger.dart';
import 'core/helpers/functions/configure_system_ui.dart';
import 'core/helpers/functions/initialize_services.dart';

/// Sets up the environment, initializes services,
/// configures system UI, and launches the application
Future<void> main() async {
  // Initialize Flutter binding before calling native code
  WidgetsFlutterBinding.ensureInitialized();
  Logger.info('Application starting...', 'main');

  await configureSystemUI();
  await initializeServices();

  // Run the application
  runApp(const DocDocApp());
  Logger.info('Application started successfully', 'main');
}
