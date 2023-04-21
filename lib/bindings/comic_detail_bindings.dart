import 'package:comic_clone/controllers/comic_detail_controller.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:get/get.dart';

class ComicDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComicDetailController(), tag: AppRoutes.comicDetail);
  }
}
