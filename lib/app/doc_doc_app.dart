import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/di/register_dependencies.dart';
import '../core/responsive/app_screen_util.dart';
import '../config/routing/app_router.dart';
import '../config/routing/app_routes_name.dart';
import '../core/theme/app_theme_factory.dart';

class DocDocApp extends StatefulWidget {
  const DocDocApp({super.key});

  @override
  State<DocDocApp> createState() => _DocDocAppState();
}

class _DocDocAppState extends State<DocDocApp> {
  @override
  void initState() {
    super.initState();
    // 1. Hook into the Widgets Binding
    // This function will execute ONLY after the widget has been built
    // and rendered once.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 2. REMOVE: Fade out the native splash screen smoothly
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppScreenUtil.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) =>
            getIt<AppRouter>().generateRoute(settings),
        initialRoute: AppRoutesName.onboardingView,
        theme: AppThemeFactory.lightTheme.materialTheme,
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
