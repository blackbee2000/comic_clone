import 'package:comic_clone/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final isShow = false.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1)).then((_) => isShow.value = true);
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Get.offAllNamed(AppRoutes.main),
    );
    super.onInit();
  }
}
