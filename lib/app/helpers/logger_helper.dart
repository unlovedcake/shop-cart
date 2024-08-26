import 'package:logger/logger.dart';

class LoggerHelper {
  static final Logger _logger = Logger();

  static void printInfo(String message) {
    _logger.d(message);
  }

  static void printError(dynamic error) {
    _logger.e(error);
  }
}
