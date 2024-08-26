import 'dart:convert';

import 'package:get/get.dart';
import 'package:shop_cart/app/api_exceptions/api_configuration.dart';
import 'package:shop_cart/app/api_exceptions/api_snackbar_message.dart';
import 'package:shop_cart/app/helpers/logger_helper.dart';
import 'package:shop_cart/app/models/product_model.dart';
import 'package:shop_cart/app/repositories/product_repository.dart';

class HomeController extends GetxController with ApiSnackBarMessage {
  ProductRepository _productRepository = ProductRepository(APIConfigurations());

  final products = <ProductModel>[].obs;
  final isLoading = true.obs;

  var currentPage = 0.obs;

  void updatePage(int index) {
    currentPage.value = index;
  }

  @override
  void onInit() {
    super.onInit();

    getProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getProducts() async {
    try {
      final response = await _productRepository.getProducts();

      LoggerHelper.printInfo(response);
      if (response.isNotEmpty) {
        List<dynamic> jsonString = jsonDecode(response);
        products.value = jsonString
            .map((jsonMap) => ProductModel.fromJson(jsonMap))
            .toList();
      }
    } catch (e) {
      LoggerHelper.printError(e.toString());
      errorApiMessage(e);
    } finally {
      isLoading.value = false;
    }
  }
}
