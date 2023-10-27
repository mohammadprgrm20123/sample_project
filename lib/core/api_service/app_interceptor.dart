import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/base_error_message.dart';


@injectable
class AppInterceptor extends Interceptor {
  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    handler.next(options);
  }

  @override
  void onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    if (err.response == null) {
      final BaseErrorMessage errorModel = BaseErrorMessage(
        error: 'Connecting timed out. Please check your network',
      );
      final response = Response(
        requestOptions: RequestOptions(path: ''),
        data: errorModel.toJson(),
        statusCode: 400,
      );

      super.onError(
        err.copyWith(response: response),
        handler,
      );
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(
      final Response response, final ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
