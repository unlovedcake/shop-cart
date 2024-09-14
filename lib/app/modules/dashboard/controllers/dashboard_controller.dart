

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class DashboardController extends GetxController {
 


 


  final selectedIndex = 0.obs;

   void onItemTapped(int index) {

      selectedIndex.value = index;
   
  }

  @override
  void onInit() {
    super.onInit();

   
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
