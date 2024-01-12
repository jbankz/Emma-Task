import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wat_mobile/app/core/manager/session_manager.dart';
import 'package:wat_mobile/app/core/router/page_router.dart';
import 'package:wat_mobile/app/stack/app.locator.dart';
import 'package:wat_mobile/app/stack/app.router.dart';
import 'package:wat_mobile/ui/common/app_image.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initializeSplashScreen();
    });
  }

  Future<void> _initializeSplashScreen() async {
    try {
      locator<SessionManager>().isLoggedIn
          ? PageRouter.pushReplacement(Routes.dashboardView)
          : PageRouter.pushReplacement(Routes.signinView);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Image.asset(
            AppImage.store,
            height: 100.h,
            width: 100.w,
          ),
        ),
      );
}
