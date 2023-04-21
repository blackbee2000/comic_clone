import 'package:comic_clone/controllers/home_controller.dart';
import 'package:comic_clone/models/category.dart';
import 'package:comic_clone/models/comic.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/skeleton.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabBarcontroller;
  @override
  void initState() {
    tabBarcontroller = TabController(
      length: homeController.tabs.length,
      vsync: this,
    );
    super.initState();
  }

  final HomeController homeController = Get.find(tag: AppWords.home);
  Widget _itemComic({required int index, required Comic comic}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.comicDetail, arguments: comic.id);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 245, 245),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: index == (homeController.pagingController.itemList?.length)! - 1
            ? EdgeInsets.zero
            : const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        comic.poster ?? '',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
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
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils.text(
                        text: comic.title != null && comic.title!.isNotEmpty
                            ? comic.title!
                            : AppWords.nul,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      TextUtils.text(
                        text: comic.author != null && comic.author!.isNotEmpty
                            ? comic.author!
                            : AppWords.nul,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 71, 71, 71),
                      ),
                      TextUtils.text(
                        text: comic.status != null && comic.status!.isNotEmpty
                            ? comic.status!
                            : AppWords.nul,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 71, 71, 71),
                      ),
                      TextUtils.text(
                        text: comic.uploadDate != null
                            ? DateFormat('HH:mm:ss dd-MM-yyyy')
                                .format(comic.uploadDate!.toLocal())
                            : AppWords.nul,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 71, 71, 71),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: TextUtils.text(
                text: 'tf',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: const Color.fromARGB(255, 71, 71, 71),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemNameCategory({required Category category}) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 24,
      decoration: BoxDecoration(
        color: homeController.currentCategory.value.id == category.id
            ? Colors.blue
            : const Color.fromARGB(255, 231, 231, 231),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: () {
          homeController.currentCategory.value = category;
          homeController.tabCurrentIndex.value = 1;
          tabBarcontroller.index = 1;
          homeController.onRefresh();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(16),
          backgroundColor:
              homeController.currentCategory.value.id == category.id
                  ? Colors.blue
                  : const Color.fromARGB(255, 231, 231, 231),
        ),
        child: TextUtils.text(
          text: category.name != null && category.name!.isNotEmpty
              ? category.name!
              : AppWords.nul,
          fontWeight: FontWeight.w500,
          color: homeController.currentCategory.value.id == category.id
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: TextUtils.text(
          text: AppWords.home,
          color: Colors.blue,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 202, 201, 201)),
                ),
              ),
              child: DefaultTabController(
                length: homeController.tabs.length,
                initialIndex: homeController.tabCurrentIndex.value,
                child: TabBar(
                  controller: tabBarcontroller,
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.blue),
                    ),
                  ),
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextUtils.textStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  unselectedLabelStyle: TextUtils.textStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  onTap: (int index) =>
                      homeController.tabCurrentIndex.value = index,
                  tabs: homeController.tabs.map((e) => Tab(text: e)).toList(),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabBarcontroller,
                children: [
                  Obx(
                    () => RefreshIndicator(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                          bottom: 120,
                        ),
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: homeController.isLoadingCategories.value
                                ? List.generate(
                                    20,
                                    (index) => SkeletonAnimation(
                                      child: Skeleton.skeleton(
                                        context: context,
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                24,
                                        height: 50,
                                        borderRadius: 5,
                                      ),
                                    ),
                                  )
                                : homeController.categories.isNotEmpty
                                    ? homeController.categories
                                        .map((e) =>
                                            _itemNameCategory(category: e))
                                        .toList()
                                    : [],
                          ),
                        ),
                      ),
                      onRefresh: () async {
                        homeController.onRefreshCategory();
                      },
                    ),
                  ),
                  GetBuilder<HomeController>(
                    init: homeController,
                    builder: (controller) => RefreshIndicator(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                          bottom: 120,
                        ),
                        child: PagedListView<int, Comic>(
                          pagingController: homeController.pagingController,
                          builderDelegate: PagedChildBuilderDelegate<Comic>(
                            noItemsFoundIndicatorBuilder: (context) => Center(
                              child: TextUtils.text(text: AppWords.noData),
                            ),
                            firstPageProgressIndicatorBuilder: (context) =>
                                Column(
                              children: List.generate(
                                3,
                                (index) => Expanded(
                                  child: SkeletonAnimation(
                                    child: Skeleton.skeleton(
                                      context: context,
                                      width: double.infinity,
                                      height: double.infinity,
                                      borderRadius: 5,
                                      margin: index == 2
                                          ? EdgeInsets.zero
                                          : const EdgeInsets.only(bottom: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            itemBuilder: (context, item, index) => _itemComic(
                              index: index,
                              comic: item,
                            ),
                          ),
                        ),
                      ),
                      onRefresh: () async {
                        homeController.onRefresh();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
