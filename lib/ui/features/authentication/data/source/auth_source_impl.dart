import 'package:dio/dio.dart';
import 'package:wat_mobile/app/core/network/http_client.dart';
import 'package:wat_mobile/app/stack/app.locator.dart';
import 'package:wat_mobile/ui/features/authentication/data/dao/user_dao.dart';
import 'package:wat_mobile/ui/features/authentication/domain/dto/auth_dto.dart';

import '../../../../../app/core/manager/security_manager.dart';
import '../../domain/model/user_model.dart';
import 'auth_source.dart';

class AuthSourceImpl implements AuthSource {
  // ignore: unused_field
  final DioClient _dioClient;
  final _securedManager = locator<SecuredManager>();

  AuthSourceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<User> signup(
      {required AuthDto authDto, CancelToken? cancelToken}) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return User.fromJson(authDto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> signin(
      {required AuthDto authDto, CancelToken? cancelToken}) async {
    try {
      /// Delay for 3 seconds
      await Future.delayed(const Duration(seconds: 3));

      /// Retrieve user credentials
      final String storedEmail = await _securedManager.readEmailCred();
      final String storedPassword = await _securedManager.readPasswordCred();

      /// Validate user credentials
      if (userDao.user.email == null ||
          storedEmail != authDto.email ||
          storedPassword != authDto.password) {
        throw Exception('Invalid credential');
      }

      return User.fromJson(authDto.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
