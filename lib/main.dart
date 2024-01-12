import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wat_mobile/app/core/manager/session_manager.dart';

import 'app/config/app_config.dart';
import 'app/core/manager/hive_manager.dart';
import 'app/stack/app.locator.dart';
import 'app/stack/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.setAppEnv(kDebugMode ? AppEnv.staging : AppEnv.production);

  await dotenv.load(fileName: AppConfig.fileName);

  await setupLocator();
  await initializeDB();
  locator<SessionManager>().initilize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ProviderScope(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          child: OverlaySupport.global(
            child: MaterialApp(
              title: AppConfig.fileName,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(useMaterial3: false),
              themeMode: ThemeMode.light,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute,
            ),
          ),
        ),
      );
}
