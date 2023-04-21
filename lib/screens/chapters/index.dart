import 'package:comic_clone/controllers/chapters_controller.dart';
import 'package:comic_clone/models/chapters.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChaptersScreen extends StatefulWidget {
  const ChaptersScreen({super.key});

  @override
  State<ChaptersScreen> createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  final ChaptersController chaptersController =
      Get.find(tag: AppRoutes.chapters);
  Widget _itemChapter({required Chapters chapters}) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.comicRead, arguments: chapters.id);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 245, 245),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextUtils.text(
          text: chapters.header != null && chapters.header!.isNotEmpty
              ? chapters.header!
              : AppWords.nul,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        centerTitle: false,
        title: TextUtils.text(
          text: AppWords.chapters,
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<ChaptersController>(
            init: chaptersController,
            builder: (controller) => ListView.builder(
              itemCount: chaptersController.chapters.length,
              itemBuilder: (context, index) => _itemChapter(
                chapters: chaptersController.chapters[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
