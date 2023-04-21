import 'package:comic_clone/models/chapter_read.dart';
import 'package:comic_clone/services/api.dart';
import 'package:comic_clone/services/swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_the_tooltip/just_the_tooltip.dart';

class ComicReadController extends GetxController {
  final isShow = false.obs;
  final sliderValue = 0.0.obs;
  final chapterRead = ChaptersRead().obs;
  final tooltipControllerBottom = JustTheController();
  final tooltipControllerTop = JustTheController();
  final backgroundColor = const Color(0xffffffff).obs;
  final fontSize = 14.0.obs;
  final isSelectedFontFamily = false.obs;
  final fontFamily = 'NunitoSans-Regular'.obs;
  final isSelectedScroll = false.obs;
  final styleRead = Axis.vertical.obs;
  final isLoading = true.obs;

  Future getChapterRead({required chapterId}) async {
    try {
      http.Response res = await AppApi.getWithId(
        path: SwaggerUrl.chaptersRead,
        id: chapterId.toString(),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        isLoading.value = false;
        chapterRead.value = chaptersReadFromJson(res.body);
      } else {
        isLoading.value = false;
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      return null;
    }
  }
}
