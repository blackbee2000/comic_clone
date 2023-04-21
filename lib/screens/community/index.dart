import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: TextUtils.text(text: AppWords.community),
      ),
    );
  }
}
