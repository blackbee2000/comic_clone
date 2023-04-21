import 'package:comic_clone/controllers/splash_controller.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController splashController = Get.find(tag: AppRoutes.splash);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
            opacity: splashController.isShow.value ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: TextUtils.text(
              text: AppWords.wellcome.toUpperCase(),
              fontSize: 35,
              letterSpacing: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
