// ═══════════════════════════════════════════════════════════════
// SERVICE LOCATOR SETUP
// ═══════════════════════════════════════════════════════════════

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../../core/helpers/classes/app_logger.dart';
import '../../features/auth/controller/sign_in_cubit/sign_in_cubit.dart';
import '../../features/auth/controller/sign_up_cubit/sign_up_cubit.dart';
import '../../features/auth/data/repo/sign_in/i_sign_in_repo.dart';
import '../../features/auth/data/repo/sign_in/sign_in_repo_impl.dart';
import '../../features/auth/data/repo/sign_up/i_sign_up_repo.dart';
import '../../features/auth/data/repo/sign_up/sign_up_repo_impl.dart';
import '../connection/connectivity_interceptor.dart';
import '../connection/connectivity_service.dart';
import '../routing/app_router.dart';
import '../services/network/dio_consumer.dart';
import '../services/network/i_api_consumer.dart';

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

    Logger.success('Dependency injection completed successfully', tag);
  } catch (error) {
    Logger.error('Dependency injection failed: $error', tag);
    rethrow;
  }
}

/// Registers connectivity-related services
Future<void> _registerConnectivityService() async {
  const String loggerTag = 'DEPENDENCY_INJECTION';

  getIt.registerLazySingleton<Connectivity>(Connectivity.new);

  getIt.registerLazySingleton<ConnectivityService>(
    () => ConnectivityService(getIt<Connectivity>()),
  );

  getIt.registerLazySingleton<ConnectivityInterceptor>(
    () => ConnectivityInterceptor(getIt<ConnectivityService>()),
  );
  Logger.success('ConnectivityService registered successfully.', loggerTag);
}

/// Registers navigation and routing services
Future<void> _registerNavigationRouter() async {
  const String loggerTag = 'DEPENDENCY_INJECTION';

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
  const String loggerTag = 'DependencyInjection';

  getIt.registerSingleton<IApiConsumer>(DioConsumer());
  Logger.success('API Consumer registered successfully', loggerTag);
}

/// Registers repository layer services
Future<void> _registerRepositories() async {
  const String loggerTag = 'DEPENDENCY_INJECTION';

  // Register SignIn repository
  getIt.registerLazySingleton<ISignInRepo>(
    () => SignInRepoImpl(getIt<IApiConsumer>()),
  );

  // Register SignUp repository
  getIt.registerLazySingleton<ISignUpRepo>(
    () => SignUpRepoImpl(getIt<IApiConsumer>()),
  );

  Logger.success('Repositories setup completed', loggerTag);
}

/// Registers state management services
Future<void> _registerStateManagement() async {
  const String loggerTag = 'DEPENDENCY_INJECTION';

  // Register SignInCubit
  getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt<ISignInRepo>()));

  // Register SignUpCubit
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<ISignUpRepo>()));

  Logger.success(
    'State management services registered successfully',
    loggerTag,
  );
}
