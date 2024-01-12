import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wat_mobile/ui/features/onboarding/splash_view.dart';

import '../../ui/features/authentication/presentation/view/login/signin_view.dart';
import '../../ui/features/authentication/presentation/view/signup/signup_view.dart';
import '../../ui/features/dashboard/dashboard_view.dart';
import '../../ui/features/product/presentation/view/product_detail_view.dart';
import '../../ui/features/product/presentation/view/product_list_view.dart';
import '../core/manager/hive_manager.dart';
import '../core/manager/security_manager.dart';
import '../core/manager/session_manager.dart';

@StackedApp(
  routes: [
    CustomRoute(
        page: SplashView,
        opaque: false,
        initial: true,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SignupView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SigninView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ProductListView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ProductDetailView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: DashboardView,
        opaque: false,
        transitionsBuilder: TransitionsBuilders.fadeIn)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: FlutterSecureStorage),
    LazySingleton(classType: HiveManager),
    LazySingleton(classType: SecuredManager),
    LazySingleton(classType: SessionManager),
  ],
  logger: StackedLogger(),
)
class App {}
