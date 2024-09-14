import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_cart/app/api_exceptions/api_configuration.dart';
import 'package:shop_cart/app/api_exceptions/api_snackbar_message.dart';
import 'package:shop_cart/app/helpers/logger_helper.dart';
import 'package:shop_cart/app/models/product_model.dart';
import 'package:shop_cart/app/repositories/product_repository.dart';

class HomeController extends GetxController with ApiSnackBarMessage {
  ProductRepository _productRepository = ProductRepository(APIConfigurations());

  final products = <ProductModel>[].obs;
  final getProductId = [].obs;
  final isLoading = true.obs;
  var currentPage = 0.obs;

 




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

             getProductIds();
      }
    } catch (e) {
      LoggerHelper.printError(e.toString());
      errorApiMessage(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveProductId(String productId) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedIds = prefs.getStringList('favoriteProductIds') ?? [];

  // Check if the product ID is already saved, if not, add it
  if (!savedIds.contains(productId)) {
    savedIds.add(productId);
    await prefs.setStringList('favoriteProductIds', savedIds);
  }
}

Future<void> removeProductId(String productId) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedIds = prefs.getStringList('favoriteProductIds') ?? [];

  // Check if the product ID is in the list, if so, remove it
  if (savedIds.contains(productId)) {
    savedIds.remove(productId);
    await prefs.setStringList('favoriteProductIds', savedIds);
  }
}
 void updatePage(int index) {
    currentPage.value = index;
  }

  Future<void> getProductIds() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedIds = prefs.getStringList('favoriteProductIds') ?? [];

  getProductId.value = savedIds;
}
}
