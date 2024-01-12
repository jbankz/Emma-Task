import 'package:dio/dio.dart';

import '../dto/auth_dto.dart';
import '../model/user_model.dart';

abstract class AuthService {
  Future<User> signup({required AuthDto authDto, CancelToken? cancelToken});
  Future<User> signin({required AuthDto authDto, CancelToken? cancelToken});
}
