import 'package:comic_clone/controllers/comic_detail_controller.dart';
import 'package:comic_clone/models/chapters.dart';
import 'package:comic_clone/models/comic_detail.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/button.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ComicDetailScreen extends StatefulWidget {
  const ComicDetailScreen({super.key});

  @override
  State<ComicDetailScreen> createState() => _ComicDetailScreenState();
}

class _ComicDetailScreenState extends State<ComicDetailScreen> {
  final ComicDetailController comicDetailController =
      Get.find(tag: AppRoutes.comicDetail);
  @override
  void initState() {
    final id = Get.arguments;
    if (id != null) {
      comicDetailController.getComic(comicId: id as int);
    }
    super.initState();
  }

  Widget _itemDetail({
    required String title,
    required String value,
    Color colorValue = Colors.black,
  }) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: TextUtils.textStyle(),
        children: [
          TextSpan(
            text: value,
            style: TextUtils.textStyle(
              color: colorValue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemIcon({
    required String name,
    required IconData iconData,
    required int value,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(iconData),
          const SizedBox(height: 10),
          TextUtils.text(
            text: value != 0 ? '$name ($value)' : name,
            fontSize: 12,
          ),
        ],
      ),
    );
  }

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

  Widget _itemComment({required Comment comment}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.network(
                    comment.user != null &&
                            comment.user!.avatarFilePath != null &&
                            comment.user!.avatarFilePath!.isNotEmpty
                        ? comment.user!.avatarFilePath!
                        : '',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              TextUtils.text(
                  text: comment.user != null &&
                          comment.user!.name != null &&
                          comment.user!.name!.isNotEmpty
                      ? comment.user!.name!
                      : AppWords.nul,
                  fontWeight: FontWeight.w600),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(left: 45),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 245, 245),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils.text(
                    text: comment.content != null && comment.content!.isNotEmpty
                        ? comment.content!
                        : AppWords.nul,
                    fontSize: 12),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextUtils.text(
                      text: comment.updatedDate != null
                          ? DateFormat('HH:mm:ss dd-MM-yyyy')
                              .format(comment.updatedDate!.toLocal())
                          : AppWords.nul,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.blue,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ButtonsUtil.button(
                context: context,
                primary: Colors.blue,
                text: AppWords.readComic,
                fontSize: 18,
                textColor: Colors.white,
                onPress: () {
                  Get.toNamed(AppRoutes.comicRead,
                      arguments: comicDetailController.chapters.first.id);
                },
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.download_rounded,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + 16,
          bottom: 16,
          right: 16,
          left: 16,
        ),
        child: Obx(
          () => comicDetailController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2.2,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 60),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    comicDetailController.comic.value.poster ??
                                        '',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.error),
                                      ),
                                    ),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextUtils.text(
                              text: comicDetailController.comic.value.title !=
                                          null &&
                                      comicDetailController
                                          .comic.value.title!.isNotEmpty
                                  ? comicDetailController.comic.value.title!
                                  : AppWords.nul,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _itemDetail(
                              title: AppWords.author,
                              value: comicDetailController.comic.value.author !=
                                          null &&
                                      comicDetailController
                                          .comic.value.author!.isNotEmpty
                                  ? comicDetailController.comic.value.author!
                                  : AppWords.nul,
                              colorValue: Colors.blue,
                            ),
                            _itemDetail(
                              title: AppWords.status,
                              value: comicDetailController.comic.value.status !=
                                          null &&
                                      comicDetailController
                                          .comic.value.status!.isNotEmpty
                                  ? comicDetailController.comic.value.status!
                                  : AppWords.nul,
                            ),
                            _itemDetail(
                              title: AppWords.type,
                              value: comicDetailController
                                              .comic.value.categoryList !=
                                          null &&
                                      comicDetailController
                                          .comic.value.categoryList!.isNotEmpty
                                  ? comicDetailController
                                      .comic.value.categoryList!
                                      .join(", ")
                                  : AppWords.nul,
                              colorValue: Colors.blue,
                            ),
                            _itemDetail(
                              title: AppWords.submitDate,
                              value: comicDetailController
                                          .comic.value.uploadDate !=
                                      null
                                  ? DateFormat('HH:mm:ss dd-MM-yyyy').format(
                                      comicDetailController
                                          .comic.value.uploadDate!
                                          .toLocal())
                                  : AppWords.nul,
                            ),
                            _itemDetail(
                              title: AppWords.update,
                              value: comicDetailController
                                          .comic.value.updatedDate !=
                                      null
                                  ? DateFormat('HH:mm:ss dd-MM-yyyy').format(
                                      comicDetailController
                                          .comic.value.updatedDate!
                                          .toLocal())
                                  : AppWords.nul,
                            ),
                            _itemDetail(
                              title: AppWords.rate,
                              value:
                                  '${comicDetailController.comic.value.rateCount != null ? comicDetailController.comic.value.rateCount! : 0}/5',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextUtils.text(text: AppWords.clickStar, fontSize: 12),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: RatingBar.builder(
                              initialRating:
                                  comicDetailController.comic.value.rateCount !=
                                          null
                                      ? double.parse(comicDetailController
                                          .comic.value.rateCount!
                                          .toString())
                                      : 5.0,
                              minRating: 0,
                              allowHalfRating: true,
                              unratedColor: Colors.grey,
                              itemCount: 5,
                              itemSize: 25.0,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                              onRatingUpdate: (rating) {},
                              updateOnDrag: true,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ButtonsUtil.button(
                            context: context,
                            primary: Colors.blue,
                            text: AppWords.sendRate,
                            textColor: Colors.white,
                            onPress: () {},
                            radius: 30,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            _itemIcon(
                              name: AppWords.comment,
                              iconData: Icons.message_rounded,
                              value:
                                  comicDetailController.comic.value.comments !=
                                          null
                                      ? comicDetailController
                                          .comic.value.comments!.length
                                      : 0,
                            ),
                            const SizedBox(width: 10),
                            _itemIcon(
                              name: AppWords.rate,
                              iconData: Icons.favorite_outline,
                              value: comicDetailController
                                          .comic.value.rateCount !=
                                      null
                                  ? comicDetailController.comic.value.rateCount!
                                  : 0,
                            ),
                            const SizedBox(width: 10),
                            _itemIcon(
                              name: AppWords.nominations,
                              iconData: Icons.handshake,
                              value:
                                  comicDetailController.comic.value.favorite !=
                                              null &&
                                          comicDetailController.comic.value
                                                  .favorite!.count !=
                                              null
                                      ? comicDetailController
                                          .comic.value.favorite!.count!
                                      : 0,
                            ),
                            const SizedBox(width: 10),
                            _itemIcon(
                              name: AppWords.report,
                              iconData: Icons.flag,
                              value: 0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextUtils.text(
                              text:
                                  'Tiêu Diệp Nhiên đứng sững nhưu trời chồng, cô không sao ngờ được người phụ nữ đang quấn lấy chồng chưa cưới của mình lại chính là chị gái của mình',
                              maxLines: 100,
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextUtils.text(
                                text: AppWords.viewMore,
                                color: Colors.blue,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils.text(
                            text: AppWords.numberNew,
                            fontWeight: FontWeight.w600,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.chapters);
                            },
                            child: TextUtils.text(
                              text: AppWords.viewAll,
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<ComicDetailController>(
                        init: comicDetailController,
                        builder: (controller) => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          padding: const EdgeInsets.only(top: 16),
                          itemCount: comicDetailController.chapters.length,
                          itemBuilder: (context, index) => _itemChapter(
                              chapters: comicDetailController.chapters[index]),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils.text(
                            text: AppWords.commentNew,
                            fontWeight: FontWeight.w600,
                          ),
                          TextUtils.text(
                            text: AppWords.viewAll,
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.only(top: 16),
                        itemCount: comicDetailController.comic.value.comments !=
                                null
                            ? comicDetailController.comic.value.comments!.length
                            : 0,
                        itemBuilder: (context, index) => _itemComment(
                          comment:
                              comicDetailController.comic.value.comments != null
                                  ? comicDetailController
                                      .comic.value.comments![index]
                                  : Comment(),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
