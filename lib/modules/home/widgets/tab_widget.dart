import 'package:flutter/material.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.title,
    required this.active,
    required this.onTap,
  });
  final String title;
  final bool active;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        opacity: active ? 1 : 0.5,
        duration: const Duration(milliseconds: 350),
        child: Column(
          children: [
            Text(
              title,
              style: active
                  ? LightTextStyles.bold18()
                  : LightTextStyles.normal18(),
            ),
            Container(
              width: 20,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: active ? LightColors.primary : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
