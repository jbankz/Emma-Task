import 'package:dio/dio.dart';
import 'package:wat_mobile/app/core/manager/security_manager.dart';
import 'package:wat_mobile/app/stack/app.locator.dart';
import 'package:wat_mobile/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:wat_mobile/ui/features/authentication/domain/model/user_model.dart';

import '../../../../../app/core/manager/session_manager.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/service/auth_service.dart';
import '../dao/user_dao.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _repository;

  final _securedManager = locator<SecuredManager>();
  final _sessionManager = locator<SessionManager>();

  AuthServiceImpl({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<User> signup(
      {required AuthDto authDto, CancelToken? cancelToken}) async {
    final user =
        await _repository.signup(authDto: authDto, cancelToken: cancelToken);

    _securedManager
      ..storeEmailCred(authDto.email ?? '')
      ..storePasswordCred(authDto.password ?? '');

    _sessionManager.isLoggedIn = true;

    await userDao.save(user);
    return user;
  }

  @override
  Future<User> signin(
      {required AuthDto authDto, CancelToken? cancelToken}) async {
    _sessionManager.isLoggedIn = true;
    return await _repository.signin(authDto: authDto, cancelToken: cancelToken);
  }
}
