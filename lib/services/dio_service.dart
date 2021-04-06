import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../utils/constants.dart';

class DioService {
  static Dio _dio;
  static final options = CacheOptions(
    store: DbCacheStore(databasePath: 'jurta_test_db_cache'),
    policy: CachePolicy.request,
    // hitCacheOnErrorExcept: [401, 403],
    // priority: CachePriority.normal,
    // maxStale: const Duration(days: 7),
  );

  static Dio getDio({String token}) {
    if (null == _dio) {
      _dio = Dio(
        BaseOptions(
          baseUrl: '$BASE_URL',
          connectTimeout: 30000,
          receiveTimeout: 30000,
          sendTimeout: 30000,
          // contentType: "application/json; charset=utf-8",
        ),
      )
        ..interceptors.add(DioCacheInterceptor(options: options))
        ..interceptors.add(LogInterceptor(responseBody: false));
    }

    return _dio;
  }

  static resetDio() {
    _dio?.clear();
    _dio?.close();
    _dio = null;
  }
}
