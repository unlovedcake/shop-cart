import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_cart/app/models/product_model.dart';
import 'package:shop_cart/app/modules/cart/views/cart_view.dart';
import 'package:shop_cart/app/modules/home/views/home_view.dart';
import 'package:shop_cart/app/modules/profile/views/profile_view.dart';
import 'package:shop_cart/app/widgets/responsive_text_widget.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
   DashboardView({super.key});


  @override
  Widget build(BuildContext context) {

    
    SizeConfig.init(context);
    List<Widget> _buildScreens() {
    return [    HomeView(),    CartView(),    ProfileView(),  ];
    }
       double screenWidth = MediaQuery.of(context).size.width;

    // Define icon and text size based on screen width
    double iconSize = screenWidth < 600 ? 24 : 36; // Smaller on mobile, larger on desktop
    double textSize = screenWidth < 600 ? 12 : 16;

    List<PersistentBottomNavBarItem> _navBarsItems(){
      return [

        PersistentBottomNavBarItem(
          icon:  Icon(Icons.home,size:  SizeConfig.getIconSize(30)),
          title: "Home",
          textStyle: TextStyle(fontSize: SizeConfig.getScaledFontSize(12) ),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ), 
        PersistentBottomNavBarItem(
          
           icon:  Icon(Icons.shopping_cart,size:  SizeConfig.getIconSize(30)),
          title: "Settings",
          textStyle: TextStyle(fontSize: SizeConfig.getScaledFontSize(12) ),
          // inactiveIcon: const Icon(
          //   Icons.shopping_cart_outlined,
          //   color: Colors.grey,
          // ),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),

        PersistentBottomNavBarItem(
             icon:  Icon(Icons.person,size:  SizeConfig.getIconSize(30)),
          title: "Profile",
          textStyle: TextStyle(fontSize: SizeConfig.getScaledFontSize(12) ),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        )

      ];


    }

    PersistentTabController controller;
 double bottomNavHeight = screenWidth < 600 ? 56 : 150;
    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
    navBarHeight:  SizeConfig.getBottomNavHeight(56),
      bottomScreenMargin: 4,
      padding: EdgeInsets.symmetric(vertical: 8),
      context,
      screens:_buildScreens(),
      items: _navBarsItems(),
      controller: controller,
     animationSettings: NavBarAnimationSettings(
       navBarItemAnimation: const ItemAnimationSettings(
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    ),
     screenTransitionAnimation:  ScreenTransitionAnimationSettings(
      screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
      animateTabTransition: true,
      curve: Curves.ease,
      duration: Duration(milliseconds: 200),
    ),
    ),
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
    
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
    
     
      navBarStyle:
      NavBarStyle.style6,
    
    
    );
  }}

