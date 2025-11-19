import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/di/register_dependencies.dart';
import '../core/responsive/app_screen_util.dart';
import '../core/routing/app_router.dart';
import '../core/routing/app_routes_name.dart';

class DocDocApp extends StatelessWidget {
  const DocDocApp({super.key});

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
      ),
    );
  }
}
