import 'package:flutter/material.dart';
import 'package:vira_music_app/core/value/dimens.dart';

class AppBoxDecorations {
  AppBoxDecorations._();
  static BoxDecoration topContainerHomePage(List<Color> colors) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(AppDimens.radius),
      gradient: LinearGradient(colors: colors),
    );
  }
}
