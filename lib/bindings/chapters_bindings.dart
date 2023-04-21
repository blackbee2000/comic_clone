import 'package:comic_clone/controllers/chapters_controller.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:get/get.dart';

class ChaptersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChaptersController(), tag: AppRoutes.chapters);
  }
}
