import 'package:dio/dio.dart';
import 'package:stock_watchlist/common/network/api_config.dart';

class ApiClient {
  final Dio dio = createDio();

  ApiClient._internal();

  static final _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: APiConfig.baseUrl,
      receiveTimeout: const Duration(milliseconds: 15000),
      connectTimeout: const Duration(milliseconds: 15000),
      sendTimeout: const Duration(milliseconds: 15000),
    ));

    return dio;
  }
}
