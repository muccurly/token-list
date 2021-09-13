import 'package:dio/dio.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  static ApiClient get instance => _instance;

  static final BaseOptions _options = BaseOptions(
    connectTimeout: 35000,
    receiveTimeout: 34000,
  );

  static final InterceptorsWrapper _baseInterceptors = InterceptorsWrapper(
    onResponse: (response, handler) {
      MyLogger.instance.log.d(response);
      return handler.next(response);
    },
    onError: (error, handler) async {
      MyLogger.instance.log.e('Dio error type: ${error.type}'
          '\nerror message: ${error.message}'
          '\nresponse data: ${error.response?.data}');
      return handler.next(error);
    },
  );

  Dio vmDio = Dio()
    ..options = _options.copyWith(
      baseUrl:
          '${EnvironmentConfig.API_URL_VM}/${EnvironmentConfig.API_VERSION}',
      headers: Map.from(_options.headers)..remove(Headers.contentTypeHeader),
    )
    ..interceptors.add(_baseInterceptors);
  Dio dmDio = Dio()
    ..options = _options.copyWith(
      baseUrl:
          '${EnvironmentConfig.API_URL_DM}/${EnvironmentConfig.API_VERSION}',
      headers: Map.from(_options.headers)..remove(Headers.contentTypeHeader),
    )
    ..interceptors.add(_baseInterceptors);
  Dio umDio = Dio()
    ..options = _options.copyWith(
      baseUrl:
          '${EnvironmentConfig.API_URL_UM}/${EnvironmentConfig.API_VERSION}',
      headers: Map.from(_options.headers)..remove(Headers.contentTypeHeader),
    )
    ..interceptors.add(_baseInterceptors);
  Dio gmDio = Dio()
    ..options = _options.copyWith(
      baseUrl:
          '${EnvironmentConfig.API_URL_GM}/${EnvironmentConfig.API_VERSION}',
      headers: Map.from(_options.headers)..remove(Headers.contentTypeHeader),
    )
    ..interceptors.add(_baseInterceptors);

  Dio fmDio = Dio()
    ..options = _options.copyWith(
      baseUrl:
          '${EnvironmentConfig.API_URL_FM}/${EnvironmentConfig.API_VERSION}',
      headers: Map.from(_options.headers)..remove(Headers.contentTypeHeader),
    )
    ..interceptors.add(_baseInterceptors);
}
