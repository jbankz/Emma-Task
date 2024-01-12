import 'package:dio/dio.dart';

import '../../domain/dto/auth_dto.dart';
import '../../domain/model/user_model.dart';

abstract class AuthSource {
  Future<User> signup({required AuthDto authDto, CancelToken? cancelToken});
  Future<User> signin({required AuthDto authDto, CancelToken? cancelToken});
}
