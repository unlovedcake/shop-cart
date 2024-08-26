import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shop_cart/app/helpers/logger_helper.dart';

class DioInterceptor extends Interceptor {
  static const String authHeader = "Authorization";
  static const String sessionExpirationTime = "X-NX-Session-Expiration-Time";

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //String? authToken = 'token123345';

    options.headers = {
      ...options.headers,
      //authHeader: 'Bearer $authToken',
      //"Ocp-Apim-Subscription-Key": "f3afff9001fd47ea9ea6e11255d8445c"
    };
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LoggerHelper.printInfo('Response: $response');
    return handler.next(response);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      //Todo: handle http errors.
      if (err.error.toString().contains('SocketException')) {
        log('No internet: ${err.error}');
        return handler.next(err);
      }
    } on Exception {
      return handler.next(err);
    }
  }
}
