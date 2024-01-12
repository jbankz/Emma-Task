//signupUseCaseModule

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wat_mobile/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:wat_mobile/ui/features/authentication/domain/model/user_model.dart';

import '../../../domain/usecase/module/module.dart';

part 'auth_module.g.dart';

@riverpod
Future<User> signup(SignupRef ref,
        {required AuthDto authDto, CancelToken? cancelToken}) async =>
    await ref
        .read(signupUseCaseModule)
        .execute(parameter: authDto, cancelToken: cancelToken);

@riverpod
Future<User> signin(SigninRef ref,
        {required AuthDto authDto, CancelToken? cancelToken}) async =>
    await ref
        .read(signinUseCaseModule)
        .execute(parameter: authDto, cancelToken: cancelToken);
