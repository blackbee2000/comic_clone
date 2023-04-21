import 'package:comic_clone/controllers/comic_detail_controller.dart';
import 'package:comic_clone/controllers/home_controller.dart';
import 'package:comic_clone/models/chapters.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/services/api.dart';
import 'package:comic_clone/services/swagger.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChaptersController extends GetxController {
  List<Chapters> chapters = <Chapters>[].obs;
  final HomeController homeController = Get.find(tag: AppWords.home);
  final ComicDetailController comicDetailController =
      Get.find(tag: AppRoutes.comicDetail);

  @override
  void onInit() async {
    await getChapters();
    super.onInit();
  }

  Future getChapters() async {
    try {
      http.Response res = await AppApi.get(
        path: homeController.mixAgrWithPath(
          url: SwaggerUrl.chapters,
          mixAgr: {'{slug}': comicDetailController.comic.value.slug},
        ),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        chapters = chaptersFromJson(res.body);
        update();
      } else {
        update();
        return null;
      }
    } catch (e) {
      update();
      return null;
    }
  }
}
