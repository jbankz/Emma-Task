import 'package:dio/dio.dart';
import 'package:wat_mobile/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:wat_mobile/ui/features/authentication/domain/model/user_model.dart';
import 'package:wat_mobile/ui/features/authentication/domain/service/auth_service.dart';

import '../../../../../app/core/usecase/app_usecase.dart';

class SignupUseCaseImpl extends WatUseCaseWithRequiredParam<AuthDto, User> {
  final AuthService _authService;

  SignupUseCaseImpl({required AuthService authService})
      : _authService = authService;

  @override
  Future<User?> execute(
          {required AuthDto parameter, CancelToken? cancelToken}) async =>
      await _authService.signup(authDto: parameter, cancelToken: cancelToken);
}
