import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: TextUtils.text(text: AppWords.setting),
      ),
    );
  }
}
