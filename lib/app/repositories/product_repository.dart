import 'package:dio/dio.dart';
import 'package:shop_cart/app/api_exceptions/api_configuration.dart';
import 'package:shop_cart/app/helpers/dio_interceptor.dart';
import 'package:shop_cart/app/helpers/logger_helper.dart';

class ProductRepository {
  final APIConfigurations apiConfigurations;

  late Dio _dio;

  final Duration _requestTimeout = const Duration(minutes: 2);

  ProductRepository(this.apiConfigurations) {
    final options = BaseOptions(
      baseUrl: APIConfigurations.getBaseUrl(),
      connectTimeout: _requestTimeout,
      receiveTimeout: _requestTimeout,
      contentType: 'application/json',
    );

    _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor());
  }

  Future<String> getProducts() async {
    LoggerHelper.printInfo(
        'API End Point --> ${APIConfigurations.getProducts}');
    try {
      final response = await _dio.get(
        '${APIConfigurations.getProducts}',
        options: Options(responseType: ResponseType.plain),
      );
      LoggerHelper.printInfo('Success Getting Product Data: ${response.data}');

      return response.data ?? '';
    } catch (e) {
      LoggerHelper.printError('Error Getting Products: $e');
      rethrow;
    }
  }
}
