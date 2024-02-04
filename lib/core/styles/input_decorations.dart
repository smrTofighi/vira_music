import 'package:flutter/material.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';
import 'package:vira_music_app/core/value/icons.dart';
import 'package:vira_music_app/core/value/strings.dart';

class AppInputDecorations {
  AppInputDecorations._();

  static InputDecoration searchTextField = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: EnglishStrings.hintOfSearchTextFiled,
    hintStyle: LightTextStyles.normal14(color: LightColors.greyText),
    prefixIcon: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ImageIcon(
        AppIcons.search,
        size: 12,
        color: LightColors.grey,
      ),
    ),
    contentPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: const BorderSide(color: LightColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: const BorderSide(color: LightColors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: const BorderSide(color: LightColors.primary, width: 2),
    ),
  );
}
