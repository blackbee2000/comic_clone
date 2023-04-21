import 'package:comic_clone/bindings/splash_bindings.dart';
import 'package:comic_clone/routes/app_pages.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppWords.nameApp,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.list,
      initialRoute: AppRoutes.splash,
      initialBinding: SplashBindings(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: const MaterialColor(
          0xff000000,
          <int, Color>{
            50: Color(0xFF000000),
            100: Color(0xFF000000),
            200: Color(0xFF000000),
            300: Color(0xFF000000),
            400: Color(0xFF000000),
            500: Color(0xFF000000),
            600: Color(0xFF000000),
            700: Color(0xFF000000),
            800: Color(0xFF000000),
            900: Color(0xFF000000),
          },
        ),
      ),
    );
  }
}
