import 'package:comic_clone/controllers/main_controller.dart';
import 'package:comic_clone/routes/app_routes.dart';
import 'package:comic_clone/screens/home/index.dart';
import 'package:comic_clone/screens/library/index.dart';
import 'package:comic_clone/screens/search/index.dart';
import 'package:comic_clone/screens/settings/index.dart';
import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainController mainController = Get.find(tag: AppRoutes.main);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: mainController.menuIndexCurrent.value,
          children: const [
            HomeScreen(),
            SearchScreen(),
            LibraryScreen(),
            LibraryScreen(),
            SettingScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: BottomNavigationBar(
            currentIndex: mainController.menuIndexCurrent.value,
            onTap: (int index) {
              mainController.menuIndexCurrent.value = index;
            },
            selectedLabelStyle: TextUtils.textStyle(color: Colors.blue),
            unselectedLabelStyle: TextUtils.textStyle(color: Colors.grey),
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: AppWords.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: AppWords.search,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_add),
                label: AppWords.libraby,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: AppWords.community,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppWords.setting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
