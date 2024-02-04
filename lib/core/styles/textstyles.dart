import 'package:flutter/material.dart';
import 'package:vira_music_app/core/value/colors.dart';

class LightTextStyles {
  LightTextStyles._();
  static TextStyle bold14({Color color = LightColors.blackText}) {
    return TextStyle(
      fontSize: 14,
      color: color,
      fontWeight: FontWeight.bold
    );
  }
  static TextStyle bold16({Color color = LightColors.blackText}) {
    return TextStyle(
      fontSize: 16,
      color: color,
      fontWeight: FontWeight.bold
    );
  }
  static TextStyle bold18({Color color = LightColors.blackText}) {
    return TextStyle(
      fontSize: 18,
      color: color,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle normal14({Color color = LightColors.blackText}) {
    return TextStyle(
      fontSize: 14,
      color: color,
    );
  }
  static TextStyle normal16({Color color = LightColors.blackText}) {
    return TextStyle(
      fontSize: 16,
      color: color,
    );
  }
  static TextStyle normal18({Color color = LightColors.blackText}) {
    return TextStyle(
      fontSize: 18,
      color: color,
    );
  }

  static TextStyle normal12({Color color = LightColors.blackText}) {
    return TextStyle(
      fontSize: 12,
      color: color,
    );
  }
}
