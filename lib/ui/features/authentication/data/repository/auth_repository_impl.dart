import 'package:dio/dio.dart';
import 'package:wat_mobile/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:wat_mobile/ui/features/authentication/domain/model/user_model.dart';

import '../../domain/repository/auth_repository.dart';
import '../source/auth_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSource _source;

  AuthRepositoryImpl({required AuthSource source}) : _source = source;

  @override
  Future<User> signup(
          {required AuthDto authDto, CancelToken? cancelToken}) async =>
      await _source.signup(authDto: authDto, cancelToken: cancelToken);

  @override
  Future<User> signin(
          {required AuthDto authDto, CancelToken? cancelToken}) async =>
      await _source.signin(authDto: authDto, cancelToken: cancelToken);
}
