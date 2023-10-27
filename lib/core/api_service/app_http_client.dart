import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../domain/failure_entity.dart';
import 'api_endpoints.dart';

class AppHttpClient {
  final Dio dio;
  final Left<String, Response<T>> Function<T>(
    DioException dioError,
  )? exceptionHandler;

  AppHttpClient({
    final String baseUrl = 'http://example.com/',
    final List<Interceptor> interceptors = const [],
    this.exceptionHandler,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: ApiEndPoints.baseUrl,
            connectTimeout: const Duration(milliseconds: 20000),
            receiveTimeout: const Duration(milliseconds: 20000),
          ),
        ) {
    if (interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  Future<Either<FailureEntity, Response<T>>> get<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final dynamic data,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.get<T>(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Future<Either<FailureEntity, Response<T>>> post<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.post<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Future<Either<FailureEntity, Response<T>>> put<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.put<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Future<Either<FailureEntity, Response<T>>> patch<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.patch<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Future<Either<FailureEntity, Response<T>>> delete<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
  }) async {
    try {
      final res = await dio.delete<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Left<FailureEntity, Response<T>> _handleException<T>(
      final DioException dioError,
      ) => _defaultExceptionHandler(dioError);

  Left<FailureEntity, Response<T>> _defaultExceptionHandler<T>(
      final DioException dioError,
      ) =>
      Left(
        dioError.response != null &&
            dioError.response!.data is Map<String, dynamic>
            ? FailureEntity.fromJson(
          dioError.response!.data,
          dioError.response!.statusCode,
        )
            : FailureEntity.empty(),
      );
  String get defaultErrorMessage => 'something Went Wrong';
}
