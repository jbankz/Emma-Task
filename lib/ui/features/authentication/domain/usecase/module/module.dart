import 'package:riverpod/riverpod.dart';
import 'package:wat_mobile/ui/features/authentication/data/service/module/module.dart';
import 'package:wat_mobile/ui/features/authentication/domain/usecase/signin_usecase.dart';

import '../../../../../../app/core/usecase/app_usecase.dart';
import '../signup_usecase.dart';

final signupUseCaseModule = Provider<WatUseCaseWithRequiredParam>(
    (ref) => SignupUseCaseImpl(authService: ref.read(authServiceModule)));

final signinUseCaseModule = Provider<WatUseCaseWithRequiredParam>(
    (ref) => SigninUseCaseImpl(authService: ref.read(authServiceModule)));
