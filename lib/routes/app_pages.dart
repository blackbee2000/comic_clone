import 'package:comic_clone/bindings/chapters_bindings.dart';
import 'package:comic_clone/bindings/comic_detail_bindings.dart';
import 'package:comic_clone/bindings/comic_read_bindings.dart';
import 'package:comic_clone/bindings/main_bindings.dart';
import 'package:comic_clone/screens/chapters/index.dart';
import 'package:comic_clone/screens/comic-detail/index.dart';
import 'package:comic_clone/screens/comic-read/index.dart';
import 'package:comic_clone/screens/main/index.dart';
import 'package:comic_clone/screens/splash/index.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBindings(),
    ),
    GetPage(
      name: AppRoutes.comicDetail,
      page: () => const ComicDetailScreen(),
      binding: ComicDetailBindings(),
    ),
    GetPage(
      name: AppRoutes.comicRead,
      page: () => const ComicReadScreen(),
      binding: ComicReadBindings(),
    ),
    GetPage(
      name: AppRoutes.chapters,
      page: () => const ChaptersScreen(),
      binding: ChaptersBindings(),
    ),
  ];
}
