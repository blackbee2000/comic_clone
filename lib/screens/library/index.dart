import 'package:comic_clone/utils/app_words.dart';
import 'package:comic_clone/widgets/text.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: TextUtils.text(text: AppWords.libraby),
      ),
    );
  }
}
