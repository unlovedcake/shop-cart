import 'package:shop_cart/app/api_exceptions/api_exceptions.dart';
import 'package:shop_cart/app/helpers/custom_snackbar.dart';

mixin ApiSnackBarMessage {
  void errorApiMessage(error) {
    var errorText = DioExceptions.fromDioError(error).toString();

    CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error',
        message: errorText,
        duration: const Duration(seconds: 4));
  }

  void successApiMessage(message) {
    CustomSnackBar.showCustomSuccessSnackBar(
        title: 'Success',
        message: message,
        duration: const Duration(seconds: 4));
  }

  void errorMessageService(errorMessage) {
    CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error',
        message: errorMessage,
        duration: const Duration(seconds: 4));
  }
}
