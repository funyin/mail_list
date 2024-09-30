part of '../../di/di.dart';

Dio networkProvider() {
  var baseUrl = "https://mocki.io/";
  var dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
    followRedirects: false,
  ));
  dio.options.baseUrl = baseUrl;
  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
    );
  }
  return dio;
}
