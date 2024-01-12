import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wat_mobile/app/core/router/page_router.dart';
import 'package:wat_mobile/app/stack/app.logger.dart';
import 'package:wat_mobile/app/stack/app.router.dart';
import 'package:wat_mobile/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:wat_mobile/ui/features/authentication/presentation/notifier/module/auth_module.dart';

import '../../../../../utils/triggery_notification_tray.dart';
import '../state/auth_state.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  final logger = getLogger('AuthNotifier');

  @override
  AuthState build() => const AuthState();

  Future<void> signup(AuthDto authDto, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref.read(signupProvider
          .call(authDto: authDto, cancelToken: cancelToken)
          .future);
      PageRouter.pushReplacement(Routes.dashboardView);
    } catch (e) {
      logger.e(e.toString());
      triggerNotification(e.toString(), error: true);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> signIn(AuthDto authDto, [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      await ref.read(signinProvider
          .call(authDto: authDto, cancelToken: cancelToken)
          .future);

      PageRouter.pushReplacement(Routes.dashboardView);
    } catch (e) {
      logger.e(e.toString());
      triggerNotification(e.toString(), error: true);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }
}
