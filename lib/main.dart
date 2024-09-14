import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) =>
    GetMaterialApp(
        
        title: "Application",
        //  builder: (context, child) => ResponsiveBreakpoints.builder(
        //   child: child!,
        //   breakpoints: [
        //     const Breakpoint(start: 0, end: 450, name: MOBILE),
        //     const Breakpoint(start: 451, end: 800, name: TABLET),
        //     const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        //     const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        //   ],
        // ),
        initialRoute: AppPages.DASHBOARD,
        getPages: AppPages.routes,
      ),
  ));
}
