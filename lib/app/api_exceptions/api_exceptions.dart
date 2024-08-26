import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop_cart/app/helpers/logger_helper.dart';

class DioExceptions implements Exception {
  String message = "";
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = ApiMessageException.requestCanceled.tr;
        LoggerHelper.printError('Error Message: $message');
        break;
      case DioExceptionType.connectionTimeout:
        message = ApiMessageException.connectionTimeout.tr;
        LoggerHelper.printError('Error Message: $message');

        break;
      case DioExceptionType.receiveTimeout:
        message = ApiMessageException.receiveTimeout.tr;
        LoggerHelper.printError('Error Message: $message');
        break;
      case DioExceptionType.badResponse:
        if (dioError.response!.statusCode!.toInt() == 404) {
          message = ApiMessageException.invalidUrl.tr;
        } else if (dioError.response!.statusCode!.toInt() == 401) {
          // String jsonString = dioError.response!.data;
          // Map<String, dynamic> jsonData = json.decode(jsonString);

          // message = jsonData['m'];
          message = ApiMessageException.unAuthorized.tr;
        } else if (dioError.response!.statusCode!.toInt() == 400) {
          message = ApiMessageException.badRequest.tr;
        } else if (dioError.response!.statusCode!.toInt() == 500) {
          message = ApiMessageException.internalServerError.tr;
        } else {
          message = ApiMessageException.internalServerError.tr;
        }

        LoggerHelper.printError('Error Message: $message');

        break;
      case DioExceptionType.badCertificate:
        message = ApiMessageException.badRequest.tr;
        LoggerHelper.printError('Error Message: $message');
        break;
      case DioExceptionType.sendTimeout:
        message = ApiMessageException.sendTimeout.tr;
        LoggerHelper.printError('Error Message: $message');
        break;
      case DioExceptionType.connectionError:
        message = ApiMessageException.connectionProblem.tr;
        LoggerHelper.printError('Error Message: $message');
        break;
      case DioExceptionType.unknown:
        message = ApiMessageException.connectionProblem.tr;
        LoggerHelper.printError('Error Message: $message');
        break;
      default:
        message = ApiMessageException.somethingWrong.tr;
        LoggerHelper.printError('Error Message: $message');
        break;
    }
  }

  @override
  String toString() => message;
}

class ApiMessageException {
  /// API EXCEPTIONS
  static const String requestCanceled = "Request cancelled!";
  static const String connectionTimeout = "Connection timeout!";
  static const String receiveTimeout = "Receive timeout!";
  static const String sendTimeout = "Send timeout!";
  static const String connectionProblem = "Connection problem!";
  static const String connectionError = "Connection error!";
  static const String somethingWrong = "Something went wrong!";
  static const String badRequest = "Bad request";
  static const String unAuthorized = "Unauthorized";
  static const String invalidUrl = "Invalid URL";
  static const String internalServerError = "Internal Server Error";
}
