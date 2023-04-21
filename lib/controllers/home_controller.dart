import 'package:comic_clone/models/category.dart';
import 'package:comic_clone/models/comic.dart';
import 'package:comic_clone/services/api.dart';
import 'package:comic_clone/services/swagger.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  final tabCurrentIndex = 0.obs;
  final tabs = [AppWords.category, AppWords.comic];
  final categories = <Category>[].obs;
  final currentCategory = Category().obs;
  final page = 0.obs;
  final limit = 10;
  final PagingController<int, Comic> pagingController =
      PagingController(firstPageKey: 0);
  final isLoadingCategories = true.obs;

  @override
  void onInit() async {
    await getCategories().then(
      (_) => pagingController.addPageRequestListener(
        (pageKey) async {
          await getComics(pageKey);
        },
      ),
    );
    super.onInit();
  }

  void onRefresh() {
    page.value = 0;
    pagingController.refresh();
    update();
  }

  Future onRefreshCategory() async {
    isLoadingCategories.value = true;
    await getCategories();
  }

  String mixAgrWithPath(
      {required String url, required Map<String, dynamic> mixAgr}) {
    mixAgr.forEach((key, value) {
      url = url.replaceAll(key, value);
    });
    return url;
  }

  Future getComics(int pageKey) async {
    try {
      Map<String, dynamic> body = {
        'page': page.value.toString(),
        'limit': limit.toString(),
      };

      http.Response res = await AppApi.getQuery(
        path: mixAgrWithPath(
          url: SwaggerUrl.comic,
          mixAgr: {'{id}': currentCategory.value.id.toString()},
        ),
        query: body,
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = comicFromJson(res.body);
        page.value = page.value + 1;
        try {
          final isLastPage = data.length < limit;
          if (isLastPage) {
            pagingController.appendLastPage(data);
          } else {
            final nextPageKey = pageKey + data.length;
            pagingController.appendPage(data, nextPageKey);
          }
        } catch (error) {
          pagingController.error = error;
        }
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  Future<bool> getCategories() async {
    try {
      http.Response res = await AppApi.get(path: SwaggerUrl.category);
      if (res.statusCode == 200 || res.statusCode == 201) {
        isLoadingCategories.value = false;
        categories.value = categoryFromJson(res.body);
        currentCategory.value = categories.first;
        return true;
      } else {
        isLoadingCategories.value = false;
        return false;
      }
    } catch (e) {
      isLoadingCategories.value = false;
      return false;
    }
  }
}
