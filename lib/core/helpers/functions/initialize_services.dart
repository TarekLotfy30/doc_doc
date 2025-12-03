// ═══════════════════════════════════════════════════════════════
// INITIALIZE ALL REQUIRED SERVICES
// ═══════════════════════════════════════════════════════════════

import 'package:easy_localization/easy_localization.dart';

import '../../../config/di/register_dependencies.dart';
import '../classes/app_logger.dart';

/// Initializes all required application services and dependencies
///
/// This function orchestrates the initialization of core services including
/// BLoC observer, localization, and dependency injection. It should be called
/// before running the main application to ensure all services are properly
/// configured and available throughout the application lifecycle.
// translate-me-ignore-all-file
Future<void> initializeServices() async {
  const String tag = 'ServiceInitialization';
  const String initializationMessage = 'Initializing application services...';

  Logger.info(initializationMessage, tag);

  try {
    // Initialize core application services first (synchronous)
    await _initializeCoreServices();

    // Initialize other services concurrently for better performance
    await Future.wait([
      _initializeThirdPartyServices(),
      _initializeLocalization(),
      _registerApplicationDependencies(),
    ]);

    Logger.success('All services initialized successfully', tag);
  } catch (error, stackTrace) {
    Logger.error(
      'Service initialization failed: $error\nStack trace: $stackTrace',
      tag,
    );
    rethrow;
  }
}

/// Initializes core application services
Future<void> _initializeCoreServices() async {
  const String tag = 'ServiceInitialization';

  Logger.debug('Initializing core services...', tag);

  // Initialize BLoC observer for state management debugging
  //Bloc.observer = MyBlocObserver();
  Logger.success('BLoC observer initialized', tag);
}

/// Initializes third-party services (Firebase, Messaging, etc.)
Future<void> _initializeThirdPartyServices() async {
  const String tag = 'ServiceInitialization';

  Logger.debug('Initializing third-party services...', tag);

  // Initialize Firebase services (currently commented out)
  // await _initializeFirebase();
  // Logger.info('Firebase initialized', _loggerTag);

  // Initialize Firebase Messaging (currently commented out)
  // await _initializeFirebaseMessaging();
  // Logger.info('Firebase Messaging initialized', _loggerTag);

  // Initialize location services (currently commented out)
  // await _initializeLocationServices();
  // Logger.info('Location services initialized', _loggerTag);

  Logger.debug('Third-party services initialization completed', tag);
}

/// Initializes localization services using EasyLocalization
Future<void> _initializeLocalization() async {
  const String tag = 'ServiceInitialization';

  Logger.debug('Initializing localization services...', tag);

  // Ensure EasyLocalization is properly initialized
  await EasyLocalization.ensureInitialized();

  Logger.success('Localization services initialized', tag);
}

/// Registers all application dependencies using GetIt
Future<void> _registerApplicationDependencies() async {
  const String tag = 'ServiceInitialization';

  Logger.debug('Registering application dependencies...', tag);

  // Register all application dependencies
  await registerDependencies();

  Logger.success('Application dependencies registered', tag);
}
