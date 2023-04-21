import 'package:comic_clone/controllers/chapters_controller.dart';
import 'package:comic_clone/controllers/comic_read_controller.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class ComicReadScreen extends StatefulWidget {
  const ComicReadScreen({super.key});

  @override
  State<ComicReadScreen> createState() => _ComicReadScreenState();
}

class _ComicReadScreenState extends State<ComicReadScreen> {
  final ComicReadController comicReadController =
      Get.find(tag: AppRoutes.comicRead);
  @override
  void initState() {
    final id = Get.arguments;
    if (id != null) {
      comicReadController.getChapterRead(chapterId: id as int);
    }
    super.initState();
  }

  Widget slider({
    required double value,
    required double max,
    required int divisions,
    required Function(double) setValue,
  }) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.black,
        inactiveTrackColor: Colors.grey,
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
        trackHeight: 1.5,
        thumbColor: Colors.black,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
        valueIndicatorTextStyle: TextUtils.textStyle(
          color: const Color(0xff2F2F2F),
          fontWeight: FontWeight.w500,
        ),
        valueIndicatorColor: const Color(0xffF0F3F8),
      ),
      child: Slider(
        value: value,
        label: value.round().toString(),
        min: 0,
        max: max,
        divisions: divisions,
        onChanged: (double values) {
          setValue(values);
        },
      ),
    );
  }

  Widget _toolTip({required String type}) {
    return Obx(
      () => JustTheTooltip(
        tailBaseWidth: 18,
        tailLength: 12,
        barrierDismissible: false,
        isModal: true,
        controller: type == 'top'
            ? comicReadController.tooltipControllerTop
            : comicReadController.tooltipControllerBottom,
        content: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.all(10.0),
          height: 180,
          child: comicReadController.isSelectedFontFamily.value
              ? Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 221, 221, 221),
                          ),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: TextUtils.text(
                              text: AppWords.selectedFont,
                              fontSize: 12,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: GestureDetector(
                              onTap: () {
                                comicReadController.isSelectedFontFamily.value =
                                    false;
                                type == 'top'
                                    ? comicReadController.tooltipControllerTop
                                        .hideTooltip()
                                    : comicReadController
                                        .tooltipControllerBottom
                                        .hideTooltip();
                                Future.delayed(
                                        const Duration(milliseconds: 300))
                                    .then((_) => type == 'top'
                                        ? comicReadController
                                            .tooltipControllerTop
                                            .showTooltip()
                                        : comicReadController
                                            .tooltipControllerBottom
                                            .showTooltip());
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          comicReadController.fontFamily.value =
                              'NunitoSans-Regular';
                          comicReadController.update();
                        },
                        child: Row(
                          children: [
                            Obx(
                              () => Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Icon(
                                  Icons.check,
                                  color: comicReadController.fontFamily.value ==
                                          'NunitoSans-Regular'
                                      ? Colors.black
                                      : Colors.transparent,
                                  size: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 221, 221, 221),
                                    ),
                                  ),
                                ),
                                child:
                                    TextUtils.text(text: AppWords.nunitoSans),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          comicReadController.fontFamily.value =
                              'New-York-Extra';
                          comicReadController.update();
                        },
                        child: Row(
                          children: [
                            Obx(
                              () => Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Icon(
                                  Icons.check,
                                  color: comicReadController.fontFamily.value ==
                                          'New-York-Extra'
                                      ? Colors.black
                                      : Colors.transparent,
                                  size: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 221, 221, 221),
                                    ),
                                  ),
                                ),
                                child:
                                    TextUtils.text(text: AppWords.newYorkExtra),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          comicReadController.fontFamily.value = 'OpenSans';
                          comicReadController.update();
                        },
                        child: Row(
                          children: [
                            Obx(
                              () => Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Icon(
                                  Icons.check,
                                  color: comicReadController.fontFamily.value ==
                                          'OpenSans'
                                      ? Colors.black
                                      : Colors.transparent,
                                  size: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 221, 221, 221),
                                    ),
                                  ),
                                ),
                                child: TextUtils.text(text: AppWords.openSans),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : comicReadController.isSelectedScroll.value
                  ? Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221),
                              ),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: TextUtils.text(
                                  text: AppWords.selectedScroll,
                                  fontSize: 12,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    comicReadController.isSelectedScroll.value =
                                        false;
                                    type == 'top'
                                        ? comicReadController
                                            .tooltipControllerTop
                                            .hideTooltip()
                                        : comicReadController
                                            .tooltipControllerBottom
                                            .hideTooltip();
                                    Future.delayed(
                                            const Duration(milliseconds: 300))
                                        .then((_) => type == 'top'
                                            ? comicReadController
                                                .tooltipControllerTop
                                                .showTooltip()
                                            : comicReadController
                                                .tooltipControllerBottom
                                                .showTooltip());
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              comicReadController.styleRead.value =
                                  Axis.vertical;
                              comicReadController.update();
                            },
                            child: Row(
                              children: [
                                Obx(
                                  () => Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Icon(
                                      Icons.check,
                                      color:
                                          comicReadController.styleRead.value ==
                                                  Axis.vertical
                                              ? Colors.black
                                              : Colors.transparent,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromARGB(
                                              255, 221, 221, 221),
                                        ),
                                      ),
                                    ),
                                    child: TextUtils.text(
                                        text: AppWords.verticalScroll),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              comicReadController.styleRead.value =
                                  Axis.horizontal;
                              comicReadController.update();
                            },
                            child: Row(
                              children: [
                                Obx(
                                  () => Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Icon(
                                      Icons.check,
                                      color:
                                          comicReadController.styleRead.value ==
                                                  Axis.horizontal
                                              ? Colors.black
                                              : Colors.transparent,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromARGB(
                                              255, 221, 221, 221),
                                        ),
                                      ),
                                    ),
                                    child: TextUtils.text(
                                        text: AppWords.horizontalScroll),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 30,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    comicReadController.fontSize.value = 14.0;
                                    comicReadController.update();
                                  },
                                  child: TextUtils.text(
                                    text: 'A',
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: double.infinity,
                                color: const Color.fromARGB(255, 221, 221, 221),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    comicReadController.fontSize.value = 20.0;
                                    comicReadController.update();
                                  },
                                  child: TextUtils.text(
                                    text: 'A',
                                    fontSize: 20,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            comicReadController.isSelectedFontFamily.value =
                                true;
                            type == 'top'
                                ? comicReadController.tooltipControllerTop
                                    .hideTooltip()
                                : comicReadController.tooltipControllerBottom
                                    .hideTooltip();
                            Future.delayed(const Duration(milliseconds: 300))
                                .then((_) => type == 'top'
                                    ? comicReadController.tooltipControllerTop
                                        .showTooltip()
                                    : comicReadController
                                        .tooltipControllerBottom
                                        .showTooltip());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtils.text(
                                text: AppWords.font,
                              ),
                              TextUtils.text(
                                  text: comicReadController.fontFamily.value ==
                                          'NunitoSans-Regular'
                                      ? AppWords.nunitoSans
                                      : comicReadController.fontFamily.value ==
                                              'New-York-Extra'
                                          ? AppWords.newYorkExtra
                                          : AppWords.openSans,
                                  fontSize: 12,
                                  color:
                                      const Color.fromARGB(255, 113, 113, 113))
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: const Color.fromARGB(255, 221, 221, 221),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              radius: 30,
                              onTap: () {
                                comicReadController.backgroundColor.value =
                                    const Color(0xffffffff);
                                comicReadController.update();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: comicReadController
                                                  .backgroundColor.value ==
                                              const Color(0xffffffff)
                                          ? Colors.black
                                          : Colors.transparent),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            InkWell(
                              radius: 30,
                              onTap: () {
                                comicReadController.backgroundColor.value =
                                    const Color.fromARGB(255, 156, 150, 105);
                                comicReadController.update();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 156, 150, 105),
                                  border: Border.all(
                                      color: comicReadController
                                                  .backgroundColor.value ==
                                              const Color.fromARGB(
                                                  255, 156, 150, 105)
                                          ? Colors.brown
                                          : Colors.transparent),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            InkWell(
                              radius: 30,
                              onTap: () {
                                comicReadController.backgroundColor.value =
                                    const Color.fromARGB(255, 35, 35, 35);
                                comicReadController.update();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 35, 35, 35),
                                  border: Border.all(
                                    color: comicReadController
                                                .backgroundColor.value ==
                                            const Color.fromARGB(
                                                255, 35, 35, 35)
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            InkWell(
                              radius: 30,
                              onTap: () {
                                comicReadController.backgroundColor.value =
                                    const Color(0xff000000);
                                comicReadController.update();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: comicReadController
                                                  .backgroundColor.value ==
                                              const Color(0xff000000)
                                          ? Colors.white
                                          : Colors.transparent),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 3,
                          color: const Color.fromARGB(255, 221, 221, 221),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            comicReadController.isSelectedScroll.value = true;
                            type == 'top'
                                ? comicReadController.tooltipControllerTop
                                    .hideTooltip()
                                : comicReadController.tooltipControllerBottom
                                    .hideTooltip();
                            Future.delayed(const Duration(milliseconds: 300))
                                .then((_) => type == 'top'
                                    ? comicReadController.tooltipControllerTop
                                        .showTooltip()
                                    : comicReadController
                                        .tooltipControllerBottom
                                        .showTooltip());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtils.text(
                                text: AppWords.styleRead,
                              ),
                              TextUtils.text(
                                  text: comicReadController.styleRead.value ==
                                          Axis.vertical
                                      ? AppWords.verticalScroll
                                      : AppWords.horizontalScroll,
                                  fontSize: 12,
                                  color:
                                      const Color.fromARGB(255, 113, 113, 113))
                            ],
                          ),
                        ),
                      ],
                    ),
        ),
        child: IconButton(
          onPressed: () {
            type == 'top'
                ? comicReadController.tooltipControllerTop.showTooltip()
                : comicReadController.tooltipControllerBottom.showTooltip();
          },
          icon: Icon(
            Icons.settings,
            size: 24,
            color: comicReadController.backgroundColor.value == Colors.white ||
                    comicReadController.backgroundColor.value ==
                        const Color.fromARGB(255, 156, 150, 105)
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        comicReadController.isShow.value = !comicReadController.isShow.value;
        comicReadController.tooltipControllerTop.hideTooltip();
        comicReadController.tooltipControllerBottom.hideTooltip();
      },
      child: Obx(
        () => Scaffold(
          backgroundColor: comicReadController.backgroundColor.value,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top,
                    bottom: MediaQuery.of(context).viewPadding.bottom,
                    left: 16,
                    right: 16,
                  ),
                  child: comicReadController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: comicReadController.styleRead.value,
                          itemCount:
                              comicReadController.chapterRead.value.body != null
                                  ? comicReadController
                                      .chapterRead.value.body!.length
                                  : 0,
                          itemBuilder: (context, index) => SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: GetBuilder<ComicReadController>(
                                init: comicReadController,
                                builder: (controller) => Html(
                                  data:
                                      controller.chapterRead.value.body != null
                                          ? controller
                                              .chapterRead.value.body![index]
                                          : '',
                                  style: {
                                    "p": Style(
                                      color: controller.backgroundColor.value ==
                                                  Colors.white ||
                                              controller
                                                      .backgroundColor.value ==
                                                  const Color.fromARGB(
                                                      255, 156, 150, 105)
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize:
                                          FontSize(controller.fontSize.value),
                                      fontFamily: controller.fontFamily.value,
                                    ),
                                    "span": Style(
                                      color: controller.backgroundColor.value ==
                                                  Colors.white ||
                                              controller
                                                      .backgroundColor.value ==
                                                  const Color.fromARGB(
                                                      255, 156, 150, 105)
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize:
                                          FontSize(controller.fontSize.value),
                                      fontFamily: controller.fontFamily.value,
                                    ),
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                Obx(
                  () => AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    top: comicReadController.isShow.value ? 0 : -200,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).viewPadding.top + 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: comicReadController.backgroundColor.value,
                        border: const Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 204, 204, 204)),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 24,
                                      color: comicReadController
                                                      .backgroundColor.value ==
                                                  Colors.white ||
                                              comicReadController
                                                      .backgroundColor.value ==
                                                  const Color.fromARGB(
                                                      255, 156, 150, 105)
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.chapters);
                                    },
                                    icon: Icon(
                                      Icons.list,
                                      size: 24,
                                      color: comicReadController
                                                      .backgroundColor.value ==
                                                  Colors.white ||
                                              comicReadController
                                                      .backgroundColor.value ==
                                                  const Color.fromARGB(
                                                      255, 156, 150, 105)
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  _toolTip(type: 'top'),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.flag,
                                      size: 24,
                                      color: comicReadController
                                                      .backgroundColor.value ==
                                                  Colors.white ||
                                              comicReadController
                                                      .backgroundColor.value ==
                                                  const Color.fromARGB(
                                                      255, 156, 150, 105)
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextUtils.text(
                              text: comicReadController
                                              .chapterRead.value.story !=
                                          null &&
                                      comicReadController
                                              .chapterRead.value.story!.title !=
                                          null &&
                                      comicReadController.chapterRead.value
                                          .story!.title!.isNotEmpty
                                  ? comicReadController
                                      .chapterRead.value.story!.title!
                                  : AppWords.nul,
                              fontSize: 24,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    bottom: comicReadController.isShow.value ? 0 : -200,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: comicReadController.backgroundColor.value,
                        border: const Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 204, 204, 204)),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: slider(
                              value: comicReadController.sliderValue.value,
                              max: 100,
                              divisions: 100,
                              setValue: (double value) {
                                comicReadController.sliderValue.value = value;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextUtils.text(
                            text: '${AppWords.chapter} 1/85',
                            fontSize: 11,
                            color: comicReadController.backgroundColor.value ==
                                        Colors.white ||
                                    comicReadController.backgroundColor.value ==
                                        const Color.fromARGB(255, 156, 150, 105)
                                ? Colors.black
                                : Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.chapters);
                                },
                                icon: Icon(
                                  Icons.list,
                                  size: 24,
                                  color: comicReadController
                                                  .backgroundColor.value ==
                                              Colors.white ||
                                          comicReadController
                                                  .backgroundColor.value ==
                                              const Color.fromARGB(
                                                  255, 156, 150, 105)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              _toolTip(type: 'bottom'),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.message,
                                  size: 24,
                                  color: comicReadController
                                                  .backgroundColor.value ==
                                              Colors.white ||
                                          comicReadController
                                                  .backgroundColor.value ==
                                              const Color.fromARGB(
                                                  255, 156, 150, 105)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              TextUtils.text(
                                text: AppWords.viewComic,
                                fontSize: 13,
                                color:
                                    comicReadController.backgroundColor.value ==
                                                Colors.white ||
                                            comicReadController
                                                    .backgroundColor.value ==
                                                const Color.fromARGB(
                                                    255, 156, 150, 105)
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
