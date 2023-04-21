import 'package:comic_clone/controllers/comic_read_controller.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:get/get.dart';

class ComicReadBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComicReadController(), tag: AppRoutes.comicRead);
  }
}
