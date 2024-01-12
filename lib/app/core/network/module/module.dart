import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../http_client.dart';

final _dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: DioClient.connectTimeout),
      receiveTimeout: const Duration(milliseconds: DioClient.receiveTimeout),
      baseUrl: "http://localhost:3000/api"));

  dio.interceptors.add(PrettyDioLogger(
      requestHeader: kDebugMode,
      requestBody: kDebugMode,
      responseHeader: kDebugMode));

  return dio;
});

final dioClientProvider = Provider<DioClient>(
    (ref) => DioClient.internal(dio: ref.watch(_dioProvider)));
