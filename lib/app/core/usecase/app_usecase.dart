import 'package:dio/dio.dart';

abstract class WatUseCaseWithOutParam<T> {
  T execute([CancelToken? cancelToken]);
}

abstract class WatUseCaseWithOptionalParam<TInput, TReturn> {
  Future<TReturn?> execute({TInput? parameter, CancelToken? cancelToken});
}

abstract class WatUseCaseWithRequiredParam<TInput, TReturn> {
  Future<TReturn?> execute(
      {required TInput parameter, CancelToken? cancelToken});
}
