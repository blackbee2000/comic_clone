import 'package:comic_clone/controllers/home_controller.dart';
import 'package:comic_clone/models/chapters.dart';
import 'package:comic_clone/models/comic_detail.dart';
import 'package:comic_clone/services/api.dart';
import 'package:comic_clone/services/swagger.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ComicDetailController extends GetxController {
  final comic = ComicDetail().obs;
  List<Chapters> chapters = <Chapters>[].obs;
  final isLoading = true.obs;
  final HomeController homeController = Get.find(tag: AppWords.home);

  Future getComic({required int comicId}) async {
    try {
      http.Response res = await AppApi.getWithId(
        path: SwaggerUrl.comicDetail,
        id: comicId.toString(),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        isLoading.value = false;
        comic.value = comicDetailFromJson(res.body);
        await getChapters(slug: comic.value.slug ?? '');
      } else {
        isLoading.value = false;
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      return null;
    }
  }

  Future getChapters({required String slug}) async {
    try {
      http.Response res = await AppApi.get(
        path: homeController.mixAgrWithPath(
          url: SwaggerUrl.chapters,
          mixAgr: {'{slug}': slug},
        ),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        chapters = chaptersFromJson(res.body).sublist(0, 5);
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
