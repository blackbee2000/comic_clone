import 'package:comic_clone/controllers/home_controller.dart';
import 'package:comic_clone/controllers/main_controller.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), tag: AppRoutes.main);
    Get.lazyPut(() => HomeController(), tag: AppWords.home);
  }
}
