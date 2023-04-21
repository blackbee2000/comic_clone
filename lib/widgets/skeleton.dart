import 'package:flutter/material.dart';

class Skeleton {
  static Widget skeleton({
    required BuildContext context,
    double? borderRadius,
    BoxShape shape = BoxShape.rectangle,
    required double width,
    required double height,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        color: Colors.grey.withOpacity(0.2),
        shape: shape,
      ),
    );
  }
}
