import 'package:flutter/material.dart';
import 'package:vira_music_app/core/styles/box_decorations.dart';
import 'package:vira_music_app/core/styles/textstyles.dart';
import 'package:vira_music_app/core/value/colors.dart';
import 'package:vira_music_app/core/value/dimens.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.colors,
    required this.onTap,
  });
  final String title;
  final ImageProvider icon;
  final List<Color> colors;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: AppDimens.sizeOfDevice(context).width * 0.28,
        height: 75,
        decoration: AppBoxDecorations.topContainerHomePage(colors),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageIcon(
              icon,
              color: LightColors.white,
              size: 22,
            ),
            Text(
              title,
              style: LightTextStyles.bold14(
                color: LightColors.whiteText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
