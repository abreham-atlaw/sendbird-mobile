import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:assessment/configs/ui_configs.dart';

class BodyText extends Text {
  BodyText(text,
      {super.key,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight = FontWeight.w300,
      double? letterSpacing,
      double? height,
      super.maxLines,
      super.overflow,
      TextDecoration decoration = TextDecoration.none,
      super.textAlign})
      : super(text,
            style: TextStyle(
                height: height,
                letterSpacing: letterSpacing,
                color: color ?? ColorsConfigs.white,
                fontSize: fontSize ?? FontSizeConfigs.size1,
                decoration: decoration,
                fontWeight: fontWeight));
}
