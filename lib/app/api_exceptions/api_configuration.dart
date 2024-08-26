import 'package:shop_cart/app/constants/global_variables.dart';
import 'package:shop_cart/app/enums/enviroment_enum.dart';

class APIConfigurations {
  static String baseUrl = 'https://api.escuelajs.co/api/v1/';

  static String getProducts = 'products/';
  static String getProductsFilter = 'products-filter/';

  static String getBaseUrl() {
    switch (GlobalVariables.applicationMode) {
      case Environment.development:
        return baseUrl = 'https://api.escuelajs.co/api/v1/';
      case Environment.uat:
        return baseUrl = 'https://fakeapi.platzi.com/en/rest/';
      case Environment.production:
        return baseUrl = 'https://fakeapi.platzi.com/en/rest/';
      case Environment.qa:
        return baseUrl = 'https://fakeapi.platzi.com/en/rest/';
    }
  }
}
