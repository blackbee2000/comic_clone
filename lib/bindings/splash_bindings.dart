import 'package:comic_clone/controllers/splash_controller.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), tag: AppRoutes.splash);
  }
}
