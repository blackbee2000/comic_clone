import 'package:comic_clone/utils/app_words.dart';
import 'package:flutter/material.dart';

class TextUtils {
  static Text text({
    required String text,
    double fontSize = 14,
    FontStyle fontStyle = FontStyle.normal,
    Color color = Colors.black,
    FontWeight? fontWeight = FontWeight.w400,
    int maxLines = 1,
    TextDecoration decoration = TextDecoration.none,
    TextAlign textAlign = TextAlign.left,
    double? height,
    TextOverflow overflow = TextOverflow.ellipsis,
    double? letterSpacing,
    String? fontFamily = AppWords.fontApp,
  }) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        decoration: decoration,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static TextStyle textStyle({
    Color color = Colors.black,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    String? fontFamily = AppWords.fontApp,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
