// ═══════════════════════════════════════════════════════════════
// SERVICE LOCATOR SETUP
// ═══════════════════════════════════════════════════════════════

import 'package:get_it/get_it.dart';

import '../helpers/classes/app_logger.dart';
import '../routing/app_router.dart';

/// This global instance of GetIt provides centralized dependency management
/// following the Inversion of Control principle.
// translate-me-ignore-all-file
final getIt = GetIt.instance;

/// Initializes and registers all application services and dependencies
///
/// This function should be called before `runApp()` to ensure all dependencies
/// are available throughout the application lifecycle.
Future<void> registerDependencies() async {
  const String tag = 'DEPENDENCY_INJECTION';
  Logger.info('Initializing service locator...', tag);
  try {
    // ================ Register Connectivity Plugin ===========================
    await _registerConnectivityService();

    // ================ Register Navigation Router =============================
    await _registerNavigationRouter();

    // ================ Register Local Storage ================================
    await _registerLocalStorage();

    // ================ Register API Consumer ================================
    await _registerApiConsumer();

    // ================ Register Repositories ================================
    await _registerRepositories();

    // ================ Register State Management ============================
    await _registerStateManagement();

    Logger.success('✅ Dependency injection completed successfully', tag);
  } catch (error) {
    Logger.error('❌ Dependency injection failed: $error', tag);
    rethrow;
  }
}

/// Registers connectivity-related services
Future<void> _registerConnectivityService() async {
  // const String loggerTag = 'DEPENDENCY_INJECTION';

  // Logger.debug('Registering Connectivity...', loggerTag);
  // getIt.registerLazySingleton<Connectivity>(Connectivity.new);
  // Logger.success('Connectivity registered successfully.', loggerTag);

  // Logger.debug('Registering ConnectivityService...', loggerTag);
  // getIt.registerLazySingleton<ConnectivityService>(
  //   () => ConnectivityService(getIt<Connectivity>()),
  // );
  // Logger.success('ConnectivityService registered successfully.', loggerTag);
}

/// Registers navigation and routing services
Future<void> _registerNavigationRouter() async {
  const String loggerTag = 'DEPENDENCY_INJECTION';

  Logger.debug('Registering AppRouter...', loggerTag);
  getIt.registerSingleton<AppRouter>(AppRouter());
  Logger.success('AppRouter registered successfully.', loggerTag);
}

/// Registers local storage and persistence services
Future<void> _registerLocalStorage() async {
  // const String loggerTag = 'DEPENDENCY_INJECTION';

  // Logger.debug('Registering SharedPreferences...', loggerTag);
  // final SharedPreferences sharedPreferences =
  //     await SharedPreferences.getInstance();
  // getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  // getIt.registerSingleton<LocalHelper>(LocalHelper(sharedPreferences));
  // Logger.success('LocalHelper registered successfully', loggerTag);
}

/// Registers API consumer and HTTP client services
Future<void> _registerApiConsumer() async {
  // const String loggerTag = 'DependencyInjection';

  // Logger.debug('Registering API Consumer...', loggerTag);
  // getIt.registerSingleton<IApiConsumer>(DioConsumer());
  // Logger.success('API Consumer registered successfully', loggerTag);
}

/// Registers repository layer services
///
/// Time Complexity: O(1)
/// Space Complexity: O(1)
Future<void> _registerRepositories() async {
  // const String loggerTag = 'DEPENDENCY_INJECTION';

  // Logger.info('Setting up repositories...', loggerTag);

  // Register authentication repository
  // getIt.registerLazySingleton<IRegisterRepo>(
  //   () => RegisterRepoImpl(getIt<IApiConsumer>()),
  // );
  // Logger.success('RegisterRepo registered successfully', _loggerTag);

  // Register user repository
  // getIt.registerLazySingleton<IUserRepo>(
  //   () => UserRepoImpl(getIt<IApiConsumer>(), getIt<LocalHelper>()),
  // );
  // Logger.success('UserRepo registered successfully', _loggerTag);

  // Register other repositories as needed
  //Logger.success('Repositories setup completed', loggerTag);
}

/// Registers state management services
Future<void> _registerStateManagement() async {
  // const String loggerTag = 'DEPENDENCY_INJECTION';

  // Logger.debug('Registering state management services...', loggerTag);

  // // Register BLoC/Cubit instances
  // // getIt.registerFactory<AuthCubit>(
  // //   () => AuthCubit(getIt<IAuthRepo>()),
  // // );
  // // Logger.success('AuthCubit registered successfully', _loggerTag);

  // // Add other state management services as needed

  // Logger.success(
  //   'State management services registered successfully',
  //   loggerTag,
  // );
}

// Get instances of DioHelper and LocalHelper
//   final dioHelper1 = getIt<DioHelper>();
//   final dioHelper2 = getIt<DioHelper>();

//   final localHelper1 = getIt<LocalHelper>();
//   final localHelper2 = getIt<LocalHelper>();

// Print the hash codes of the instances
//   print('DioHelper Instance 1: ${dioHelper1.hashCode}');
//   print('DioHelper Instance 2: ${dioHelper2.hashCode}');
//print('Are DioHelper the same? ${identical(dioHelper1, dioHelper2)}');

//   print('LocalHelper Instance 1: ${localHelper1.hashCode}');
//   print('LocalHelper Instance 2: ${localHelper2.hashCode}');
//rint('Are LocalHelper  the same? ${identical(localHelper1, localHelper2)}');
// }
